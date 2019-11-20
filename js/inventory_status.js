var chart = document.getElementById('chart').getContext('2d'),
gradient = chart.createLinearGradient(0, 0, 0, 450);

gradient.addColorStop(0, '#ff7510');
gradient.addColorStop(0.5, '#ff7410b7');
gradient.addColorStop(1, '#ff74104f');


var data = {
  labels: ['January', 'February', 'March', 'April', 'May', 'June', 'sss', 'April', 'May', 'June', 'sss'],
  datasets: [{
    label: 'Custom Label Name',
    backgroundColor: gradient,
    pointBackgroundColor: 'white',
    borderWidth: 1,
    borderColor: '#ff7510',
    data: [50, 55, 80, 81, 54, 50, 100, 80, 81, 54, 50, 100] }] };




var options = {
  responsive: true,
  maintainAspectRatio: true,
  animation: {
    easing: 'easeInOutQuad',
    duration: 520 },

  scales: {
    xAxes: [{
      gridLines: {
        color: 'rgba(200, 200, 200, 0.05)',
        lineWidth: 1 } }],


    yAxes: [{
      gridLines: {
        color: 'rgba(200, 200, 200, 0.08)',
        lineWidth: 1 } }] },



  elements: {
    line: {
      tension: 0.4 } },


  legend: {
    display: false },

  point: {
    backgroundColor: 'white' },

  tooltips: {
    titleFontFamily: 'Open Sans',
    backgroundColor: 'rgba(0,0,0,0.3)',
    titleFontColor: 'red',
    caretSize: 5,
    cornerRadius: 2,
    xPadding: 10,
    yPadding: 10 } };




var chartInstance = new Chart(chart, {
  type: 'line',
  data: data,
  options: options });