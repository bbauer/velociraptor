$(document).on 'ready page:load', ->
  #new Morris.Area(
    #element: "chart"

    #data: [
      #year: "2008"
      #value: 20
    #,
      #year: "2009"
      #value: 10
    #,
      #year: "2010"
      #value: 5
    #,
      #year: "2011"
      #value: 5
    #,
      #year: "2012"
      #value: 20
    #]
    #xkey: "year"
    #ykeys: ["value"]
    #labels: ["Value"]
    #lineColors: ["#F1C40F"]
    #fillOpacity: 0.1
  #)

  Morris.Area
    element: "areachart"
    data: [
      y: "2006"
      a: 100
      b: 90
    ,
      y: "2007"
      a: 75
      b: 65
    ,
      y: "2008"
      a: 50
      b: 40
    ,
      y: "2009"
      a: 75
      b: 65
    ,
      y: "2010"
      a: 50
      b: 40
    ,
      y: "2011"
      a: 75
      b: 65
    ,
      y: "2012"
      a: 100
      b: 90
    ]
    xkey: "y"
    ykeys: ["a", "b"]
    labels: ["Series A", "Series B"]
    #lineColors: ["#1abc9c", "#2ECC71"]
    #lineColors: ["#3498DB", "#34495E"]
    #lineColors: ["#E74C3C", "#F39C12"]
    #lineColors: ["#E67E22", "#F1C40F"]
    #lineColors: ["#F1C40F", "#F39C12"]
    lineColors: ["#1abc9c", "#2ECC71"]
    fillOpacity: 0.1
    gridTextColor: "#bbb"
    smooth: true

  #Morris.Bar
    #element: "barchart"
    #data: [
      #y: "2006"
      #a: 100
      #b: 90
    #,
      #y: "2007"
      #a: 75
      #b: 65
    #,
      #y: "2008"
      #a: 50
      #b: 40
    #,
      #y: "2009"
      #a: 75
      #b: 65
    #,
      #y: "2010"
      #a: 50
      #b: 40
    #,
      #y: "2011"
      #a: 75
      #b: 65
    #,
      #y: "2012"
      #a: 100
      #b: 90
    #]
    #xkey: "y"
    #ykeys: ["a", "b"]
    #labels: ["Series A", "Series B"]
    ##barColors: ["#F1C40F", "#F39C12"]
    ##barColors: ["#E67E22", "#F1C40F"]
    ##barColors: ["#E74C3C", "#F39C12"]
    ##barColors: ["#3498DB", "#34495E"]
    #barColors: ["#1abc9c", "#16A085"]
    #fillOpacity: 0.1
    #gridTextColor: "#bbb"

  $('#datatable').dataTable()
