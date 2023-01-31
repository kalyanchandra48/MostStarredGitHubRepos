import 'package:flutter/material.dart';
import 'package:starred_github_repos/models/repo_data.dart';

import '../services/hive.dart';

List<RepoData> repos = [];

class RepoDataViewModel extends ChangeNotifier {
  List<RepoData> extractUserData(Map<String, dynamic> map) {
    List items = map['items'];

    for (var i = 0; i < items.length; i++) {
      repos.add((RepoData(
        repoName: items[i]['name'] ?? '',
        repoDescription: items[i]['description'] ?? '',
        starsCount: items[i]['stargazers_count']?.toInt() ?? 0,
        username: items[i]['full_name'] ?? '',
        avatar: items[i]['owner']['avatar_url'] ?? '',
      )));
    }
    for (var element in repos) {
      Global.boxes[BOXNAME.REPO_DATA_BOX]?.put(element.username, element);
    }
    //print('repos are $repos');

    return repos;
  }

  Future<List<RepoData>> getRepoData() async {
    List<RepoData> data = Global.boxes[BOXNAME.REPO_DATA_BOX]!.keys
        .map((e) => RepoData(
            repoName: Global.boxes[BOXNAME.REPO_DATA_BOX]!.get(e).repoName,
            repoDescription:
                Global.boxes[BOXNAME.REPO_DATA_BOX]!.get(e).repoDescription,
            starsCount: Global.boxes[BOXNAME.REPO_DATA_BOX]!.get(e).starsCount,
            username: Global.boxes[BOXNAME.REPO_DATA_BOX]!.get(e).username,
            avatar: Global.boxes[BOXNAME.REPO_DATA_BOX]!.get(e).avatar))
        .toList();
    return data;
  }
}
