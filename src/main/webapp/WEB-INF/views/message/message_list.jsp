<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/static/css/message_list.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"/>


</head>

<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<div class='msg-container'>
	<div class="messaging">
	<div class="inbox_msg">
	<!-- 메세지 목록 영역 -->
		<div class="inbox_people">
			<div class="headind_srch">
				<div class="recent_heading">
					<h5>Chat</h5>
				</div>
				<!-- 메세지 검색 -->
				<div class="srch_bar">
					<div class="stylish-input-group">
						<input type="text" class="search-bar" placeholder="Search">
						<span class="input-group-addon">
						<button type="button"> <i class="fa fa-search" aria-hidden="true"></i></button>
						</span>
					</div>
				</div>
			</div>
			
			<!-- 메세지 리스트 -->
			<div class="inbox_chat">

			</div>
		</div>
		
		<!-- 메세지 내용 영역 -->
		<div class="mesgs">
			<!-- 메세지 내용 목록 -->
			<div class="msg_history" name="contentList">
				<!-- 메세지 내용이 올 자리 -->
			</div>
			<div class="send_message">
			</div>
			<!--  메세지 입력란이 올 자리 -->
		</div>
	</div>
	</div>
</div>

<script>
//가장 처음 메세지 리스트를 가져온다.
const FirstMessageList = function(){
	$.ajax({
		url:"message_ajax_list.do",
		method:"get",
		data:{
		},
		success:function(data){
			console.log("메세지 리스트 리로드 성공");
			
			$('.inbox_chat').html(data);
			
			//네세지 리스트 중 하나를 클릭했을 때
			$('.chat_list').on('click', function(){
				//alert('roomID: '+$(this).attr('roomID'));
				
				let roomID = $(this).attr('roomID');
				let otherID = $(this).attr('otherID');
				
				//선택한 메세지 빼고 나머지는 active 효과 해제
				$('.chat_list_box').not('.chat_list_box.chat_list_box'+roomID).removeClass('active_chat');
				//선책한 메세지만 active 효과 주기
				$('.chat_list_box'+roomID).addClass('active_chat');
				
				let send_msg="";
				send_msg += "<div class='type_msg'>";
				send_msg +=	"	<div class='input_msg_write row'>";
				send_msg += "		<div class='col-11'>";
				send_msg += "			<input type='text' class='write_msg form-control' placeholder='메세지를 입력하세요.'/>";
				send_msg += "		</div>";
				send_msg += "		<div class='col-1'>";
				send_msg += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
				send_msg += "		</div>";
				send_msg += "	</div>";
				send_msg += "</div>";
				
				//메세지 입력, 전송 칸을 보인다.
				$('.send_message').html(send_msg);
				
				//메세지 전송버튼을 눌렀을 때
				$('.msg_send_btn').on('click', function(){
					
					// 메세지 전송 함수 호출
					SendMessage(roomID, otherID);
					
					// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라짐
					// 이를 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 함
					// $.('.chat_list_box:first').addClass('active_chat');
				});
				
				//메세지 내용을 불러오는 함수 호출
				MessageContentList(roomID);
			});
			
			// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라짐
			// 이를 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 함
			$('.chat_list_box:first').addClass('active_chat');
		}
	})
};

//메세지 리스트를 다시 가져온다.
const MessageList = function(){
	$.ajax({
		url:"message_ajax_list.do",
		method:"get",
		data:{
		},
		success:function(data){
			console.log("메세지 리스트 리로드 성공");
			
			$('.inbox_chat').html(data);
			
			//네세지 리스트 중 하나를 클릭했을 때
			$('.chat_list').on('click', function(){
				//alert('roomID: '+$(this).attr('roomID'));
				
				let roomID = $(this).attr('roomID');
				let otherID = $(this).attr('otherID');
				
				//선택한 메세지 빼고 나머지는 active 효과 해제
				$('.chat_list_box').not('.chat_list_box.chat_list_box'+roomID).removeClass('active_chat');
				//선책한 메세지만 active 효과 주기
				$('.chat_list_box'+roomID).addClass('active_chat');
				
				let send_msg="";
				send_msg += "<div class='type_msg'>";
				send_msg +=	"	<div class='input_msg_write row'>";
				send_msg += "		<div class='col-11'>";
				send_msg += "			<input type='text' class='write_msg form-control' placeholder='메세지를 입력...'/>";
				send_msg += "		</div>";
				send_msg += "		<div class='col-1'>";
				send_msg += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
				send_msg += "		</div>";
				send_msg += "	</div>";
				send_msg += "</div>";
				
				//메세지 입력, 전송 칸을 보인다.
				$('.send_message').html(send_msg);
				
				//메세지 전송버튼을 눌렀을 때
				$('.msg_send_btn').on('click', function(){
					
					// 메세지 전송 함수 호출
					SendMessage(roomID, otherID);
					
					// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라짐
					// 이를 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 함
					// $.('.chat_list_box:first').addClass('active_chat');
				});
				
				//메세지 내용을 불러오는 함수 호출
				MessageContentList(roomID);
			});
			
			// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라짐
			// 이를 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 함
			$('.chat_list_box:first').addClass('active_chat');
		}
	})
};

// 메세지 내용을 가져온다.
// 읽지 않은 메세지들을 읽음으로 바꾼다.
const MessageContentList = function(roomID) {
	
	$.ajax({
		url:"message_content_list.do",
		method:"GET",
		data:{
			roomID : roomID,
		},
		success:function(data){
			console.log("메세지 내용 가져오기 성공");
			
			//메세지 내용을 html에 넣는다
			$('.msg_history').html(data);
			
			//이 함수로 메세지 내용을 가져올 때마다 스크롤을 맨아래로 가게 한다.
			$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
		},
		error:function(){
			alert('서버 에러');
		}
	})
	
	$('.unread'+roomID).empty();
};

//메세지를 전송하는 함수
const SendMessage = function(roomID, otherID) {
	let content = $('.write_msg').val();
	//alert("content: "+ content);
	
	content = content.trim();
	
	if(content =="") {
		alert("메세지를 입력하세요!");
	}else{
		$.ajax({
			url:"message_send_inlist.do",
			method:"GET",
			data:{
				roomID:roomID,
				otherID:otherID,
				content:content
			},
			success:function(data){
				console.log("메세지 전송 성공");
				
				//메세지 입력칸 비우기
				$('.wirte_msg').val("");
				
				//메세지 내용 리로드
				MessageContentList(roomID);
				
				//메세지 리스트 리로드
				MessageList();
			},
			error: function() {
				alert('서버 에러');
			}
		});
	}
};

$(document).ready(function(){
	console.log('hi');
	//메세지 리스트 리로드
	FirstMessageList();

});
</script>
</body>
</html>