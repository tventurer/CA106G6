<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>

<body>
   	
	<!-- 顯示景點明細 -->

	  <div id="collapse">
    <div class="title-box-d">
      <h3 class="title-d">景點明細</h3>
    </div>
    <span id="close" class="close-box-collapse right-boxed ion-ios-close"></span>
    <div>
        <div class="row justify-content-center">
          <div class="col-md-12 mb-2">
            <div class="form-group">
              <h3 id="place">台北101</h3>
            </div>
          </div>
          <div id="checkPic" class="col-md-4 mb-2">
            <div class="form-group">
              <img id="spopic" src="image/arrow_down.png">
            </div>
          </div>
          <div class="col-md-3 mb-2">
            <div class="form-group">
              <label for="city">評價</label>
              <h5 id="rating">4.6</h5>
            </div>
          </div>
          <div class="col-md-3 mb-2">
            <div class="form-group">
              <label for="city">地址</label>
              <h5 id="addr">台北</h5>
            </div>
          </div>
          <div id="checkContent" class="col-md-12 mb-2">
            <div class="form-group">
              <label for="Type">景點介紹</label>
              <p id="content"></p>
            </div>
          </div>
        </div>
    </div>
  </div>
</body>

</html>
