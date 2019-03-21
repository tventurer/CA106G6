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

    <title>景點管理</title>
  </head>
  <body>
    
    <h1 align="center">景點管理</h1><br>
	
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
            <div class="col-6">
                
                <form method="post" action="spo">
                  
                  <fieldset class="form-group row">
                    
                      <div class="col-sm-10">
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" id="spotName" type="radio" name="srhopt" value="sponame" checked>
                          <label class="form-check-label" for="spotName">
                           	 	依景點名稱
                          </label>
                        </div>
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" id="cityName" type="radio" name="srhopt" value="spocity">
                          <label class="form-check-label" for="cityName">
                            	依城市名稱
                          </label>
                        </div>
                      </div>
                      
                      <div class="input-group">
                        <input type="text" class="form-control" name="sposearch">
                        <input type="hidden" name="action" value="displaySpo">
                        <div class="input-group-append">
                        <button type="submit" class="btn btn-primary">搜尋</button>
                        </div>
                      </div>

                  </fieldset>
                  </form>
                  
                  <ul>
                  	<li><a href="listAllSpo.jsp">顯示所有景點</a></li>
                  	<li><a href="addSpo.jsp">新增景點</a></li>
                  	
                  	<li><form method="get" action="spo">
	                  	<div class="form-group row">
							<label class="col-sm-2 col-form-label">景點分類</label>
							<div class="col-sm-4 input-group">
		                        <select name="spoclass" class="form-control">
									<jsp:useBean id="spoSvc" class="com.spo.model.SpoService"/>
									<c:forEach var="classname" items="${spoSvc.className}">
										<option value="${classname}"}>${classname}</option>
									</c:forEach>
								</select>
		                        <input type="hidden" name="action" value="displaySpoByClass">
		                        <div class="input-group-append">
		                        <button type="submit" class="btn btn-primary">搜尋</button>
		                        </div>
		                    </div>
									
						</div>
					</form></li>
					
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