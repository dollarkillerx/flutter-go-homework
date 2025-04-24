// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user.dart';

class UserModelMapper extends ClassMapperBase<UserModel> {
  UserModelMapper._();

  static UserModelMapper? _instance;
  static UserModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserModelMapper._());
      UserDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserModel';

  static int _$code(UserModel v) => v.code;
  static const Field<UserModel, int> _f$code = Field('code', _$code);
  static UserData _$data(UserModel v) => v.data;
  static const Field<UserModel, UserData> _f$data = Field('data', _$data);
  static String _$msg(UserModel v) => v.msg;
  static const Field<UserModel, String> _f$msg = Field('msg', _$msg);

  @override
  final MappableFields<UserModel> fields = const {
    #code: _f$code,
    #data: _f$data,
    #msg: _f$msg,
  };

  static UserModel _instantiate(DecodingData data) {
    return UserModel(
        code: data.dec(_f$code),
        data: data.dec(_f$data),
        msg: data.dec(_f$msg));
  }

  @override
  final Function instantiate = _instantiate;

  static UserModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserModel>(map);
  }

  static UserModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserModel>(json);
  }
}

mixin UserModelMappable {
  String toJson() {
    return UserModelMapper.ensureInitialized()
        .encodeJson<UserModel>(this as UserModel);
  }

  Map<String, dynamic> toMap() {
    return UserModelMapper.ensureInitialized()
        .encodeMap<UserModel>(this as UserModel);
  }

  UserModelCopyWith<UserModel, UserModel, UserModel> get copyWith =>
      _UserModelCopyWithImpl<UserModel, UserModel>(
          this as UserModel, $identity, $identity);
  @override
  String toString() {
    return UserModelMapper.ensureInitialized()
        .stringifyValue(this as UserModel);
  }

  @override
  bool operator ==(Object other) {
    return UserModelMapper.ensureInitialized()
        .equalsValue(this as UserModel, other);
  }

  @override
  int get hashCode {
    return UserModelMapper.ensureInitialized().hashValue(this as UserModel);
  }
}

