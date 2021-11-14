<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
var tid = '${dto.tid}'; //게시글 번호
 
$('[name=rebtn]').click(function(){ //댓글 등록 버튼 클릭시 
	console.log("success");
    var insertData = $('[name=replyForm]').serialize(); //replyForm의 내용을 가져옴
    replyCreate(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function replyList(tid,page){
    $.ajax({
        url : '/reply/list',
        type : 'get',
        data : {'tid':tid, 'page' : page},
        success : function(data){
        	var page = data.page;
            var startpage = data.startpage;
            var endpage = data.endpage;
            var list=data.list;
            var limit = 3;            

            var a =''; 
            $.each(list, function(key, value){ 
            	console.log("hello");
            	console.log("data : " + list);
                console.log(list);
                console.log(page + "," + startpage + "," + endpage);
                console.log("start : " + startpage);
                console.log("end : " + endpage);

                a += '<div class="replyArea" style="border-bottom:1px solid darkgray; margin-bottom: 5px;">';
                a += '<div class="replyInfo'+value.trid+'">'+'댓글번호 : '+value.trid+' / 작성자 : '+value.trid;
                a += '<button type="button" onclick="replyUpdate('+value.trid+',\''+value.content+'\');"> 수정 </button>';
                a += '<button onclick="replyDelete('+value.trid+');"> 삭제 </button> </div>';
                a += '<div class="replyContent'+value.trid+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            for (var num=startpage; num<=endpage; num++) {
                if (num == page) {
                     a += '<a href="#" onclick="replyList(' + tid + ', ' + num + '); return false;" class="page-btn">' + num + '</a>';
                } else {
                     a += '<a href="#" onclick="replyList(' + tid + ', ' + num + '); return false;" class="page-btn">' + num + '</a>';
                }
             }            
            
            $(".replyList").html(a);
            
        }
    });
}
 
//댓글 등록
function replyCreate(insertData){
    $.ajax({
        url : '/reply/create',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
            	console.log("datasuccess")
            	replyList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }else{
            	console.log("failed")
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function replyUpdate(trid, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+trid+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="replyUpdateProc('+trid+');">수정</button> </span>';
    a += '</div>';
    
    $('.replyContent'+trid).html(a);
    
}
 
//댓글 수정
function replyUpdateProc(trid){
    var updateContent = $('[name=content_'+trid+']').val();
    
    $.ajax({
        url : '/reply/update/'+trid,
        type : 'post',
        data : {'content' : updateContent, 'tid' : tid},
        success : function(data){
            if(data == 1) replyList(tid); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function replyDelete(trid){
    $.ajax({
        url : '/reply/delete/'+trid,
        type : 'post',
        success : function(data){
            if(data == 1) replyList(tid); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    replyList(tid,1); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>


