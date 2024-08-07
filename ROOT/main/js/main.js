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



  // 탭_공지사항
  $("#section01 .inwrap .main_content_boardTab .tab_menu a").on("click", function(e) {
    e.preventDefault();
    $("#section01 .inwrap .main_content_boardTab .tab_menu li").removeClass("on");
    $(this)
      .parents("li")
      .addClass("on");
    $("#section01 .inwrap .main_content_boardTab .tab_menu a").attr("aria-selected", "false");
    $(this).attr("aria-selected", "true");

    var id = $(this).attr("aria-controls");
    $("#section01 .inwrap .main_content_boardTab .board").removeClass("on");
    $("#" + id).addClass("on");
  });

  // 후원하기
  $('#section02 .inwrap .main_cont_sponsor_03 .spon_bottom_cont .spon_amount .spon_amount_bt.spon_amount_txt input').click(function() {
    $("input:radio[name=spon_amount_radio]:checked")[0].checked = false;
  });

  $('#section02 .inwrap .main_cont_sponsor_03 .spon_bottom_cont .spon_amount .spon_amount_bt input[type=radio]').click(function(){
    var spon_checked = $('input[name=spon_amount_radio]').is(":checked");
    if (spon_chedked = 'true') {
      $('#section02 .inwrap .main_cont_sponsor_03 .spon_bottom_cont .spon_amount .spon_amount_bt.spon_amount_txt input[type="text"]').val('');
    }
  });

  $('#section02 .inwrap .main_cont_sponsor_03 .spon_bottom_cont .spon_amount .spon_amount_bt input[type=radio]').focus(function(){
    $(this).siblings('label').css({'outline':'medium solid #000'});
  });

  $('#section02 .inwrap .main_cont_sponsor_03 .spon_bottom_cont .spon_amount .spon_amount_bt input[type=radio]').blur(function(){
    $(this).siblings('label').css('outline', 'none');
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
      1000: {
        slidesPerView: 2,
        spaceBetween: 14
      },
      768: {
        slidesPerView: 1,
        spaceBetween: 14
      },
      600: {
        slidesPerView: 1,
        spaceBetween: 14
      },
      500: {
        slidesPerView: 2,
        spaceBetween: 10
      },
      400: {
        slidesPerView: 1,
        spaceBetween: 10
      }
    }
  });

  // var welfare_swiper = new Swiper("#welfare_swiper .swiper-container", {
  //   loop: true,
  //   speed: 700,
  //   slidesPerView: 5,
  //   spaceBetween: 20,
  //   navigation: {
  //     nextEl: "#welfare_swiper .swiper-button-next",
  //     prevEl: "#welfare_swiper .swiper-button-prev"
  //   },
  //   breakpoints: {
  //     1260: {
  //       slidesPerView: 4,
  //       spaceBetween: 15
  //     },
  //     920: {
  //       slidesPerView: 3,
  //       spaceBetween: 15
  //     },
  //     450: {
  //       slidesPerView: 2,
  //       spaceBetween: 10
  //     }
  //   }
  // });

  var welfare_swiper = new Swiper("#sponsor_swiper_01 .swiper-container", {
    loop: true,
    speed: 700,
    slidesPerView: 5,
    spaceBetween: 3,
    navigation: {
      nextEl: "#sponsor_swiper_01 .swiper-button-next",
      prevEl: "#sponsor_swiper_01 .swiper-button-prev"
    },
    breakpoints: {
      1260: {
        slidesPerView: 4,
        spaceBetween: 2
      },
      900: {
        slidesPerView: 3,
        spaceBetween: 2
      },
      768: {
        slidesPerView: 2,
      },
      500: {
        slidesPerView: 1,
      }
    }
  });

  var welfare_swiper = new Swiper("#sponsor_swiper_02 .swiper-container", {
    loop: true,
    speed: 700,
    slidesPerView: 5,
    spaceBetween: 3,
    navigation: {
      nextEl: "#sponsor_swiper_02 .swiper-button-next",
      prevEl: "#sponsor_swiper_02 .swiper-button-prev"
    },
    breakpoints: {
      1260: {
        slidesPerView: 4,
        spaceBetween: 2
      },
      900: {
        slidesPerView: 3,
        spaceBetween: 2
      },
      768: {
        slidesPerView: 2,
      },
      500: {
        slidesPerView: 1,
      }
    }
  });


  $('.business_text').hide();
  $('.business_tab a').click(function () {
    $('.business_text').hide().filter(this.hash).fadeIn();
    $('.business_tab').removeClass('on');
    $(this).closest(".business_tab").addClass('on');
    return false;
  }).filter(':eq(0)').click();




  $(window).on("resize", function() {
    resizeFn();
  });
  function resizeFn() {}
  resizeFn();
});
