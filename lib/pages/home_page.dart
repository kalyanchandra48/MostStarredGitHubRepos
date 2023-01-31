import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:starred_github_repos/common_widgets/repo_data_widget.dart';
import 'package:starred_github_repos/pages/repo_data_view_model.dart';
import 'package:starred_github_repos/services/hive.dart';
import 'package:starred_github_repos/services/service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    ApiService().getStarredRepoData(currentDate);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Most Starred GitHub Repo Datas'),
        ),
        body: ValueListenableBuilder(
            valueListenable: Global.boxes[BOXNAME.REPO_DATA_BOX]!.listenable(),
            builder: (context, value, child) => FutureBuilder(
                  future: RepoDataViewModel().getRepoData(),
                  builder: (context, snapshot) => ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length ?? 1,
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemBuilder: (context, index) {
                        return RepoDataWidget(
                          snapshot: snapshot,
                          index: index,
                        );
                      }),
                )));
  }
}
