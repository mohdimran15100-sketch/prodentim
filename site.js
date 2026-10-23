document.addEventListener('DOMContentLoaded', function () {
  var toggle = document.getElementById('nav-toggle');
  var menu = document.querySelector('nav.links');
  var menuLabel = document.querySelector('label[for="nav-toggle"]');

  if (toggle && menu) {
    menu.id = menu.id || 'primary-navigation';
    if (menuLabel) {
      menuLabel.setAttribute('role', 'button');
      menuLabel.setAttribute('tabindex', '0');
      menuLabel.setAttribute('aria-label', 'Toggle navigation');
      menuLabel.setAttribute('aria-controls', menu.id);
      menuLabel.setAttribute('aria-expanded', String(toggle.checked));
      menuLabel.addEventListener('keydown', function (event) {
        if (event.key === 'Enter' || event.key === ' ') {
          event.preventDefault();
          toggle.checked = !toggle.checked;
          toggle.dispatchEvent(new Event('change'));
        }
      });
    }
    menu.classList.toggle('is-open', toggle.checked);
    toggle.addEventListener('change', function () {
      menu.classList.toggle('is-open', toggle.checked);
      if (menuLabel) {
        menuLabel.setAttribute('aria-expanded', String(toggle.checked));
      }
    });
    menu.querySelectorAll('a').forEach(function (link) {
      link.addEventListener('click', function () {
        toggle.checked = false;
        menu.classList.remove('is-open');
        if (menuLabel) {
          menuLabel.setAttribute('aria-expanded', 'false');
        }
      });
    });
  }

});
