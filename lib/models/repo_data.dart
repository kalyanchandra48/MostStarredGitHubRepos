import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:starred_github_repos/pages/repo_data_view_model.dart';

part 'repo_data.g.dart';

@HiveType(typeId: 1)
class RepoData {
  @HiveField(1)
  String repoName;
  @HiveField(2)
  String repoDescription;
  @HiveField(3)
  int starsCount;
  @HiveField(4)
  String username;
  @HiveField(5)
  String avatar;
  RepoData({
    required this.repoName,
    required this.repoDescription,
    required this.starsCount,
    required this.username,
    required this.avatar,
  });

  RepoData copyWith({
    String? repoName,
    String? repoDescription,
    int? starsCount,
    String? username,
    String? avatar,
  }) {
    return RepoData(
      repoName: repoName ?? this.repoName,
      repoDescription: repoDescription ?? this.repoDescription,
      starsCount: starsCount ?? this.starsCount,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'repoName': repoName});
    result.addAll({'repoDescription': repoDescription});
    result.addAll({'starsCount': starsCount});
    result.addAll({'username': username});
    result.addAll({'avatar': avatar});

    return result;
  }

  factory RepoData.fromMap(Map<String, dynamic> map) {
    RepoDataViewModel().extractUserData(map);
    return RepoData(
      repoName: map['items'][0]['name'] ?? '',
      repoDescription: map['items'][0]['description'] ?? '',
      starsCount: map['items'][0]['stargazers_count']?.toInt() ?? 0,
      username: map['items'][0]['full_name'] ?? '',
      avatar: map['items']['owner'][0]['avatar_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RepoData.fromJson(String source) =>
      RepoData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RepoData(repoName: $repoName, repoDescription: $repoDescription, starsCount: $starsCount, username: $username, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RepoData &&
        other.repoName == repoName &&
        other.repoDescription == repoDescription &&
        other.starsCount == starsCount &&
        other.username == username &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return repoName.hashCode ^
        repoDescription.hashCode ^
        starsCount.hashCode ^
        username.hashCode ^
        avatar.hashCode;
  }
}