extension UserModelValueCopy<$R, $Out> on ObjectCopyWith<$R, UserModel, $Out> {
  UserModelCopyWith<$R, UserModel, $Out> get $asUserModel =>
      $base.as((v, t, t2) => _UserModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserModelCopyWith<$R, $In extends UserModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserDataCopyWith<$R, UserData, UserData> get data;
  $R call({int? code, UserData? data, String? msg});
  UserModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserModel, $Out>
    implements UserModelCopyWith<$R, UserModel, $Out> {
  _UserModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserModel> $mapper =
      UserModelMapper.ensureInitialized();
  @override
  UserDataCopyWith<$R, UserData, UserData> get data =>
      $value.data.copyWith.$chain((v) => call(data: v));
  @override
  $R call({int? code, UserData? data, String? msg}) =>
      $apply(FieldCopyWithData({
        if (code != null) #code: code,
        if (data != null) #data: data,
        if (msg != null) #msg: msg
      }));
  @override
  UserModel $make(CopyWithData data) => UserModel(
      code: data.get(#code, or: $value.code),
      data: data.get(#data, or: $value.data),
      msg: data.get(#msg, or: $value.msg));

  @override
  UserModelCopyWith<$R2, UserModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserDataMapper extends ClassMapperBase<UserData> {
  UserDataMapper._();

  static UserDataMapper? _instance;
  static UserDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserData';

  static String _$id(UserData v) => v.id;
  static const Field<UserData, String> _f$id = Field('id', _$id);
  static String _$user_name(UserData v) => v.user_name;
  static const Field<UserData, String> _f$user_name =
      Field('user_name', _$user_name);
  static String _$nickname(UserData v) => v.nickname;
  static const Field<UserData, String> _f$nickname =
      Field('nickname', _$nickname);
  static int _$status(UserData v) => v.status;
  static const Field<UserData, int> _f$status = Field('status', _$status);
  static String _$avatar(UserData v) => v.avatar;
  static const Field<UserData, String> _f$avatar = Field('avatar', _$avatar);
  static String _$created_at(UserData v) => v.created_at;
  static const Field<UserData, String> _f$created_at =
      Field('created_at', _$created_at);
  static String _$preferred_theme(UserData v) => v.preferred_theme;
  static const Field<UserData, String> _f$preferred_theme =
      Field('preferred_theme', _$preferred_theme);
  static bool _$anonymous(UserData v) => v.anonymous;
  static const Field<UserData, bool> _f$anonymous =
      Field('anonymous', _$anonymous);
  static List<dynamic> _$tags(UserData v) => v.tags;
  static const Field<UserData, List<dynamic>> _f$tags = Field('tags', _$tags);

  @override
  final MappableFields<UserData> fields = const {
    #id: _f$id,
    #user_name: _f$user_name,
    #nickname: _f$nickname,
    #status: _f$status,
    #avatar: _f$avatar,
    #created_at: _f$created_at,
    #preferred_theme: _f$preferred_theme,
    #anonymous: _f$anonymous,
    #tags: _f$tags,
  };

  static UserData _instantiate(DecodingData data) {
    return UserData(
        id: data.dec(_f$id),
        user_name: data.dec(_f$user_name),
        nickname: data.dec(_f$nickname),
        status: data.dec(_f$status),
        avatar: data.dec(_f$avatar),
        created_at: data.dec(_f$created_at),
        preferred_theme: data.dec(_f$preferred_theme),
        anonymous: data.dec(_f$anonymous),
        tags: data.dec(_f$tags));
  }

  @override
  final Function instantiate = _instantiate;

  static UserData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserData>(map);
  }

  static UserData fromJson(String json) {
    return ensureInitialized().decodeJson<UserData>(json);
  }
}

mixin UserDataMappable {
  String toJson() {
    return UserDataMapper.ensureInitialized()
        .encodeJson<UserData>(this as UserData);
  }

  Map<String, dynamic> toMap() {
    return UserDataMapper.ensureInitialized()
        .encodeMap<UserData>(this as UserData);
  }

  UserDataCopyWith<UserData, UserData, UserData> get copyWith =>
      _UserDataCopyWithImpl<UserData, UserData>(
          this as UserData, $identity, $identity);
  @override
  String toString() {
    return UserDataMapper.ensureInitialized().stringifyValue(this as UserData);
  }

  @override
  bool operator ==(Object other) {
    return UserDataMapper.ensureInitialized()
        .equalsValue(this as UserData, other);
  }

  @override
  int get hashCode {
    return UserDataMapper.ensureInitialized().hashValue(this as UserData);
  }
}

extension UserDataValueCopy<$R, $Out> on ObjectCopyWith<$R, UserData, $Out> {
  UserDataCopyWith<$R, UserData, $Out> get $asUserData =>
      $base.as((v, t, t2) => _UserDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserDataCopyWith<$R, $In extends UserData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>> get tags;
  $R call(
      {String? id,
      String? user_name,
      String? nickname,
      int? status,
      String? avatar,
      String? created_at,
      String? preferred_theme,
      bool? anonymous,
      List<dynamic>? tags});
  UserDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserData, $Out>
    implements UserDataCopyWith<$R, UserData, $Out> {
  _UserDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserData> $mapper =
      UserDataMapper.ensureInitialized();
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>> get tags =>
      ListCopyWith($value.tags, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(tags: v));
  @override
  $R call(
          {String? id,
          String? user_name,
          String? nickname,
          int? status,
          String? avatar,
          String? created_at,
          String? preferred_theme,
          bool? anonymous,
          List<dynamic>? tags}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (user_name != null) #user_name: user_name,
        if (nickname != null) #nickname: nickname,
        if (status != null) #status: status,
        if (avatar != null) #avatar: avatar,
        if (created_at != null) #created_at: created_at,
        if (preferred_theme != null) #preferred_theme: preferred_theme,
        if (anonymous != null) #anonymous: anonymous,
        if (tags != null) #tags: tags
      }));
  @override
  UserData $make(CopyWithData data) => UserData(
      id: data.get(#id, or: $value.id),
      user_name: data.get(#user_name, or: $value.user_name),
      nickname: data.get(#nickname, or: $value.nickname),
      status: data.get(#status, or: $value.status),
      avatar: data.get(#avatar, or: $value.avatar),
      created_at: data.get(#created_at, or: $value.created_at),
      preferred_theme: data.get(#preferred_theme, or: $value.preferred_theme),
      anonymous: data.get(#anonymous, or: $value.anonymous),
      tags: data.get(#tags, or: $value.tags));

  @override
  UserDataCopyWith<$R2, UserData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
