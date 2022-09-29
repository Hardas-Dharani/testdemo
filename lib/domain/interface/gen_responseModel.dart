import '../../data/gen_response.dart';

class GenResponseModel extends GenResponse {
  GenResponseModel({this.msg, this.success})
      : super(
          msg: msg,
          success: success,
        );

  String? msg;
  bool? success;

  factory GenResponseModel.fromJson(Map<String, dynamic>? json) {
    return GenResponseModel(
      msg: json?['message'] as String?,
      success: json?['success'] as bool?,
    );
  }
}
