param(
  [string]$Path = (Split-Path -Parent $PSScriptRoot),
  [switch]$FailOnWarning
)

$ErrorActionPreference = 'Stop'
$textExtensions = @(
  '.html', '.css', '.js', '.mjs', '.cjs', '.ts', '.tsx', '.jsx',
  '.json', '.md', '.txt', '.text', '.xml', '.yml', '.yaml', '.toml', '.csv',
  '.svg', '.ps1', '.sh', '.bat', '.cmd', '.sql', '.ini', '.config'
)
$excludedPath = '[\\/](?:\.git|node_modules|dist|build|out|coverage|\.vercel|vendor)[\\/]'
$strictUtf8 = [System.Text.UTF8Encoding]::new($false, $true)
$issues = [System.Collections.Generic.List[object]]::new()
$scanned = 0

$rules = @(
  [pscustomobject]@{
    Severity = 'ERROR'
    Pattern = '\u00E2\u20AC(?:\u2122|\u0153|\u201C|\u201D|\u2013|\u2014|\u00A6)|\u00E2\u2020\u2019'
    Message = 'Known UTF-8/Windows-1252 mojibake sequence'
  }
  [pscustomobject]@{
    Severity = 'ERROR'
    Pattern = '\uFFFD'
    Message = 'Unicode replacement character'
  }
  [pscustomobject]@{
    Severity = 'WARNING'
    Pattern = '\u00C2|\u00C3|\u00F0\u0178|\u00EF\u00BB\u00BF'
    Message = 'Suspicious encoding prefix; verify in context'
  }
  [pscustomobject]@{
    Severity = 'INFO'
    Pattern = '\u0026amp;#(?:x[0-9a-f]+|[0-9]+);'
    Message = 'Potentially double-escaped HTML numeric entity'
  }
)

Get-ChildItem -LiteralPath $Path -Recurse -File -Force |
  Where-Object {
    $_.Extension.ToLowerInvariant() -in $textExtensions -and
    $_.FullName -notmatch $excludedPath
  } |
  ForEach-Object {
    $file = $_
    $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
    try {
      $content = $strictUtf8.GetString($bytes)
    }
    catch [System.Text.DecoderFallbackException] {
      $issues.Add([pscustomobject]@{
        Severity = 'ERROR'
        File = $file.FullName
        Line = 1
        Text = 'File is not valid UTF-8'
      })
      return
    }

    $scanned++
    $hasBom = $content.Length -gt 0 -and $content[0] -eq [char]0xFEFF
    if ($hasBom) {
      $issues.Add([pscustomobject]@{
        Severity = 'INFO'
        File = $file.FullName
        Line = 1
        Text = 'UTF-8 BOM present (valid UTF-8)'
      })
    }

    $lines = $content -split "`r?`n"
    for ($index = 0; $index -lt $lines.Length; $index++) {
      foreach ($rule in $rules) {
        $match = [System.Text.RegularExpressions.Regex]::Match(
          $lines[$index],
          $rule.Pattern,
          [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
        )
        if ($match.Success) {
          $start = [Math]::Max(0, $match.Index - 24)
          $length = [Math]::Min(80, $lines[$index].Length - $start)
          $snippet = $lines[$index].Substring($start, $length).Trim()
          $issues.Add([pscustomobject]@{
            Severity = $rule.Severity
            File = $file.FullName
            Line = $index + 1
            Text = "$($rule.Message): $snippet"
          })
        }
      }
    }

    if ($file.Extension -ieq '.html') {
      $html = $content.TrimStart([char]0xFEFF, [char]0x20, [char]0x09, [char]0x0D, [char]0x0A)
      $head = [System.Text.RegularExpressions.Regex]::Match(
        $html,
        '(?is)<head\b[^>]*>(.*?)</head>'
      )
      $firstHeadTag = if ($head.Success) {
        [System.Text.RegularExpressions.Regex]::Match($head.Groups[1].Value, '(?is)^\s*(<[^>]+>)').Groups[1].Value
      } else {
        ''
      }
      if ($firstHeadTag -notmatch '(?i)^<meta\s+charset\s*=\s*["'']?utf-8') {
        $issues.Add([pscustomobject]@{
          Severity = 'ERROR'
          File = $file.FullName
          Line = 1
          Text = 'UTF-8 charset declaration must be the first element inside <head>'
        })
      }
    }
  }

$issues |
  Sort-Object Severity, File, Line |
  ForEach-Object {
    Write-Output ('{0} {1}:{2}: {3}' -f $_.Severity, $_.File, $_.Line, $_.Text)
  }

$errors = @($issues | Where-Object Severity -eq 'ERROR').Count
$warnings = @($issues | Where-Object Severity -eq 'WARNING').Count
$infos = @($issues | Where-Object Severity -eq 'INFO').Count
Write-Output "Scanned $scanned UTF-8 text files; $errors error(s), $warnings warning(s), $infos informational note(s)."

if ($errors -gt 0 -or ($FailOnWarning -and $warnings -gt 0)) {
  exit 1
}
