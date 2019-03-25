<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.not.model.*"%>
<%
  NotService notSvc = new NotService();
  String memno = (String) session.getAttribute("memno");
  List<NotVO> list = notSvc.getByMemno(memno);
  request.setAttribute("list", list);
%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" /> 
<jsp:useBean id="bptSvc" scope="page" class="com.bpt.model.BptService" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有通知</title>
<style>
.notifications{
  width: 200px;
  height: 30px;
  background-color: #99aaff;
  margin: 20px 0px;
  padding: 5px 10px;
  border-radius: 10px;
}
</style>
<style>
.box-wrap .toggle {
	margin-top: 25px;
    border-radius: 4px;
    border: 1px solid #cecece;
    background: #efefef;
}
.box-wrap.box-open .toggle:after {
    content: "關閉"
}
.box-wrap.box-close .toggle:after {
    content: "展開"
}
.box {
	font-size: 20px;
	margin-bottom: 25px;
    border-radius: 10px;
    display: block;
    width: auto;
    height: 30px;
    background-color: #99ccff; 
    transition: height 0.35s ease;
    overflow: hidden;
    padding: 0 10px 2px 10px;
}
</style>
</head>
<body>
<c:forEach var="notVO" items="${list}">
<div class="box-wrap box-close">
  <button class="toggle${notVO.notno}">閱讀</button>
    <div class="box box-close" id="innerbox${notVO.notno}">
        <p>${notVO.notcontent}</p>
        <p>${notVO.nottime}</p>
    </div>
</div>
<script>
var toggleNode = document.querySelector('.toggle${notVO.notno}');

toggleNode.addEventListener("click", toggleFunc);


function toggleFunc(E) {
    E.preventDefault();
    box = document.querySelector('#innerbox${notVO.notno}');
    var orgHeight = parseInt(box.style.height, 10);
    box.style.height = (orgHeight > 100) ? "30px": box.scrollHeight + "px";
    
    $.ajax({
		 type: "POST",
		 url: "<%=request.getContextPath()%>/backend/not/not",
		 data: {"notno":"${notVO.notno}",
			    "action": "read"},
		 dataType: "json",
		 success: function(data){
			 if (data.readed == 'false') {
			    var i = parseInt(document.getElementById("howmanyunread").innerHTML);
				howmanyunread.innerHTML = --i;
			 }
		 },
        error: function(){
        
        }
    });
    

}
</script>
</c:forEach>

</body>
</html>