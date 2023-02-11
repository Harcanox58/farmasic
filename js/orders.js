$(document).ready(function () {
  changeStatusAJAX();
});

function changeStatusAJAX() {
  $("#changeStatus a").click(function () {
    var status = $(this).attr("value");
    var color;
    switch (status) {
      case "C":
        color = "success";
        break;
      case "X":
        color = "default bg-navy";
        break;
      case "A":
        color = "default bg-indigo";
        break;
      case "R":
        color = "danger";
        break;
      default:
        color = "default";
        break;
    }
    $('button[data-toggle="dropdown"]').attr(
      "class",
      "btn btn-block dropdown-toggle"
    );
    $('button[data-toggle="dropdown"]').toggleClass("disabled btn-" + color);
    $('button[data-toggle="dropdown"]').text($(this).text());
    var form = new FormData();
    form.append("processOrder", true);
    form.append("op_status", status);
    $.ajax({
      type: "POST",
      data: form,
      cache: false,
      contentType: false,
      processData: false,
      success: function (data) {
        if (status != "X") {
          $(".printBtn").attr("disabled", false);
        }
      },
    });
  });
}
function _printInvoice(id, type) {
  var form = new FormData();
  form.append("printInvoice", true);
  form.append("id", id);
  form.append("print_type", type);
  $.ajax({
    type: "POST",
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      ajax_response(data);
    },
  });
}
function _printDelivery(id) {
  form.append("printDelivery", true);
  form.append("id", id);
  $.ajax({
    type: "POST",
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {},
  });
}
