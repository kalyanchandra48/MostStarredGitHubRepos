import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starred_github_repos/models/repo_data.dart';
import 'package:starred_github_repos/pages/repo_data_view_model.dart';

class ApiService {
  Future<List<RepoData>> getStarredRepoData(String currentDate) async {
    final response = await http.get(Uri.parse(
        'https://api.github.com/search/repositories?q=created:<$currentDate&sort=stars&order=desc'));

    RepoDataViewModel().extractUserData(json.decode(response.body));

    return repos;
  }
}
