$(document).ready(function () {});
function validOrder() {
  var form = new FormData();
  form.append("validOrder", 1);
  form.append("supplier", $("#supplier").val());
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
function addNewShoppingOrderLine() {
  $("#ShoppingOrderForm").submit(function (e) {
    e.preventDefault();
    var form = $(this);
    var formdata = new FormData(this);
    formdata.append("addNewShoppingOrderLine", 1);
    $.ajax({
      type: "POST",
      data: formdata ? formdata : form.serialize(),
      cache: false,
      contentType: false,
      processData: false,
      success: function (data) {
        fetchShoppingLines();
        $("#warehouse").val("-1").trigger("change");
        $("#product").val("-1").trigger("change");
        $("#profit").val("");
        $("#stockQuantity").val("");
      },
    });
    formdata.delete();
    return false;
  });
}
function sendShoppingOrder() {
  validOrder();
  UpdateRate();
  var form = new FormData();
  form.append("sendShoppingOrder", 1);
  form.append("comments", $("#comments").val());
  $.ajax({
    type: "POST",
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      $("#warehouse").val("-1").trigger("change");
      $("#product").val("-1").trigger("change");
      $("#profit").val("");
      $("#stockQuantity").val("");
      ajax_response(data);
      // response_save();
    },
  });
  form.delete();
  return false;
}
function UpdateRate() {
  var form = new FormData();
  form.append("UpdateRate", 1);
  form.append("rate", $("#exchangeRate").val());
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
function fetchShoppingLines() {
  var table = $("#ShoppingDetails").DataTable({
    language: lang,
    stateSave: true,
    bDestroy: true,
    ordering: false,
    searching: false,
    paging: false,
    info: false,
    columnDefs: [
      {
        targets: [0, 3, 4, 6], // your case first column
        className: "text-center",
      },
      {
        targets: [5], // your case first column
        className: "text-right",
      },
    ],
  });
  var form = new FormData();
  form.append("fetchShoppingDetails", 1);
  $.ajax({
    type: "POST",
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      table.clear().draw();
      var total_usd = 0;
      var total = 0;
      $.each(data, function (index, value) {
        // var subTotal = value.price_cost * value.quantity * value.exchange_rate;
        // var subTotalUSD = value.price_cost * value.quantity;
        table.row
          .add([
            value.num_row,
            value.warehouse,
            value.product,
            value.profit_margin + "%",
            value.quantity,
            formatMoney(value.sub_bs, 2, ",", ".") +
              '<br><span class="text-success">' +
              formatMoney(value.sub_usd, 2, ".", ",") +
              "</span>",
            '<a class="btn btn-xs btn-default" onclick="removeShoppingOrderLine(' +
              value.id +
              ')"><span class="fas fa-trash"></span></a>',
          ])
          .draw();
        total += Number(value.sub_bs);
        total_usd += Number(value.sub_usd);
      });
      $("#ShoppingOrderTotals").html(
        "Bs. " +
          formatMoney(total.toFixed(2), 2, ",", ".") +
          " $ " +
          formatMoney(total_usd.toFixed(2), 2, ".", ",")
      );
      $("#ShoppingOrderTotals").css("display", "block");
      var newForm = new FormData();
      newForm.append("UpdateAmounts", 1);
      newForm.append("bs", total);
      newForm.append("usd", total_usd);
      $.ajax({
        type: "POST",
        data: newForm,
        cache: false,
        contentType: false,
        processData: false,
        success: function (data) {
          ajax_response(data);
        },
      });
    },
  });
  form.delete();
}
function removeShoppingOrderLine(id) {
  var form = new FormData();
  form.append("removeShoppingOrderLine", 1);
  form.append("id", id);
  $.ajax({
    type: "POST",
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      fetchShoppingLines();
    },
  });
  formdata.delete();
}
