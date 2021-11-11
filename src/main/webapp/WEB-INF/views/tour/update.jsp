<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
        integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
        crossorigin="anonymous"></script>

</head>
<body>
    <div class="container">
        <h2 class="col-sm-offset-2 col-sm-10">공지 생성</h2>
        <form class="form-horizontal" action="/notice/create" method="post" onsubmit="return checkIn(this)">
    
            <div class="form-group">
                <label class="control-label col-sm-2" for="wname">작성자</label>
                <div class="col-sm-6">
                    <input type="text" name="wname" id="wname" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="title">제목</label>
                <div class="col-sm-8">
                    <input type="text" name="title" id="title" class="form-control">
                </div>
            </div>
    
            <div class="form-group">
                <label class="control-label col-sm-2" for="content">내용</label>
                <div class="col-sm-8">
                    <textarea rows="12" cols="7" id="content" name="content" class="form-control"></textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="passwd">파일</label>
                <div class="col-sm-6">
                    <input type="password" name="passwd" id="passwd" class="form-control">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="passwd">비밀번호</label>
                <div class="col-sm-6">
                    <input type="password" name="passwd" id="passwd" class="form-control">
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