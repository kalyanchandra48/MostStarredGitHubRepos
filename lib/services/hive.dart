import 'package:hive_flutter/hive_flutter.dart';
import 'package:starred_github_repos/models/repo_data.dart';

class Global {
  static late final Box _repodatas;

  static initHiveFlutter() async {
    await Hive.initFlutter();
    Hive.registerAdapter(RepoDataAdapter());
    _repodatas = await Hive.openBox('repodata');
  }

  static Box get repodata {
    return _repodatas;
  }

  static final Map<BOXNAME, Box> boxes = {
    BOXNAME.REPO_DATA_BOX: _repodatas,
  };
}

enum BOXNAME {
  REPO_DATA_BOX,
}
