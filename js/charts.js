$(document).ready(function () {});
function chartRequest() {
  var form = new FormData();
  console.log("ajaxRequest");
  form.append("request", true);
  $.ajax({
    type: "POST",
    data: form,
    cache: false,
    contentType: false,
    processData: false,
    success: function (data) {
      doughnutChart(data.common);
      console.log(data.relations.sales.labels);
      salesLine(data.relations.sales.labels, data.relations.sales.data);
      costsLine(data.relations.costs.labels, data.relations.costs.data);
    },
  });
}
function doughnutChart(data) {
  const ctx = document.getElementById("salesDoughnutChart");
  new Chart(ctx, {
    type: "doughnut",
    data: {
      labels: [
        "Nuevos Pedidos",
        "Nuevos Pagos",
        "Nuevos Reclamos",
        "Tickest de Soporte",
      ],
      datasets: [
        {
          data: data,
          borderColor: ["#18CBAA", "#23CB18", "#B5CB18", "#CB1818"],
          backgroundColor: ["#18CBAA80", "#23CB1880", "#B5CB1880", "#CB181880"],
          borderWidth: 1,
        },
      ],
    },
    options: {
      plugins: {
        legend: {
          position: "right",
        },
      },
    },
  });
}
function salesLine(labels, data) {
  new Chart(document.getElementById("salesLineChart"), {
    type: "line",
    data: {
      labels: labels,
      datasets: [
        {
          //   label: labels,
          data: data,
          borderColor: "#23CB18",
          backgroundColor: "#23CB1880",
          borderWidth: 1,
          tension: 0.3,
          fill: true,
        },
      ],
    },
    options: {
      plugins: {
        legend: {
          display: false,
        },
      },
      scales: {
        xAxes: [
          {
            ticks: {
              // Include a dollar sign in the ticks
              callback: function (value, index, values) {
                return "$" + value.toFixed(2);
              },
            },
          },
        ],
      },
    },
  });
}
function costsLine(labels, data) {
  new Chart(document.getElementById("costsLineChart"), {
    type: "line",
    data: {
      labels: labels,
      datasets: [
        {
          data: data,
          borderColor: "#CB1818",
          backgroundColor: "#CB181880",
          borderWidth: 1,
          tension: 0.3,
          fill: true,
        },
      ],
    },
    options: {
      plugins: {
        legend: {
          display: false,
        },
      },
      scales: {
        y: {
          beginAtZero: true,
        },
      },
    },
  });
}
