import './bootstrap';

// Initialize AOS (Animate On Scroll)
if (typeof AOS !== 'undefined') {
  AOS.init({
    duration: 800,
    easing: 'ease-in-out',
    once: true,
    offset: 100,
    delay: 0,
  });
}

$(document).ready(function () {
  $('.menu-toggle').click(function () {
    $('.primary-navs').toggleClass('active');
  });
  $('.featured-slider').slick({
    dots: false,
    infinite: true,
    speed: 300,
    slidesToShow: 4,
    centerMode: true,
    centerPadding: '150px',
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 3000,
    prevArrow: $('.featured-prev-arrow'),
    nextArrow: $('.featured-next-arrow'),
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 3,
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 1,
        }
      },
    ]
  });
  $('.service-cat-slider').slick({
    dots: false,
    infinite: true,
    speed: 300,
    slidesToShow: 2,
    slidesToScroll: 1,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 3000,
    prevArrow: $('.service-cat-prev-arrow'),
    nextArrow: $('.service-cat-next-arrow'),
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 3,
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 2,
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
        }
      }
    ]
  });

  $('.service-detail-main-slider').slick({
    dots: false,
    infinite: true,
    speed: 500,
    fade: true,
    cssEase: 'linear',
    autoplay: true,
    autoplaySpeed: 3000,
    arrows: true,
    prevArrow: '<button type="button" class="slick-prev"><i class="fa-solid fa-chevron-left"></i></button>',
    nextArrow: '<button type="button" class="slick-next"><i class="fa-solid fa-chevron-right"></i></button>',
    appendDots: '.service-detail-slider-dots',
    responsive: [
      {
        breakpoint: 768,
        settings: {
          arrows: false,
          dots: true
        }
      }
    ]
  });

  (function () {
    const wrapperId = 'services-wrapper';

    function loadPage(url) {
      const wrapper = document.getElementById(wrapperId);
      if (!wrapper) return;

      fetch(url, {
        headers: { 'X-Requested-With': 'XMLHttpRequest' }
      })
        .then(res => res.text())
        .then(html => {
          wrapper.innerHTML = html;
          window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    }

    // 🔥 INITIAL STATE (VERY IMPORTANT)
    history.replaceState(
      { page: window.location.href },
      '',
      window.location.href
    );

    // Pagination click
    document.addEventListener('click', function (e) {
      const link = e.target.closest('.pagination a');
      if (!link) return;

      e.preventDefault();
      const url = link.href;
      history.pushState({ page: url }, '', url);
      loadPage(url);
    });

    // 🔥 Back / Forward button (FINAL FIX)
    window.addEventListener('popstate', function () {
      loadPage(window.location.href);
    });

  })();

  
});

