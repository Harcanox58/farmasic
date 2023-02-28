$(document).ready(function () {
  $("#btn-genPass").click(function () {
    var password = "";
    var str =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "abcdefghijklmnopqrstuvwxyz0123456789@#$";

    for (i = 1; i <= 12; i++) {
      var char = Math.floor(Math.random() * str.length + 1);

      password += str.charAt(char);
    }
    alert("Contraseña generada: " + password);
    $(".generated-password").val(password);
  });
  // sendAjaxRequest();
  if ($(".select2 option").attr("selected") == "selected") {
    $(".select2").val("-1").trigger("change");
  }
  $(".select2").select2({
    theme: "classic",
    allowClear: true,
    placeholder: {
      id: "-1", // the value of the option
      text: "Seleccione una opción",
    },
    templateSelection: function (data, container) {
      // Add custom attributes to the <option> tag for the selected option
      $(data.element).attr("data-custom-attribute", data.customValue);
      return data.text;
    },
    language: {
      noResults: function () {
        return "No se han encontrado resultados.";
      },
    },
    escapeMarkup: function (markup) {
      return markup;
    },
  });
  $(".select2").find(":selected").data("custom-attribute");

  const ConstDataTable = $(".dataTable");
  ConstDataTable.DataTable({
    pageLength: 25,
    stateSave: true,
    bDestroy: true,
    order: [],
    language: lang,
  });
  const ConstDataTableSimple = $(".dataTableSimple");
  ConstDataTableSimple.DataTable({
    pageLength: 25,
    stateSave: true,
    bDestroy: true,
    ordering: false,
    searching: false,
    paging: false,
    info: false,
    order: [],
    language: lang,
  });
  callInputMask();
  $(".money-usd").inputmask({ alias: "currencyUSD" });
  $(".money-bs").inputmask({ alias: "currencyBS" });
  $(".percentage").inputmask({ alias: "percentage" });
});

var lang = {
  sProcessing: "Procesando...",
  sLengthMenu: "Mostrar  _MENU_  Registros",
  sZeroRecords: "No se encontraron resultados",
  sEmptyTable: "Ningún dato disponible en esta tabla",
  sInfo:
    "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
  sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros",
  sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
  sInfoPostFix: "",
  sSearch: "Buscar:",
  sUrl: "",
  sInfoThousands: ",",
  sLoadingRecords: "Cargando...",
  oPaginate: {
    sFirst: "Primero",
    sLast: "Último",
    sNext: "Siguiente",
    sPrevious: "Anterior",
  },
  oAria: {
    sSortAscending: ": Activar para ordenar la columna de manera ascendente",
    sSortDescending: ": Activar para ordenar la columna de manera descendente",
  },
};
function callInputMask() {
  Inputmask.extendAliases({
    currencyBS: {
      prefix: "Bs. ",
      radixPoint: ",",
      groupSeparator: ".",
      alias: "numeric",
      rightAlign: true,
      placeholder: "0",
      autoGroup: true,
      digits: 2,
      digitsOptional: true,
      clearMaskOnLostFocus: true,
    },
    currencyUSD: {
      prefix: "$ ",
      radixPoint: ".",
      groupSeparator: ",",
      alias: "decimal",
      placeholder: "0",
      autoGroup: true,
      digits: 2,
      digitsOptional: false,
      clearMaskOnLostFocus: false,
    },
    percentage: {
      radixPoint: ",",
      groupSeparator: ".",
      autoGroup: true,
      suffix: "%",
      clearMaskOnLostFocus: false,
      autoUnmask: true,
    },
  });
}
function changeStatusWithAJAX(ch, id) {
  var checked = ch.checked ? 1 : 0;
  var form = new FormData();
  form.append("changeStatusAJAX", 1);
  form.append("id", id);
  form.append("checked", checked);
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
function sendAjaxRequest() {
  $(".ajaxRequest").submit(function (e) {
    console.log("ajax request");
    e.preventDefault();
    var form = new FormData(this);
    form.append("request", true);
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
  });
}
function changePermissionWithAJAX(ch, permission, permission_id, role_id) {
  var checked = ch.checked ? 1 : 0;
  var form = new FormData();
  form.append("changePermissionAJAX", 1);
  form.append("permission_id", permission_id);
  form.append("role_id", role_id);
  form.append("permission", permission);
  form.append("value", checked);
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
function sendAjaxRequest() {
  $(".ajaxRequest").submit(function (e) {
    console.log("ajax request");
    e.preventDefault();
    var form = new FormData(this);
    form.append("request", true);
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
  });
}
function removeAJAX(id) {
  var form = new FormData();
  form.append("removeAJAX", 1);
  form.append("id", id);
  $.ajax({
    type: "POST",
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      window.location.reload(true);
      ajax_response(data);
    },
  });
}
function sendTicket() {
  $("form-ajax input").val("");
  response_save("Mensaje Enviado.");
}
function response(res) {
  Swal.fire({
    toast: true,
    position: "top-end",
    icon: res.type,
    title: res.message,
    showConfirmButton: false,
    timer: 3000,
  });
}
function response_save(str = "Datos Guardados.") {
  Swal.fire({
    toast: true,
    position: "top-end",
    icon: "info",
    title: str,
    showConfirmButton: false,
    timer: 3000,
  });
}
function error() {
  Swal.fire({
    toast: true,
    position: "top-end",
    icon: "info",
    title: "Ups. Ocurrió un error inesperado.",
    showConfirmButton: false,
    timer: 3000,
  });
}

function formatMoney(number, decPlaces, decSep, thouSep) {
  (decPlaces = isNaN((decPlaces = Math.abs(decPlaces))) ? 2 : decPlaces),
    (decSep = typeof decSep === "undefined" ? "." : decSep);
  thouSep = typeof thouSep === "undefined" ? "," : thouSep;
  var sign = number < 0 ? "-" : "";
  var i = String(
    parseInt((number = Math.abs(Number(number) || 0).toFixed(decPlaces)))
  );
  var j = (j = i.length) > 3 ? j % 3 : 0;

  return (
    sign +
    (j ? i.substr(0, j) + thouSep : "") +
    i.substr(j).replace(/(\decSep{3})(?=\decSep)/g, "$1" + thouSep) +
    (decPlaces
      ? decSep +
        Math.abs(number - i)
          .toFixed(decPlaces)
          .slice(2)
      : "")
  );
}
