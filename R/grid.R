#' Draw grids in the slide
#'
#' @description.
#' This function draws 100x100px grids in the slide to place objects
#'
#' @param eval draw grids or not, default TRUE
#' @param width linewidth of grids, default 2
#' @export
draw_grid <-
  function(eval = TRUE, width = 2){
    if(eval) htmltools::HTML('
<div style="position:absolute; left:0px; top:0px; width:100%; height:{width}px; background-color:red">top: 0px</div>
<div style="position:absolute; left:0px; top:100px; width:100%; height:{width}px; background-color:red">top: 100px</div>
<div style="position:absolute; left:0px; top:200px; width:100%; height:{width}px; background-color:red">top: 200px</div>
<div style="position:absolute; left:0px; top:300px; width:100%; height:{width}px; background-color:red">top: 300px</div>
<div style="position:absolute; left:0px; top:400px; width:100%; height:{width}px; background-color:red">top: 400px</div>
<div style="position:absolute; left:0px; top:500px; width:100%; height:{width}px; background-color:red">top: 500px</div>
<div style="position:absolute; left:0px; top:600px; width:100%; height:{width}px; background-color:red">top: 600px</div>

<div style="position:absolute; left:0px; top:0px; width:{width}px; height:50px; background-color:orange"></div>
<div style="position:absolute; left:100px; top:0px; width:{width}px; height:150px; background-color:orange"></div>
<div style="position:absolute; left:200px; top:0px; width:{width}px; height:250px; background-color:orange"></div>
<div style="position:absolute; left:300px; top:0px; width:{width}px; height:350px; background-color:orange"></div>
<div style="position:absolute; left:400px; top:0px; width:{width}px; height:450px; background-color:orange"></div>
<div style="position:absolute; left:500px; top:0px; width:{width}px; height:550px; background-color:orange"></div>
<div style="position:absolute; left:600px; top:0px; width:{width}px; height:650px; background-color:orange"></div>
<div style="position:absolute; left:700px; top:0px; width:{width}px; height:750px; background-color:orange"></div>
<div style="position:absolute; left:800px; top:0px; width:{width}px; height:850px; background-color:orange"></div>
<div style="position:absolute; left:900px; top:0px; width:{width}px; height:950px; background-color:orange"></div>
')}
