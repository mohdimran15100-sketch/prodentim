[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string[]]$Urls
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$siteHost = 'www.priodentim.com'
$key = (Get-Content -Raw (Join-Path $PSScriptRoot '..\019de53d2ca0d96b03c6651870a697bf.txt')).Trim()

if ($key -notmatch '^[A-Za-z0-9-]{8,128}$') {
    throw 'The IndexNow key file is missing or has an invalid key.'
}

$canonicalUrls = @(
    foreach ($url in $Urls) {
        $parsedUrl = $null
        if (-not [uri]::TryCreate($url, [UriKind]::Absolute, [ref]$parsedUrl)) {
            throw "Invalid absolute URL: $url"
        }
        if ($parsedUrl.Scheme -ne 'https' -or $parsedUrl.Host -ne $siteHost -or $parsedUrl.Fragment) {
            throw "Only canonical HTTPS URLs on $siteHost without fragments may be submitted: $url"
        }
        $parsedUrl.AbsoluteUri
    }
) | Select-Object -Unique

if ($canonicalUrls.Count -gt 10000) {
    throw 'IndexNow accepts at most 10,000 URLs per request.'
}

$payload = @{
    host        = $siteHost
    key         = $key
    keyLocation = "https://$siteHost/019de53d2ca0d96b03c6651870a697bf.txt"
    urlList     = @($canonicalUrls)
} | ConvertTo-Json -Depth 4

try {
    $response = Invoke-WebRequest `
        -Uri 'https://api.indexnow.org/indexnow' `
        -Method Post `
        -ContentType 'application/json; charset=utf-8' `
        -Body $payload
}
catch {
    throw "IndexNow submission failed: $($_.Exception.Message)"
}

if ([int]$response.StatusCode -notin @(200, 202)) {
    throw "IndexNow returned HTTP $([int]$response.StatusCode); URLs were not confirmed as received."
}

Write-Output "IndexNow returned HTTP $([int]$response.StatusCode) for $($canonicalUrls.Count) URL(s). Receipt is not a guarantee of crawling, indexing, or ranking."
