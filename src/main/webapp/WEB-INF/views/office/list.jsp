<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/static/css/office.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@200&display=swap" rel="stylesheet">
    <script type="text/javascript">
        window.onload=function(){
        	console.log("hi");
        const moreBtn=document.querySelector('.description .contents .moreBtn');
        const sub_detail=document.querySelector('.description .contents .detail');

        moreBtn.addEventListener('click',() =>{
        	console.log("hello");
            moreBtn.classList.toggle('clicked');
            sub_detail.classList.toggle('detail_clamp');
        });}
    </script>

</head>
<body>
    
    <h1 style="margin-left: 30px;">관공서</h1>
    
    <section class="title">
        <h2>Public Station</h2>
        <div class="search">
            <label>search</label>
            <input type="text">
            <button>submit</button>
        </div>
    </section>
    <div class="container">
        <div class=item>
            <img src="/office/storage/default.png" alt="none">
        </div>

        <!--1paragraph-->
        <c:forEach var="dto" items="${list}">
	        <div class=item>
	            <img src="/office/storage/${dto.filename}" alt="iuhello.jpg">
	        </div>
	        
	 
		        <div class="description">
		            <div>
		                <label>기관명 : </label><span>${dto.oname}</span>
		            </div>
		            <div>
		                <label>주소 : </label><span>${dto.address}</span>
		            </div>
		            <div>
		                <label>TEL : </label><span>${dto.phone}</span>
		            </div>
		            <div class="contents">
		                <span class="detail"> 
		                    ${dto.contents}
		                </span>
		                <button class="moreBtn"><i class="fas fa-chevron-circle-down"></i></button>
		            </div>
		        </div>
       	</c:forEach>
    </div>   
</body>
</html>