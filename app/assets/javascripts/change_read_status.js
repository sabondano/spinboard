$(document).on('ready page:load', function() {
  $(".btn-mark-as-read").on("ajax:success", function(event, data, status, xhr) {
    var $link = $("#"+data.id);
    $link.children(".title, .url")
         .removeClass("read-false")
         .addClass("read-true");

    $link.children(".read-status")
         .text("true");

    $link.find(".btn-mark-as-read").hide();
    $link.find(".btn-mark-as-unread").show();
  }); 

  $(".btn-mark-as-unread").on("ajax:success", function(event, data, status, xhr) {
    var $link = $("#"+data.id);
    $link.children(".title, .url")
         .removeClass("read-true")
         .addClass("read-false");

    $link.children(".read-status")
         .text("false");

    $link.find(".btn-mark-as-unread").hide();
    $link.find(".btn-mark-as-read").show();
  }); 
});


