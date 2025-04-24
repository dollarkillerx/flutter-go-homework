// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'config.dart';

class ConfigModelMapper extends ClassMapperBase<ConfigModel> {
  ConfigModelMapper._();

  static ConfigModelMapper? _instance;
  static ConfigModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConfigModelMapper._());
      ConfigDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ConfigModel';

  static int _$code(ConfigModel v) => v.code;
  static const Field<ConfigModel, int> _f$code = Field('code', _$code);
  static ConfigData _$data(ConfigModel v) => v.data;
  static const Field<ConfigModel, ConfigData> _f$data = Field('data', _$data);
  static String _$msg(ConfigModel v) => v.msg;
  static const Field<ConfigModel, String> _f$msg = Field('msg', _$msg);

  @override
  final MappableFields<ConfigModel> fields = const {
    #code: _f$code,
    #data: _f$data,
    #msg: _f$msg,
  };

  static ConfigModel _instantiate(DecodingData data) {
    return ConfigModel(
        code: data.dec(_f$code),
        data: data.dec(_f$data),
        msg: data.dec(_f$msg));
  }

  @override
  final Function instantiate = _instantiate;

  static ConfigModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ConfigModel>(map);
  }

  static ConfigModel fromJson(String json) {
    return ensureInitialized().decodeJson<ConfigModel>(json);
  }
}

mixin ConfigModelMappable {
  String toJson() {
    return ConfigModelMapper.ensureInitialized()
        .encodeJson<ConfigModel>(this as ConfigModel);
  }

  Map<String, dynamic> toMap() {
    return ConfigModelMapper.ensureInitialized()
        .encodeMap<ConfigModel>(this as ConfigModel);
  }

  ConfigModelCopyWith<ConfigModel, ConfigModel, ConfigModel> get copyWith =>
      _ConfigModelCopyWithImpl<ConfigModel, ConfigModel>(
          this as ConfigModel, $identity, $identity);
  @override
  String toString() {
    return ConfigModelMapper.ensureInitialized()
        .stringifyValue(this as ConfigModel);
  }

  @override
  bool operator ==(Object other) {
    return ConfigModelMapper.ensureInitialized()
        .equalsValue(this as ConfigModel, other);
  }

  @override
  int get hashCode {
    return ConfigModelMapper.ensureInitialized().hashValue(this as ConfigModel);
  }
}

