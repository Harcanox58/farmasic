$(document).ready(function () {
  sendToCart();
  validatePsychotropic();
  // updateCart();
});

function updateCart() {
  var cart = $("#cart");
  var target = cart.attr("target");
  $.ajax({
    type: "POST",
    url: target,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      $("#cart").html("");
      let html =
        '<li class="nav-item d-none d-sm-inline-block">' +
        '<a href="' +
        data.url +
        '" class="nav-link pl-0 text-sm">' +
        '  <i class="fas fa-shopping-cart">' +
        '     <span class="badge badge-danger">' +
        data.count +
        "   </span>" +
        "</i>" +
        data.totalBs +
        " " +
        data.totalUSD +
        "</a>" +
        "</li>";
      if (data.count != 0) {
        $("#cart").html(html);
      }
    },
  });
}

function updateStock() {
  var stock = $("#updateStock");
  var type = stock.attr("type");
  var id = stock.attr("product");
  var target = stock.attr("target");
  var form = new FormData();
  form.append("product", id);
  console.log(target);
  $.ajax({
    type: "POST",
    url: target,
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      if (type == "L") {
        let html = "Existancia: " + data.currentStock;
        stock.html(html);
      }
      stock.html(data.currentStock);
    },
  });
}
function validatePsychotropic() {
  $("#fileInput").on("change", function () {
    if ($("#fileInput").val()) {
      $("#sendPsychotropic").prop("disabled", false);
    }
  });
}
function sendToCart() {
  $(".formCart").submit(function (e) {
    e.preventDefault();
    var form = $(this);
    var metodo = form.attr("method");
    var target = form.attr("target");
    var formdata = new FormData(this);
    $.ajax({
      type: metodo,
      url: target,
      data: formdata ? formdata : form.serialize(),
      cache: false,
      contentType: false,
      processData: false,
      success: function (res) {
        updateCart();
        if (res.redirect) {
          window.location.href = res.redirect;
        }
        if (res.alert) {
          if (res.alert.message != "") {
            let type = res.alert.type;
            toastr[type](res.alert.message);
          }
        }
        if (res.response) {
          if (res.response.message != "") {
            Swal.fire({
              toast: true,
              position: "top-end",
              icon: res.response.type,
              title: res.response.message,
              showConfirmButton: false,
              timer: 3000,
            });
            if (res.response.redirect) {
              window.location.replace(res.response.redirect);
            }
          }
        }
        $(':input[type="number"]').val("");
      },
      error: function () {
        Swal.fire({
          toast: true,
          position: "top-end",
          icon: "info",
          title: "Ups. Ocurrió un error inesperado.",
          showConfirmButton: false,
          timer: 3000,
        });
      },
    });
    return false;
  });
}
