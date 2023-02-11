$(document).ready(function () {
  $(".loader").hide();
});

function loader() {
  $(".loader").show();
  $("html, body").css({
    overflow: "hidden",
    height: "100%",
  });
}

function hideLoader() {
  $(".loader").hide();
  $("html, body").css({
    overflow: "auto",
    height: "auto",
  });
}
