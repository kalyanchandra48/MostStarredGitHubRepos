import 'package:flutter/material.dart';
import 'package:starred_github_repos/models/repo_data.dart';
import 'package:starred_github_repos/pages/user_page.dart';
import 'package:starred_github_repos/styles/fonts.dart';

class RepoDataWidget extends StatelessWidget {
  final AsyncSnapshot<List<RepoData>> snapshot;
  final int index;
  const RepoDataWidget({
    super.key,
    required this.snapshot,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDetailsPage(
                data: snapshot.data![index],
              ),
            ));
      },
      child: Hero(
        tag: 'userImage',
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage(snapshot.data?[index].avatar ?? ''))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 230,
                        child: Text(
                          'Repo:${snapshot.data?[index].repoName}',
                          style: AppFonts.repoText,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        snapshot.data?[index].repoDescription ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppFonts.desText,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.green,
                        ),
                        Text(
                            snapshot.data?[index].starsCount.toString() ?? '0'),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        width: 200,
                        child: Text(
                            'Username:  ${snapshot.data?[index].username}'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
