$ ->
  google.load("visualization", "1", { packages:["corechart"] })
  google.setOnLoadCallback(drawChart)

  drawChart = ->
    data = google.visualization.arrayToDataTable([["Task", "Hours per Day"], ["Work", 11], ["Watch TV", 6], ["Sleep", 7]])
    options =
      legend:
        position: "bottom"
      backgroundColor: "#f9f9f9"
      slices:
        0:
          color: "#E74C3C"

        1:
          color: "#3498DB"

        2:
          color: "#34495E"

    chart = new google.visualization.PieChart(document.getElementById("piechart"))
    chart.draw data, options
