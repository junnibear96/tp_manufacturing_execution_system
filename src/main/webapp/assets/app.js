(function () {
  function isSamePath(a, b) {
    // Normalize to just the file name for simple deployments.
    var pa = (a || '').split('?')[0].split('#')[0];
    var pb = (b || '').split('?')[0].split('#')[0];
    pa = pa.substring(pa.lastIndexOf('/') + 1);
    pb = pb.substring(pb.lastIndexOf('/') + 1);
    return pa === pb;
  }

  // Mark active page link.
  try {
    var links = document.querySelectorAll('a[data-nav="page"]');
    var current = window.location.pathname;
    links.forEach(function (a) {
      if (isSamePath(a.getAttribute('href'), current) || (current.endsWith('/') && a.getAttribute('href') === 'index.jsp')) {
        a.setAttribute('aria-current', 'page');
      }
    });
  } catch (e) {
    // no-op
  }

  // Smooth scroll for anchor links on the same page.
  document.addEventListener('click', function (e) {
    var target = e.target;
    if (!(target instanceof Element)) return;
    var a = target.closest('a[data-nav="anchor"]');
    if (!a) return;

    var href = a.getAttribute('href') || '';
    if (!href.startsWith('#')) return;

    var el = document.querySelector(href);
    if (!el) return;

    e.preventDefault();
    el.scrollIntoView({ behavior: 'smooth', block: 'start' });
    history.replaceState(null, '', href);
  });

  // Copy-to-clipboard for code samples.
  document.addEventListener('click', function (e) {
    var target = e.target;
    if (!(target instanceof Element)) return;
    var btn = target.closest('[data-copy]');
    if (!btn) return;

    var selector = btn.getAttribute('data-copy');
    if (!selector) return;
    var el = document.querySelector(selector);
    if (!el) return;

    var text = (el.innerText || el.textContent || '').trimEnd();
    if (!text) return;

    var original = btn.textContent;

    function done(ok) {
      btn.textContent = ok ? '복사됨' : '복사 실패';
      btn.setAttribute('aria-live', 'polite');
      setTimeout(function () {
        btn.textContent = original;
      }, 900);
    }

    if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(text).then(function () { done(true); }).catch(function () { done(false); });
      return;
    }

    // Fallback
    try {
      var ta = document.createElement('textarea');
      ta.value = text;
      ta.setAttribute('readonly', '');
      ta.style.position = 'absolute';
      ta.style.left = '-9999px';
      document.body.appendChild(ta);
      ta.select();
      var ok = document.execCommand('copy');
      document.body.removeChild(ta);
      done(!!ok);
    } catch (_e) {
      done(false);
    }
  });
})();
