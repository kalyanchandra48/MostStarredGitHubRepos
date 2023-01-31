import 'package:flutter/material.dart';
import 'package:starred_github_repos/models/repo_data.dart';
import 'package:starred_github_repos/styles/fonts.dart';

class UserDetailsPage extends StatelessWidget {
  final RepoData data;
  const UserDetailsPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'userImage',
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 20),
                height: 190,
                width: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(data.avatar))),
              ),
              Text(
                'Repository Name:   ${data.repoName}',
                style: AppFonts.repoText,
              ),
              Text(
                'Repository Description:   ${data.repoDescription}',
                style: AppFonts.desText.copyWith(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'StarsCount for this Repo:  ${data.starsCount}',
                  style: AppFonts.repoText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'UserName of the Repository:  ${data.username}',
                  style: AppFonts.repoText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
