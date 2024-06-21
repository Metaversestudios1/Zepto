function printOptions(type = 'before') {
    var svg = document.querySelector("#divprint");
    if (svg) {
      if (type == 'after') { // remove the attributes after generating canvas
        svg.removeAttribute('width');
        svg.removeAttribute('height');
      } else { // set width and height according to parent container
        svg.setAttribute('width',document.querySelector("#divprint").clientWidth);
        svg.setAttribute('height', document.querySelector("#divprint").clientHeight);
      }
      
    }
  }
  
  function downloadimage() {
    // without converting the svg to png
    printOptions();
    html2canvas(document.querySelector("#divprint")).then(function(canvas) { //, //{
      //onRendered: function(canvas) {
      printOptions('after');
      var a = document.createElement('a');
      a.href = canvas.toDataURL("image/png")
      	var dt = new Date();
var time = dt.getHours() + "_" + dt.getMinutes() + "_" + dt.getSeconds() + "_Order";
                a.download = time+".jpg";
      a.click();
    });

	}