<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>

.modal-dialog{
    overflow-y: initial;
}
.modal-content{
    height: 670px;
    width: 550px;
    overflow-y: auto;
}
.greenArrow{
	width: 75px;
	height: 75px;
}

</style>

</head>

<body>

  <div class="click-closed"></div>

<!-- Modal -->
<div class="modal fade" id="tripResult" tabindex="-1" role="dialog" aria-labelledby="ModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalScrollableTitle">我的行程</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
  
  <div class="container-fluid">
	<div class="row justify-content-center">
		
		<div class="col-md-4 offset-md-1 col-lg-4 offset-lg-1" id="clone" style="display:none">
          <div class="title-box-d">
          	<h2 class="title-single"></h2>
          </div>
          <div class="box-comments">
            <ul class="list-comments">
              <li>
                <div class="comment-avatar">
                  <img class="spoclass" src="<%= request.getContextPath() %>/style/f/img/author-2.jpg">
                </div>
                <div class="comment-details">
                  <h4 class="comment-author"></h4>

                  <div class="timeForStart" style="display:inline"></div><div class="timeForEnd" style="display:inline"></div>

                </div>
              </li>
             </ul>
            </div>
            <center><img class="greenArrow"></center>
           </div>
           
      </div>
	</div>
  

       
       
      </div>
      <div class="modal-footer" id="footer">
        <form method="post" action="<%= request.getContextPath() %>/frontend/tde/tde">
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
        	<input type="hidden" name="action" value="submit">
        	<button type="submit" class="btn btn-success">送出行程</button>
        </form>
      </div>
    </div>
  </div>
</div>
 
</body>

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
  				//天數只印第一次
  				if(j === 0){
  					newSpot.find("h2").html("第" + (i+1) + "天");
  				}
  				//箭頭不印最後一次
  				if(j != (tripList[i].length-1)){
  					newSpot.find(".greenArrow").attr("src", "image/arrow_down.png");
  				} else{
  					newSpot.find(".greenArrow").attr("style", "display:none");
  				}
  				
  				newSpot.find("h4").html(tripList[i][j].sponame);
  				newSpot.find(".timeForStart").html("起始時間:" + tripList[i][j].tdestart + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
  				newSpot.find(".timeForEnd").html("終止時間:" + tripList[i][j].tdefinish);
  				debugger
  				switch(tripList[i][j].spoclass){
                case "景點":
                	newSpot.find(".spoclass").attr("src", "image/place.png");
                    break;
                case "美食":
                	newSpot.find(".spoclass").attr("src", "image/ice-cream.png");
                    break;
                case "博物館":
                	newSpot.find(".spoclass").attr("src", "image/museum.png");
                    break;
                case "夜生活":
                	newSpot.find(".spoclass").attr("src", "image/beer.png");
                    break;
                case "飯店":
                	newSpot.find(".spoclass").attr("src", "image/hotel.png");
                    break;
            }
  				
  				$("#footer").before(newSpot);
  			}
  		}
  		}	
  	}
</script>

</html>
