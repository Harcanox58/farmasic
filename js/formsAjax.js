$(document).ready(function () {
  CallFormAjax();
});

function CallFormAjax() {
  $(".form-ajax").submit(function (e) {
    e.preventDefault();
    var form = $(this);
    var metodo = form.attr("method");
    var target = form.attr("target");
    var progress = form.children(".RespuestaAjax");
    var msjError =
      '<script>Swal.fire({toast:true,position: "top-end",icon: "error",title: "Ups. Ocurrió un error inesperado.",showConfirmButton: false,timer: 2000 });</script>';
    var formdata = new FormData(this);
    $.ajax({
      type: metodo,
      url: target,
      data: formdata ? formdata : form.serialize(),
      cache: false,
      contentType: false,
      processData: false,
      xhr: function () {
        var xhr = new window.XMLHttpRequest();
        xhr.upload.addEventListener(
          "progress",
          function (evt) {
            if (evt.lengthComputable) {
              var percentComplete = evt.loaded / evt.total;
              percentComplete = parseInt(percentComplete * 100);
              if (percentComplete < 100) {
                progress.html(
                  '<p class="text-center">Procesado... (' +
                    percentComplete +
                    '%)</p><div class="progress progress-striped active"><div class="progress-bar progress-bar-info" style="width: ' +
                    percentComplete +
                    '%;"></div></div>'
                );
              } else {
                progress.html('<p class="text-center"></p>');
              }
            }
          },
          false
        );
        return xhr;
      },
      success: function (res) {
        ajax_response(res);
      },
      error: function () {
        error();
      },
    });
    return false;
  });
}
function preXhr(progress) {
  var xhr = new window.XMLHttpRequest();
  xhr.upload.addEventListener(
    "progress",
    function (evt) {
      if (evt.lengthComputable) {
        var percentComplete = evt.loaded / evt.total;
        percentComplete = parseInt(percentComplete * 100);
        if (percentComplete < 100) {
          progress.html(
            '<p class="text-center">Procesado... (' +
              percentComplete +
              '%)</p><div class="progress progress-striped active"><div class="progress-bar progress-bar-info" style="width: ' +
              percentComplete +
              '%;"></div></div>'
          );
        } else {
          progress.html('<p class="text-center"></p>');
        }
      }
    },
    false
  );
  return xhr;
}
function ajax_response(res) {
  console.log(res);
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
  if (res.reloadIMG) {
    $("#reloadIMG").attr("src", res.reloadIMG);
  }
  res = null;
}
