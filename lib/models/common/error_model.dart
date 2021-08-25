import '../../util/constants/locale_keys.dart';

class ErrorModel {
  int code;
  String description;
  String message;

  ErrorModel(
      {this.code = 0,
      this.message = LocaleKeys.error,
      this.description = LocaleKeys.unknown_error});
}
