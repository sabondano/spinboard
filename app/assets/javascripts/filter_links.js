$(document).on('ready page:load', function () {
  searchLinks();
  filterByStatus();
  sortAlphabetically();
});

function searchLinks() {
  $("#q").on('keyup', function() {
    $( ".link" ).children(".title").each( function( index, element ){
      var findMatchForTitle = $(this).text().toLowerCase().indexOf($("#q").val().toLowerCase());

      if ( findMatchForTitle >= 0 ) {
        $(this).closest(".link").show();
      } else if ( findMatchForTitle == -1 ) {
        $(this).closest(".link").hide();
      }
    });
  });
};

function filterByStatus() {
  $("#btn-show-all").on('click', function () {
    $(".link").show();
  });

  $("#btn-show-read").on('click', function () {
    $(".link").hide();
    $(".link-read-true").show();
  });

  $("#btn-show-unread").on('click', function () {
    $(".link").hide();
    $(".link-read-false").show();
  });
};

function sortAlphabetically() {
  $("#links").tablesorter();
};

