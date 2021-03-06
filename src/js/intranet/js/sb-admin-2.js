function FixCommercePopups() {
    $('a[href*="/p/"]').each(function(index, item) {
        var href = $(item).attr("href");
        $(item).attr("href", "");
        $(item).attr("data-popup", "true");
        var text = $(item).text();
        if (text == null || text.length <= 0 || text == "") {
            text = $(item).parent().find(".minium-card__name").text();
        }
        $(item).click(function(e) {
            e.preventDefault();
            popup(href, text);
        });
    });
    $('a[href*="pending-orders"]').each(function(index, item) {
        var href = $(item).attr("href");
        $(item).attr("href", "");
        $(item).attr("data-popup", "true");
        var text = $(item).text();
        if (text == null || text.length <= 0 || text == "") {
            text = $(item).parent().find(".minium-card__name").text();
        }
        $(item).click(function(e) {
            e.preventDefault();
            popup(href, text);
        });
    });
    $('.popup').each(function(index, item) {
        var href = $(item).attr("href");
        $(item).attr("data-popup", "true");
        $(item).attr("href", "");
        var text = $(item).text();
        $(item).click(function(e) {
            e.preventDefault();
            popup(href, text);
        });

    });
    $('button[data-onclick="toggleAccountSelector"]').on("click", function() {
        $('a[href*="pending-orders"]').each(function(index, item) {
            var href = $(item).attr("href");
            $(item).attr("href", "");
            $(item).attr("data-popup", "true");
            var text = $(item).text();
            if (text == null || text.length <= 0 || text == "") {
                text = $(item).parent().find(".minium-card__name").text();
            }
            $(item).click(function(e) {
                e.preventDefault();
                popup(href, text);
            });
        });
    });
}
$(function() {
    // FixCommercePopups();
});

function delay(time) {
    return new Promise(resolve => setTimeout(resolve, time));
}

function popup(url, title) {
    //notificationsModal
    $("#notificationsModalTitle").text(title);
    $("#notificationsFrame").hide();
    $('#notificationsModal').modal('show');
    $("#notificationsFrame").attr('src', url);
    $("#notificationsFrame").on("load", function() {
        let head = $("#notificationsFrame").contents().find("head");
        let css = `<style>
        .lfr-product-menu-panel
            {
                display:none!important;
            }
        #wrapper
            {
                padding:0!important;
            }
        .control-menu-container
            {
                display:none!important;
            }
        </style>`;
        $(head).append(css);

    });
    window.setTimeout(() => {
        $("#notificationsFrame").show();
    }, 1000); // 5 seconds

}
(function($) {
    "use strict"; // Start of use strict
    // Toggle the side navigation
    $("#sidebarToggle, #sidebarToggleTop").on('click', function(e) {
        $("body").toggleClass("sidebar-toggled");
        $(".sidebar").toggleClass("toggled");
        if ($(".sidebar").hasClass("toggled")) {
            $('.sidebar .collapse').collapse('hide');
        };
    });

    // Close any open menu accordions when window is resized below 768px
    $(window).resize(function() {
        if ($(window).width() < 768) {
            $('.sidebar .collapse').collapse('hide');
        };

        // Toggle the side navigation when window is resized below 480px
        if ($(window).width() < 480 && !$(".sidebar").hasClass("toggled")) {
            $("body").addClass("sidebar-toggled");
            $(".sidebar").addClass("toggled");
            $('.sidebar .collapse').collapse('hide');
        };
    });

    // Prevent the content wrapper from scrolling when the fixed side navigation hovered over
    $('body.fixed-nav .sidebar').on('mousewheel DOMMouseScroll wheel', function(e) {
        if ($(window).width() > 768) {
            var e0 = e.originalEvent,
                delta = e0.wheelDelta || -e0.detail;
            this.scrollTop += (delta < 0 ? 1 : -1) * 30;
            e.preventDefault();
        }
    });

    // Scroll to top button appear
    $(document).on('scroll', function() {
        var scrollDistance = $(this).scrollTop();
        if (scrollDistance > 100) {
            $('.scroll-to-top').fadeIn();
        } else {
            $('.scroll-to-top').fadeOut();
        }
    });

    // Smooth scrolling using jQuery easing
    $(document).on('click', 'a.scroll-to-top', function(e) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($anchor.attr('href')).offset().top)
        }, 1000, 'easeInOutExpo');
        e.preventDefault();
    });

})(jQuery); // End of use strict