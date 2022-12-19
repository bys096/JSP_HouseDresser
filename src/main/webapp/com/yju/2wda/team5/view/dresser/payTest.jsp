<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script src="https://js.tosspayments.com/v1/payment"></script>
</head>
<body>

<button onclick="toss()">토스</button>
<button onclick="kakaoPay()">카카오페이</button>





<script>
  function kakaoPay() {
        $(function () {
          var IMP = window.IMP; // 생략가능
          IMP.init('imp52843247'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
          var msg;

          IMP.request_pay({
            pg: 'kakaopay',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '코인충전',
            amount: 1,
            buyer_name: '',
            buyer_email : '',
            buyer_tel : '',
            buyer_addr : '',
            buyer_postcode : '123-456',
        
    }, function (rsp) {
          if (rsp.success) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            jQuery.ajax({
              url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
              type: 'POST',
              dataType: 'json',
              data: {
                imp_uid: rsp.imp_uid
                //기타 필요한 데이터가 있으면 추가 전달
              }
            }).done(function (data) {
              //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
              if (everythings_fine) {
                msg = '결제가 완료되었습니다.';
                msg += '\n고유ID : ' + rsp.imp_uid;
                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                msg += '\결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;

                alert(msg);
              } else {
                //[3] 아직 제대로 결제가 되지 않았습니다.
                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
              }
            });
            //성공시 이동할 페이지
            location.href = "./pay_complete.html";
          } else {
            msg = '결제에 실패하였습니다.';
            msg += '\n에러내용 : ' + rsp.error_msg;
            //실패시 이동할 페이지
            history.back();
            alert(msg);
          }
        });
      }); 
};


var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
    var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기


    function toss() {
    tossPayments.requestPayment('카드', { // 결제 수단 파라미터
        // 결제 정보 파라미터
        amount: 15000,
        orderId: 'YEeHyo0nRYkjJwHRebgh9',
        orderName: '토스 티셔츠 외 2건',
        customerName: '박토스',
        
        successUrl: 'http://localhost:8080/bys21_house_dresser/success.jsp',
        failUrl: 'http://localhost:8080/bys21_house_dresser/fail.jsp',
      })
        .catch(function (error) {
          if (error.code === 'USER_CANCEL') {
            // 결제 고객이 결제창을 닫았을 때 에러 처리
          } else if (error.code === 'INVALID_CARD_COMPANY') {
            // 유효하지 않은 카드 코드에 대한 에러 처리
          }
        })
      }
  </script>
</body>
</html>