extension ConfigModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ConfigModel, $Out> {
  ConfigModelCopyWith<$R, ConfigModel, $Out> get $asConfigModel =>
      $base.as((v, t, t2) => _ConfigModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ConfigModelCopyWith<$R, $In extends ConfigModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ConfigDataCopyWith<$R, ConfigData, ConfigData> get data;
  $R call({int? code, ConfigData? data, String? msg});
  ConfigModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ConfigModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ConfigModel, $Out>
    implements ConfigModelCopyWith<$R, ConfigModel, $Out> {
  _ConfigModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ConfigModel> $mapper =
      ConfigModelMapper.ensureInitialized();
  @override
  ConfigDataCopyWith<$R, ConfigData, ConfigData> get data =>
      $value.data.copyWith.$chain((v) => call(data: v));
  @override
  $R call({int? code, ConfigData? data, String? msg}) =>
      $apply(FieldCopyWithData({
        if (code != null) #code: code,
        if (data != null) #data: data,
        if (msg != null) #msg: msg
      }));
  @override
  ConfigModel $make(CopyWithData data) => ConfigModel(
      code: data.get(#code, or: $value.code),
      data: data.get(#data, or: $value.data),
      msg: data.get(#msg, or: $value.msg));

  @override
  ConfigModelCopyWith<$R2, ConfigModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ConfigModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ConfigDataMapper extends ClassMapperBase<ConfigData> {
  ConfigDataMapper._();

  static ConfigDataMapper? _instance;
  static ConfigDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConfigDataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ConfigData';

  static String _$title(ConfigData v) => v.title;
  static const Field<ConfigData, String> _f$title = Field('title', _$title);
  static bool _$loginCaptcha(ConfigData v) => v.loginCaptcha;
  static const Field<ConfigData, bool> _f$loginCaptcha =
      Field('loginCaptcha', _$loginCaptcha);
  static bool _$regCaptcha(ConfigData v) => v.regCaptcha;
  static const Field<ConfigData, bool> _f$regCaptcha =
      Field('regCaptcha', _$regCaptcha);
  static bool _$forgetCaptcha(ConfigData v) => v.forgetCaptcha;
  static const Field<ConfigData, bool> _f$forgetCaptcha =
      Field('forgetCaptcha', _$forgetCaptcha);
  static bool _$emailActive(ConfigData v) => v.emailActive;
  static const Field<ConfigData, bool> _f$emailActive =
      Field('emailActive', _$emailActive);
  static String _$themes(ConfigData v) => v.themes;
  static const Field<ConfigData, String> _f$themes = Field('themes', _$themes);
  static String _$defaultTheme(ConfigData v) => v.defaultTheme;
  static const Field<ConfigData, String> _f$defaultTheme =
      Field('defaultTheme', _$defaultTheme);
  static String _$home_view_method(ConfigData v) => v.home_view_method;
  static const Field<ConfigData, String> _f$home_view_method =
      Field('home_view_method', _$home_view_method);
  static String _$share_view_method(ConfigData v) => v.share_view_method;
  static const Field<ConfigData, String> _f$share_view_method =
      Field('share_view_method', _$share_view_method);
  static bool _$authn(ConfigData v) => v.authn;
  static const Field<ConfigData, bool> _f$authn = Field('authn', _$authn);
  static String _$captcha_ReCaptchaKey(ConfigData v) => v.captcha_ReCaptchaKey;
  static const Field<ConfigData, String> _f$captcha_ReCaptchaKey =
      Field('captcha_ReCaptchaKey', _$captcha_ReCaptchaKey);
  static String _$captcha_type(ConfigData v) => v.captcha_type;
  static const Field<ConfigData, String> _f$captcha_type =
      Field('captcha_type', _$captcha_type);
  static String _$tcaptcha_captcha_app_id(ConfigData v) =>
      v.tcaptcha_captcha_app_id;
  static const Field<ConfigData, String> _f$tcaptcha_captcha_app_id =
      Field('tcaptcha_captcha_app_id', _$tcaptcha_captcha_app_id);
  static bool _$registerEnabled(ConfigData v) => v.registerEnabled;
  static const Field<ConfigData, bool> _f$registerEnabled =
      Field('registerEnabled', _$registerEnabled);
  static bool _$app_promotion(ConfigData v) => v.app_promotion;
  static const Field<ConfigData, bool> _f$app_promotion =
      Field('app_promotion', _$app_promotion);

  @override
  final MappableFields<ConfigData> fields = const {
    #title: _f$title,
    #loginCaptcha: _f$loginCaptcha,
    #regCaptcha: _f$regCaptcha,
    #forgetCaptcha: _f$forgetCaptcha,
    #emailActive: _f$emailActive,
    #themes: _f$themes,
    #defaultTheme: _f$defaultTheme,
    #home_view_method: _f$home_view_method,
    #share_view_method: _f$share_view_method,
    #authn: _f$authn,
    #captcha_ReCaptchaKey: _f$captcha_ReCaptchaKey,
    #captcha_type: _f$captcha_type,
    #tcaptcha_captcha_app_id: _f$tcaptcha_captcha_app_id,
    #registerEnabled: _f$registerEnabled,
    #app_promotion: _f$app_promotion,
  };

  static ConfigData _instantiate(DecodingData data) {
    return ConfigData(
        title: data.dec(_f$title),
        loginCaptcha: data.dec(_f$loginCaptcha),
        regCaptcha: data.dec(_f$regCaptcha),
        forgetCaptcha: data.dec(_f$forgetCaptcha),
        emailActive: data.dec(_f$emailActive),
        themes: data.dec(_f$themes),
        defaultTheme: data.dec(_f$defaultTheme),
        home_view_method: data.dec(_f$home_view_method),
        share_view_method: data.dec(_f$share_view_method),
        authn: data.dec(_f$authn),
        captcha_ReCaptchaKey: data.dec(_f$captcha_ReCaptchaKey),
        captcha_type: data.dec(_f$captcha_type),
        tcaptcha_captcha_app_id: data.dec(_f$tcaptcha_captcha_app_id),
        registerEnabled: data.dec(_f$registerEnabled),
        app_promotion: data.dec(_f$app_promotion));
  }

  @override
  final Function instantiate = _instantiate;

  static ConfigData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ConfigData>(map);
  }

  static ConfigData fromJson(String json) {
    return ensureInitialized().decodeJson<ConfigData>(json);
  }
}

mixin ConfigDataMappable {
  String toJson() {
    return ConfigDataMapper.ensureInitialized()
        .encodeJson<ConfigData>(this as ConfigData);
  }

  Map<String, dynamic> toMap() {
    return ConfigDataMapper.ensureInitialized()
        .encodeMap<ConfigData>(this as ConfigData);
  }

  ConfigDataCopyWith<ConfigData, ConfigData, ConfigData> get copyWith =>
      _ConfigDataCopyWithImpl<ConfigData, ConfigData>(
          this as ConfigData, $identity, $identity);
  @override
  String toString() {
    return ConfigDataMapper.ensureInitialized()
        .stringifyValue(this as ConfigData);
  }

  @override
  bool operator ==(Object other) {
    return ConfigDataMapper.ensureInitialized()
        .equalsValue(this as ConfigData, other);
  }

  @override
  int get hashCode {
    return ConfigDataMapper.ensureInitialized().hashValue(this as ConfigData);
  }
}

extension ConfigDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ConfigData, $Out> {
  ConfigDataCopyWith<$R, ConfigData, $Out> get $asConfigData =>
      $base.as((v, t, t2) => _ConfigDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ConfigDataCopyWith<$R, $In extends ConfigData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? title,
      bool? loginCaptcha,
      bool? regCaptcha,
      bool? forgetCaptcha,
      bool? emailActive,
      String? themes,
      String? defaultTheme,
      String? home_view_method,
      String? share_view_method,
      bool? authn,
      String? captcha_ReCaptchaKey,
      String? captcha_type,
      String? tcaptcha_captcha_app_id,
      bool? registerEnabled,
      bool? app_promotion});
  ConfigDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ConfigDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ConfigData, $Out>
    implements ConfigDataCopyWith<$R, ConfigData, $Out> {
  _ConfigDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ConfigData> $mapper =
      ConfigDataMapper.ensureInitialized();
  @override
  $R call(
          {String? title,
          bool? loginCaptcha,
          bool? regCaptcha,
          bool? forgetCaptcha,
          bool? emailActive,
          String? themes,
          String? defaultTheme,
          String? home_view_method,
          String? share_view_method,
          bool? authn,
          String? captcha_ReCaptchaKey,
          String? captcha_type,
          String? tcaptcha_captcha_app_id,
          bool? registerEnabled,
          bool? app_promotion}) =>
      $apply(FieldCopyWithData({
        if (title != null) #title: title,
        if (loginCaptcha != null) #loginCaptcha: loginCaptcha,
        if (regCaptcha != null) #regCaptcha: regCaptcha,
        if (forgetCaptcha != null) #forgetCaptcha: forgetCaptcha,
        if (emailActive != null) #emailActive: emailActive,
        if (themes != null) #themes: themes,
        if (defaultTheme != null) #defaultTheme: defaultTheme,
        if (home_view_method != null) #home_view_method: home_view_method,
        if (share_view_method != null) #share_view_method: share_view_method,
        if (authn != null) #authn: authn,
        if (captcha_ReCaptchaKey != null)
          #captcha_ReCaptchaKey: captcha_ReCaptchaKey,
        if (captcha_type != null) #captcha_type: captcha_type,
        if (tcaptcha_captcha_app_id != null)
          #tcaptcha_captcha_app_id: tcaptcha_captcha_app_id,
        if (registerEnabled != null) #registerEnabled: registerEnabled,
        if (app_promotion != null) #app_promotion: app_promotion
      }));
  @override
  ConfigData $make(CopyWithData data) => ConfigData(
      title: data.get(#title, or: $value.title),
      loginCaptcha: data.get(#loginCaptcha, or: $value.loginCaptcha),
      regCaptcha: data.get(#regCaptcha, or: $value.regCaptcha),
      forgetCaptcha: data.get(#forgetCaptcha, or: $value.forgetCaptcha),
      emailActive: data.get(#emailActive, or: $value.emailActive),
      themes: data.get(#themes, or: $value.themes),
      defaultTheme: data.get(#defaultTheme, or: $value.defaultTheme),
      home_view_method:
          data.get(#home_view_method, or: $value.home_view_method),
      share_view_method:
          data.get(#share_view_method, or: $value.share_view_method),
      authn: data.get(#authn, or: $value.authn),
      captcha_ReCaptchaKey:
          data.get(#captcha_ReCaptchaKey, or: $value.captcha_ReCaptchaKey),
      captcha_type: data.get(#captcha_type, or: $value.captcha_type),
      tcaptcha_captcha_app_id: data.get(#tcaptcha_captcha_app_id,
          or: $value.tcaptcha_captcha_app_id),
      registerEnabled: data.get(#registerEnabled, or: $value.registerEnabled),
      app_promotion: data.get(#app_promotion, or: $value.app_promotion));

  @override
  ConfigDataCopyWith<$R2, ConfigData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ConfigDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
