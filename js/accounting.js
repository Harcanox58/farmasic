function frozeType() {
  var form = new FormData();
  form.append("frozeType", 1);
  form.append("type", $("#type").val());
  $.ajax({
    type: "POST",
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      ajax_response(data);
      $("#type").attr("disabled", "disabled");
      $("#corelative").html(data);
    },
  });
}
function frozeEntity() {
  var form = new FormData();
  form.append("frozeEntity", 1);
  form.append("entity", $("#entity").val());
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
function fetchEntryDetails() {
  var table = $("#fetchEntryDetails").DataTable({
    language: lang,
    stateSave: true,
    bDestroy: true,
    ordering: false,
    searching: false,
    paging: false,
    info: false,
    columnDefs: [
      {
        targets: [2, 3], // your case first column
        className: "text-right",
      },
    ],
  });
  var form = new FormData();
  form.append("fetchEntryDetails", 1);
  $.ajax({
    type: "POST",
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    beforeSend: function () {},
    success: function (data) {
      table.clear().draw();
      $.each(data.lines, function (index, value) {
        table.row
          .add([
            value.code + "-" + value.name,
            value.desc,
            formatMoney(value.debit, 2, ",", "."),
            formatMoney(value.credit, 2, ",", "."),
            '<button type="button" onclick="removeEntryLine(' +
              value.id +
              ')" style="border:none;background:none;"><span class="text-primary fas fa-trash"></span></button>',
          ])
          .draw();
      });
      console.log("diff: " + data.ammounts.diff);
      $("#total_debit").html(data.ammounts.debit);
      $("#total_credit").html(data.ammounts.credit);
      $("#descuadre").html(data.ammounts.diff);
      if (data.ammounts.diff == 0) {
        $("#diferencia").css("display", "none");
      }
      if (data.ammounts.diff != 0) {
        $("#diferencia").css("display", "block");
        $("#diferencia").html(
          '<span  class="badge badge-danger text-md mr-1">DIFERENCIA:</span><span class="text-bold text-md"> ' +
            data.ammounts.diff +
            "</span>"
        );
      }
    },
  });
}
function addNewEntryDetail() {
  var form = new FormData();
  form.append("addNewEntryDetail", 1);
  form.append("account", $("#account").val());
  form.append("desc", $("#desc").val().toUpperCase());
  form.append("debit", $("#debit").val());
  form.append("credit", $("#credit").val());
  $.ajax({
    type: "POST",
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      // ajax_response(data);
      $("#account").val("-1").trigger("change");
      $("#desc").val("");
      $("#debit").val("");
      $("#credit").val("");
      $("#debit").attr("readonly", false);
      $("#credit").attr("readonly", false);
      fetchEntryDetails();
    },
  });
}
function removeEntryLine(id) {
  var form = new FormData();
  form.append("removeEntryLine", 1);
  form.append("id", id);
  $.ajax({
    type: "POST",
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      // ajax_response(data);
      fetchEntryDetails();
    },
  });
}
function saveAccountingEntry() {
  var form = new FormData();
  form.append("saveAccountingEntry", 1);
  form.append("observations", $("#observations").val());
  form.append("entity", $("#entity").val());
  $.ajax({
    type: "POST",
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      response_save();
    },
  });
}
function check_index() {
  console.log("check_index");
  var debit = $("#debit");
  var credit = $("#credit");
  if (debit.val().length > 0) {
    credit.attr("readonly", true);
  } else {
    credit.attr("readonly", false);
  }
  if (credit.val().length > 0) {
    debit.attr("readonly", true);
  } else {
    debit.attr("readonly", false);
  }
}
