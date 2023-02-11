function approve_request() {
  var request = $("#StockRequestApprove");
  var target = request.attr("target");
  var form = new FormData();
  form.append("approve", 1);
  $.ajax({
    type: "POST",
    url: target,
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      ajax_response(data);
    },
  });
}
function fetchRequestDetails() {
  var table = $("#ProductStock").DataTable({
    language: lang,
    stateSave: true,
    bDestroy: true,
    ordering: false,
    searching: false,
    paging: false,
    info: false,
    columnDefs: [
      {
        targets: [0, 1, 2, 3, 4], // your case first column
        className: "text-center",
      },
    ],
  });
  var form = new FormData();
  form.append("fetchStockRequestLines", 1);
  $.ajax({
    type: "POST",
    url: target,
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      table.clear().draw();
      $.each(data, function (index, value) {
        table.row
          .add([
            value.num_row,
            value.warehouse,
            value.product,
            value.quantity,
            '<a class="btn btn-xs btn-default" onclick="removeAJAX(' +
              value.id +
              ')"><span class="fas fa-trash"></span></a>',
          ])
          .draw();
      });
    },
  });
}
function addNewStockRequestLine() {
  $("#addNewStockRequestLine").submit(function (e) {
    e.preventDefault();
    var form = $(this);
    var target = form.attr("target");
    var formdata = new FormData(this);
    formdata.append("addNewStockRequestLine", 1);
    $.ajax({
      type: "POST",
      url: target,
      data: formdata ? formdata : form.serialize(),
      cache: false,
      contentType: false,
      processData: false,
      success: function (data) {
        $("#stockQuantity").val("");
        fetchRequestDetails();
      },
    });
    formdata.delete();
    return false;
  });
}
function removeStockRequestLine(id) {
  var request = $("#addNewStockRequestLine");
  var target = request.attr("target");
  var form = new FormData();
  form.append("removeStockRequestLine", 1);
  form.append("id", id);
  $.ajax({
    type: "POST",
    url: target,
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      fetchRequestDetails();
    },
  });
}
function sendStockRequest(id) {
  var request = $("#addNewStockRequestLine");
  var target = request.attr("target");
  var form = new FormData();
  form.append("sendStockRequest", 1);
  form.append("id", id);
  $.ajax({
    type: "POST",
    url: target,
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      ajax_response(data);
    },
  });
}
function decline_request() {
  var request = $("#StockRequestDecline");
  var target = request.attr("target");
  var form = new FormData();
  form.append("decline", 1);
  $.ajax({
    type: "POST",
    url: target,
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      ajax_response(data);
    },
  });
}
