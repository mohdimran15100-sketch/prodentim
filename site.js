document.addEventListener('DOMContentLoaded', function () {
  var toggle = document.getElementById('nav-toggle');
  var menu = document.querySelector('nav.links');
  var menuLabel = document.querySelector('label[for="nav-toggle"]');

  if (toggle && menu) {
    menu.id = menu.id || 'primary-navigation';
    toggle.setAttribute('aria-controls', menu.id);
    toggle.setAttribute('aria-expanded', 'false');
    if (menuLabel) {
      menuLabel.setAttribute('role', 'button');
      menuLabel.setAttribute('tabindex', '0');
      menuLabel.setAttribute('aria-label', 'Toggle navigation');
      menuLabel.addEventListener('keydown', function (event) {
        if (event.key === 'Enter' || event.key === ' ') {
          event.preventDefault();
          toggle.checked = !toggle.checked;
          toggle.dispatchEvent(new Event('change'));
        }
      });
    }
    toggle.addEventListener('change', function () {
      toggle.setAttribute('aria-expanded', String(toggle.checked));
    });
    menu.querySelectorAll('a').forEach(function (link) {
      link.addEventListener('click', function () {
        toggle.checked = false;
        toggle.setAttribute('aria-expanded', 'false');
      });
    });
  }

});
