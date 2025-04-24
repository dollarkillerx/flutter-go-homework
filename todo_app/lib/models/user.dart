import 'package:dart_mappable/dart_mappable.dart';

part 'user.mapper.dart';

@MappableClass()
class UserModel with UserModelMappable {
  final int code;
  final UserData data;
  final String msg;

  const UserModel({required this.code, required this.data, required this.msg});
}

@MappableClass()
class UserData with UserDataMappable {
  final String id;
  final String user_name;
  final String nickname;
  final int status;
  final String avatar;
  final String created_at;
  final String preferred_theme;
  final bool anonymous;
  final List<dynamic> tags;

  const UserData({
    required this.id,
    required this.user_name,
    required this.nickname,
    required this.status,
    required this.avatar,
    required this.created_at,
    required this.preferred_theme,
    required this.anonymous,
    required this.tags,
  });
}

