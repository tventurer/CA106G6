<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	
    <title>自由行訂單管理</title>
  </head>
  <body>
    
    <h1 align="center">自由行訂單管理</h1><br>
	
	<c:if test="${not empty errorMsgs}">
		請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
		<li>${message}</li>
		</c:forEach>
	</ul>
	</c:if>
	
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-3">
                
                <form method="post" action="tod">
                  
                  <fieldset class="form-group row">
                    
                      <div class="col-sm-5">
                          <label class="form-check-label">
                            	依管理員名稱
                          </label>
                      </div>
                      
                      <div class="input-group">
						<select name="memno" class="form-control">
								<option value="EMP000001">EMP000001</option>
								<option value="EMP000002">EMP000002</option>
								<option value="EMP000003">EMP000003</option>
						</select>
						
                        <input type="hidden" name="action" value="displayTod">
                        <div class="input-group-append">
                        <button type="submit" class="btn btn-primary">搜尋</button>
                        </div>
                      </div>

                  </fieldset>
                  </form>
                  
                  <ul>
                  	<li><a href="listAllTod.jsp">顯示所有行程</a></li>
                  </ul>
                  
                  <ul>
                  	<li><a href="addTod.jsp">建立行程</a></li>
                  </ul>

            </div>
        </div>
    </div>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
  </body>
</html>