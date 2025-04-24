import 'package:dart_mappable/dart_mappable.dart';

part 'config.mapper.dart';

@MappableClass()
class ConfigModel with ConfigModelMappable {
  final int code;
  final ConfigData data;
  final String msg;

  const ConfigModel({required this.code, required this.data, required this.msg});
}

@MappableClass()
class ConfigData with ConfigDataMappable {
  final String title;
  final bool loginCaptcha;
  final bool regCaptcha;
  final bool forgetCaptcha;
  final bool emailActive;
  final String themes;
  final String defaultTheme;
  final String home_view_method;
  final String share_view_method;
  final bool authn;
  final String captcha_ReCaptchaKey;
  final String captcha_type;
  final String tcaptcha_captcha_app_id;
  final bool registerEnabled;
  final bool app_promotion;

  const ConfigData({
    required this.title,
    required this.loginCaptcha,
    required this.regCaptcha,
    required this.forgetCaptcha,
    required this.emailActive,
    required this.themes,
    required this.defaultTheme,
    required this.home_view_method,
    required this.share_view_method,
    required this.authn,
    required this.captcha_ReCaptchaKey,
    required this.captcha_type,
    required this.tcaptcha_captcha_app_id,
    required this.registerEnabled,
    required this.app_promotion,
  });
}