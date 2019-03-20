<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>EstateAgency Bootstrap Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="<%= request.getContextPath() %>/style/f/img/favicon.png" rel="icon">
  <link href="<%= request.getContextPath() %>/style/f/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="<%= request.getContextPath() %>/style/f/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/style/f/lib/animate/animate.min.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/style/f/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/style/f/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="<%= request.getContextPath() %>/style/f/css/style.css" rel="stylesheet">

<style>

.modal-dialog{
    overflow-y: initial;
}
.modal-body{
    height: 10px;
    overflow-y: auto;
}

</style>

</head>

<body>

  <div class="click-closed"></div>

<!-- Modal -->
<div class="modal fade" id="tripResult" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
       
  <section class="section-about">
    <div class="container">
      <div class="row" id="clone" style="display:none">
        <div class="col-md-12" style="padding-top: 2rem;">
          <div class="row justify-content-center">
            <div class="col-lg-3">
              <img src="image/place.png">
            </div>
            <div class="col-lg-8">
              <div class="title-box-d" style="margin-bottom: 0px;">
                <h3 class="title-d"></h3>
              </div>
              <h5 class="color-text-a" style="margin-bottom: 0px; margin-left: 5px"></h5>
            </div>
            </div>          
          </div>
        </div>
      </div>
  </section>
  
  <script>
  
  	$("#tripResult").on("hidden.bs.modal", function() {
	  	debugger
  		$(this).removeData("bs.modal");
	  	$(".newSpot").remove();
	  	});
  	
  	function cloneNode(){
  		makeTdeVO();
  		debugger
  		for(var i=0; i<tripList.length; i++){
  		if(typeof(tripList[i].length) != "undefined"){
  			for(var j=0; j<tripList[i].length; j++){
  				var newSpot = $("#clone").clone();
  				newSpot.attr("style", "display:''");
  				newSpot.attr("class", "newSpot");
  				newSpot.find("h3").html(tripList[i][j].sponame);
  				newSpot.find("h5").html(tripList[i][j].tdestart + "<br>" + tripList[i][j].tdefinish);
  				debugger
  				switch(tripList[i][j].spoclass){
                case "景點":
                	newSpot.find("img").attr("src", "image/place.png");
                    break;
                case "美食":
                	newSpot.find("img").attr("src", "image/ice-cream.png");
                    break;
                case "博物館":
                	newSpot.find("img").attr("src", "image/museum.png");
                    break;
                case "夜生活":
                	newSpot.find("img").attr("src", "image/beer.png");
                    break;
                case "飯店":
                	newSpot.find("img").attr("src", "image/hotel.png");
                    break;
            }
  				
  				$("#footer").before(newSpot);
  			}
  		}
  		}	
  	}
  </script>
       
       
      </div>
      <div class="modal-footer" id="footer">
        <form method="post" action="<%= request.getContextPath() %>/frontend/tde/tde">
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
        	<input type="hidden" name="action" value="submit">
        	<button type="submit" class="btn btn-primary">送出行程</button>
        </form>
      </div>
    </div>
  </div>
</div>
 
  <!-- JavaScript Libraries -->
  <script src="<%= request.getContextPath() %>/style/f/lib/jquery/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/style/f/lib/jquery/jquery-migrate.min.js"></script>
  <script src="<%= request.getContextPath() %>/style/f/lib/popper/popper.min.js"></script>
  <script src="<%= request.getContextPath() %>/style/f/lib/easing/easing.min.js"></script>
  <script src="<%= request.getContextPath() %>/style/f/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="<%= request.getContextPath() %>/style/f/lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="<%= request.getContextPath() %>/style/f/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="<%= request.getContextPath() %>/style/f/js/main.js"></script>

</body>
</html>
