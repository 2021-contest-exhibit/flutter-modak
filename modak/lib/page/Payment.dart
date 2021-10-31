

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iamport_flutter/iamport_payment.dart';
import 'package:iamport_flutter/model/payment_data.dart';
import 'package:modak/bloc/ModakBloc.dart';
import 'package:modak/bloc/ModakEvent.dart';

void main() {
  // initializeJsonMapper();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Payment(),
  ));
}


class Payment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PaymentState();
}

class PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    int amount = data[0] as int;
    String matchingId = data[1] as String;
    return IamportPayment(
      appBar: new AppBar(
        title: new Text('아임포트 결제'),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('image/logo_black.png', width: 36, height: 36,),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
              ),
            ],
          ),
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: 'imp00967964',
      /* [필수입력] 결제 데이터 */
      data: PaymentData.fromJson({
        'pg': 'html5_inicis',                                          // PG사
        'payMethod': 'card',                                           // 결제수단
        'name': '아임포트 결제데이터 분석',                                  // 주문명
        'merchantUid': 'mid_${DateTime.now().millisecondsSinceEpoch}_${matchingId}', // 주문번호
        'amount': amount,                                               // 결제금액
        'buyerName': '홍길동',                                           // 구매자 이름
        'buyerTel': '01012345678',                                     // 구매자 연락처
        'buyerEmail': 'example@naver.com',                             // 구매자 이메일
        'buyerAddr': '서울시 강남구 신사동 661-16',                         // 구매자 주소
        'buyerPostcode': '06018',                                      // 구매자 우편번호
        'appScheme': 'example',                                        // 앱 URL scheme
        'display': {
          'cardQuota' : [2,3]                                          //결제창 UI 내 할부개월수 제한
        }
      }),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) {
        print(result["imp_success"]);
        if (result["imp_success"] == true) {
          BlocProvider.of<ModakBloc>(context).add(
              JoinMatchingEvent(matchingId: matchingId)
          );
        }
        Navigator.pop(context);
      },
    );
  }
}