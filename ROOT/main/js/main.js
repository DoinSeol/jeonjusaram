var fullpage;

$(function() {
  var main_visual = new Swiper("#main_visual > .swiper-container", {
    loop: true,
    centeredSlides: true,
    speed: 700,
    autoplay: {
      delay: 4000,
      disableOnInteraction: false
    },
    navigation: {
      nextEl: "#main_visual > .swiper-container .swiper-button-next",
      prevEl: "#main_visual > .swiper-container .swiper-button-prev"
    },
    pagination: {
      el: "#main_visual > .swiper-container .swiper-pagination-num",
      type: "fraction",
    }

  });
  // var main_visual_paging = new Swiper("#main_visual > .swiper-container", {
  //   pagination: {
  //     el: "#main_visual > .swiper-container .swiper-pagination-dot",
  //     type: "bullets",
  //     clickable: true
  //   },
  // });
  
  // main_visual.controller.control = main_visual_paging;

  $("#main_visual > .swiper-container .swiper-button-prev-d").on("click", function(e) {
    main_visual.slidePrev();
  });
  $("#main_visual > .swiper-container .swiper-button-next-d").on("click", function(e) {
    main_visual.slideNext();
  });
  $("#main_visual > .swiper-container .swiper-button-play").on("click", function(e) {
    main_visual.autoplay.stop();
    main_visual.autoplay.start();
  });
  $("#main_visual > .swiper-container .swiper-button-pause").on("click", function(e) {
    main_visual.autoplay.stop();
  });


  var pop_zone = new Swiper("#pop_zone .swiper-container", {
    loop: true,
    centeredSlides: true,
    speed: 700,
    autoplay: {
      delay: 4000,
      disableOnInteraction: false
    },
    navigation: {
      nextEl: "#pop_zone .swiper-button-next",
      prevEl: "#pop_zone .swiper-button-prev"
    },
    pagination: {
      el: "#pop_zone .pop_zone-pagination-num",
      type: "fraction",
    },
  });

  $("#pop_zone .swiper-button-playpause").on("click", function(e) {
    var b = $("#pop_zone .swiper-button-playpause").hasClass("on");

    if (!b) {
      pop_zone.autoplay.stop();
      $("#pop_zone .swiper-button-playpause").addClass("on");
    } else {
      pop_zone.autoplay.stop();
      pop_zone.autoplay.start();
      $("#pop_zone .swiper-button-playpause").removeClass("on");
    }
  });

  $("#section02 .tab_menu a").on("click", function(e) {
    e.preventDefault();
    $("#section02 .tab_menu li").removeClass("on");
    $(this)
      .parents("li")
      .addClass("on");
    $("#section02 .tab_menu a").attr("aria-selected", "false");
    $(this).attr("aria-selected", "true");

    var id = $(this).attr("aria-controls");
    $("#section02 .board").removeClass("on");
    $("#" + id).addClass("on");
  });

  var activity_swiper = new Swiper("#activity_swiper .swiper-container", {
    loop: true,
    speed: 700,
    slidesPerView: 2,
    spaceBetween: 20,
    navigation: {
      nextEl: ".activity_swiper_control .swiper-button-next",
      prevEl: ".activity_swiper_control .swiper-button-prev"
    },
    breakpoints: {
      1260: {
        slidesPerView: 2,
        spaceBetween: 20
      },
      768: {
        slidesPerView: 1,
        spaceBetween: 20
      },
      450: {
        slidesPerView: 1,
        spaceBetween: 10
      }
    }
  });

  var welfare_swiper = new Swiper("#welfare_swiper .swiper-container", {
    loop: true,
    speed: 700,
    slidesPerView: 5,
    spaceBetween: 20,
    navigation: {
      nextEl: "#welfare_swiper .swiper-button-next",
      prevEl: "#welfare_swiper .swiper-button-prev"
    },
    breakpoints: {
      1260: {
        slidesPerView: 4,
        spaceBetween: 15
      },
      920: {
        slidesPerView: 3,
        spaceBetween: 15
      },
      450: {
        slidesPerView: 2,
        spaceBetween: 10
      }
    }
  });

  var welfare_swiper = new Swiper("#fban_swiper .swiper-container", {
    loop: true,
    speed: 700,
    slidesPerView: 4,
    spaceBetween: 3,
    navigation: {
      nextEl: "#fban_swiper .swiper-button-next",
      prevEl: "#fban_swiper .swiper-button-prev"
    },
    breakpoints: {
      1260: {
        slidesPerView: 3,
        spaceBetween: 2
      },
      768: {
        slidesPerView: 2,
        spaceBetween: 7
      }
    }
  });

  $(window).on("resize", function() {
    resizeFn();
  });
  function resizeFn() {}
  resizeFn();
});
