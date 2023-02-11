function CallProductNameField(id) {
  var field = $("#productNameField");
  if (field.val() != "") {
    var form = new FormData();
    form.append("newProduct", 1);
    form.append("name", field.val().toUpperCase());
    form.append("id", id);
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
}
function uploadProductIMG() {
  $("#ProductForm").submit(function (e) {
    e.preventDefault();
    var form = $(this);
    var formdata = new FormData(this);
    formdata.append("uploadProductIMG", 1);
    $.ajax({
      type: "POST",
      data: formdata ? formdata : form.serialize(),
      cache: false,
      contentType: false,
      processData: false,
      success: function (data) {
        var display = $("#ProductDisplayIMG");
        var uri = display.attr("baseUrl");
        var fileName = $("input:file")
          .val()
          .match(/[^\\/]*$/)[0];
        display.attr("src", uri + "p/" + fileName);
        $("#ProductInputIMG").value = null;
        $("#removeIMGButton").css("display", "block");
      },
    });
    return false;
  });
}
function removeProductIMG() {
  var form = new FormData();
  var id = $("#id").val();
  form.append("removeProductIMG", 1);
  form.append("id", id);
  $.ajax({
    type: "POST",
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    traditional: true,
    success: function (data) {
      var display = $("#ProductDisplayIMG");
      var uri = display.attr("baseUrl");
      display.attr("src", uri + "empty.png");
      $("#ProductInputIMG").value = null;
      $("#removeIMGButton").css("display", "none");
    },
  });
}
function prepareUpdateProductStock(warehouse, quantity) {
  $("#warehouse").val(warehouse).trigger("change");
  $("#quantity").val(quantity);
}
function updateProductStock() {
  var form = new FormData();
  form.append("id_product", $("#id").val());
  form.append("updateProductStock", 1);
  form.append("id_warehouse", $("#warehouse").val());
  form.append("quantity", $("#quantity").val());
  $.ajax({
    type: "POST",
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      $("#warehouse").val("-1").trigger("change");
      $("#quantity").val("");
      fetchProductStock();
    },
  });
}
function fetchProductStock() {
  var table = $("#fetchProductStock").DataTable({
    language: lang,
    stateSave: true,
    bDestroy: true,
    ordering: false,
    searching: false,
    paging: false,
    info: false,
    columnDefs: [
      {
        targets: [0, 1, 2, 3], // your case first column
        className: "text-center",
      },
    ],
  });
  var form = new FormData();
  form.append("fetchProductStock", 1);
  form.append("id", $("#id").val());
  $.ajax({
    type: "POST",
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
            value.current_stock,
            '<a class="btn btn-xs btn-default" onclick="prepareUpdateProductStock(' +
              value.id_warehouse +
              "," +
              value.current_stock +
              "," +
              value.id_stock +
              ')"><span class="fas fa-pencil"></span></a>',
          ])
          .draw();
      });
    },
  });
}
function saveProduct() {
  $("#ProductForm").submit(function (e) {
    e.preventDefault();
    var form = $(this);
    var formdata = new FormData(this);
    formdata.append("saveProduct", 1);
    $.ajax({
      type: "POST",
      data: formdata ? formdata : form.serialize(),
      cache: false,
      contentType: false,
      processData: false,
      success: function (data) {
        ajax_response(data);
      },
    });
    formdata.delete();
    return false;
  });
}
function getProductStatus(id) {
  var form = new FormData();
  form.append("getProductStatus", 1);
  form.append("id", id);
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
