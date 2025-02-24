import 'package:core_module/core_module.dart';
import 'package:datasource_module/src/network/base/network_error_type.dart';

class ErrorResponseModel extends NModel {
  late final String errorCode;
  late final ErrorMesssageModel messsageModel;

  ErrorResponseModel.fromJson(super.json) : super.fromJson();

  @override
  parse() {
    errorCode = json.get('error_code').stringValue();
    messsageModel = ErrorMesssageModel.fromJson(json.get('error').jsonValue());
  }

  String get getErrorCode {
    return messsageModel.code.isNotEmpty ? messsageModel.code : errorCode;
  }
}

class ErrorMesssageModel {
  late final String code;
  late final String message;
  late final NetworkErrorType type;

  ErrorMesssageModel.fromJson(NJson json) {
    code = json.get('code').stringValue();
    message = json.get('message').stringValue();
    type = code.getType() ?? NetworkErrorType.unknownError;
  }

  ErrorMesssageModel.fromType(this.type) {
    code = type.getIdentifier();
    message = type.getMessage();
  }

  @override
  String toString() {
    return '$code | $message';
  }
}
