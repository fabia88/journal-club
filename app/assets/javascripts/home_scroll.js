$(document).ready(function() {

  $(window).scroll(function () {
    //if you hard code, then use console
    //.log to determine when you want the
    //nav bar to stick.
    console.log($(window).scrollTop())
    if ($(window).scrollTop() > 608) {
      $('.pages-home .navbar-journal').addClass('navbar-opaque');
    }
    if ($(window).scrollTop() < 609) {
      $('.pages-home .navbar-journal').removeClass('navbar-opaque');
    }
  });
});
