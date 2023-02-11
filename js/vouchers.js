// function fetch_lines() {
//       $('debit').removeAttr('readonly');
//       $('credit').removeAttr('readonly');
//       var target = $('.form-ajax').attr('target');
//       var table = $("#LinesTable").DataTable({
//          "language": {
//             "url": "{$urls.assets}/plugins/datatables/lang/es.json",
//          },
//          ordering: false,
//          searching: false,
//          paging: false,
//          info: false,
//          'columnDefs': [{
//             "targets": [2, 3], // your case first column
//             "className": "text-right",
//          }],
//          stateSave: true,
//          "bDestroy": true
//       });

//       $.ajax({
//          url: target,
//          type: 'POST',
//          dataType: 'json',
//          data: {
//             fetch_lines: 1
//          },
//          success: function(data) {
//             table.clear().draw();
//             $.each(data.lines, function(index, value) {
//                table.row.add([
//                   value.name,
//                   value.line_text,
//                   value.left_index,
//                   value.right_index,
//                   '<a onclick="del_line(' + value.id +
//                   ')"><span class="text-primary fas fa-trash"></span></a>'
//                ]).draw();
//             });
//             $('#total_left').text('Bs. ' + data.totals.t_debito);
//             $('#total_right').text('Bs. ' + data.totals.t_credito);
//             $('#descuadre').text('Bs. ' + data.totals.diferencia);
//             $('#diferencia').html(
//                '<span  class="badge badge-danger text-md mr-1">DIFERENCIA:</span><span class="text-bold text-md mr-5"> ' +
//                data.totals.diferencia +
//                '</span> <span class="badge badge-info text-md mr-1">TOTAL: </span> <span class="text-bold text-md"><b>' +
//                data.totals.total + '</b></span>');

//          }
//       });
//    }
