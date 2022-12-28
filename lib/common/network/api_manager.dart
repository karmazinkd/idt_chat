import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:idt_chat/common/constants/dart_define_values.dart';
import 'package:idt_chat/common/constants/network_constants.dart';

abstract class ApiManager {
  static Dio getDioClient() {
    final options = BaseOptions(
      connectTimeout: NetworkConstants.apiConnectTimeout,
      receiveTimeout: NetworkConstants.apiReceiveTimeout,
      sendTimeout: NetworkConstants.apiSendTimeout,
      contentType: Headers.formUrlEncodedContentType,
      baseUrl: DartDefineValues.baseUrl,
      responseDecoder: _responseDecoderCutTrailingComma,
    );

    return Dio(options);
  }

  static String _responseDecoderCutTrailingComma(
      List<int> bytes, RequestOptions options, ResponseBody response) {
    String res = utf8.decode(bytes, allowMalformed: true);
    res.trimRight();

    if(res.substring(res.length - 3, res.length).contains(",]")){
      final commaIdx = res.lastIndexOf(",");
      res = '${res.substring(0, commaIdx)}]';
    }

    return res;
  }
}
