<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <title>관공서 생성</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
        integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
        crossorigin="anonymous"></script>
        
    <link rel="stylesheet" href="/resources/static/css/office_create.css">    
<script type="text/JavaScript">
        
 	function checkIn(f){
         if (f.title.value == ""){
              alert("제목를 입력하세요");
              f.title.focus();
              return false;
         }
         if (f.contents.value == '') {
             window.alert('내용을 입력해 주세요.');
             f.contents.focus();
             return false;
         }
         if (f.address.value == ""){
             alert("주소를 입력해주세요");
             f.address.focus();
             return false;
         }
         
         if (f.phone.value == ""){
             alert("전화번호를 입력해주세요");
             f.phone.focus();
             return false;
         }
 }
 </script>
</head>
<body>
    <div class="container">
        <h2 class="col-sm-offset-2 col-sm-10">관공서 생성</h2>
        <form class="form-horizontal" 
        	action="/office/update" 
        	method="post" 
        	enctype="multipart/form-data"
        	onsubmit="return checkIn(this)">
    
            <div class="form-group">
            <input type="hidden" name="oid" id="oid" class="form-control" value="${dto.oid}">
                <label class="control-label col-sm-2" for="id">작성자</label>
                <div class="col-sm-6">
                    <input type="text" readonly name="id" id="id" class="form-control" value="${dto.id}">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="oname">이름</label>
                <div class="col-sm-8">
                    <input type="text" name="oname" id="oname" class="form-control" value="${dto.oname}">
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-sm-2" for="address">주소</label>
                <div class="col-sm-8">
                    <input type="text" name="address" id="address" class="form-control" value="${dto.address}">
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-sm-2" for="webaddress">웹페이지</label>
                <div class="col-sm-8">
                    <input type="text" name="webaddress" id="webaddress" class="form-control" value="${dto.webaddress}">
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-sm-2" for="phone">전화번호</label>
                <div class="col-sm-8">
                    <input type="text" name="phone" id="phone" class="form-control" value="${dto.phone}">
                </div>
            </div>
    
            <div class="form-group">
                <label class="control-label col-sm-2" for="contents">내용</label>
                <div class="col-sm-8">
                    <textarea rows="12" cols="7" id="contents" name="contents" class="form-control">${dto.contents}</textarea>
                </div>
            </div>
			
			
            <div class="form-group">
            	<input type=hidden name="filename" id="filename" class="form-control" value="${dto.filename}">
                <label class="control-label col-sm-2" for="filenameMF">파일</label>
                <div class="col-sm-6">
                    <input multiple="multiple" type="file" name="filenameMF" id="filenameMF" class="form-control">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-5">
                    <button class="btn btn-default">등록</button>
                    <button type="button" class="btn btn-default" onclick="history.back()">취소</button>
                </div>
            </div>
        </form>
    </div>
    

</body>
</html>