$(".main-menu-wapper").click(() => {
    if ($(".block-nav-categori").hasClass("active")) {
        $(".block-nav-categori").removeClass("active")
        $(".verticalmenu-content").removeClass("show-up")
    } else {
        $(".block-nav-categori").addClass("active")
        $(".verticalmenu-content").addClass("show-up")
    }

});