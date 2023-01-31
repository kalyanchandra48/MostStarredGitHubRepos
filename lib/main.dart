import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/home_page.dart';
import 'services/hive.dart';

void main() async {
  await Hive.initFlutter();
  await Global.initHiveFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
//     ApiService().getStarredRepoData(currentDate);
//     return Scaffold(
//         body: ValueListenableBuilder(
//             valueListenable: Global.boxes[BOXNAME.REPO_DATA_BOX]!.listenable(),
//             builder: (context, value, child) => FutureBuilder(
//                   future: RepoDataViewModel().getRepoData(),
//                   builder: (context, snapshot) => ListView.separated(
//                       shrinkWrap: true,
//                       itemCount: snapshot.data?.length ?? 1,
//                       separatorBuilder: (context, index) => const SizedBox(
//                             height: 20,
//                           ),
//                       itemBuilder: (context, index) {
//                         return Container(
//                           height: 50,
//                           color: Colors.blue,
//                           child: Text(snapshot.data?[index].username ?? ''),
//                         );
//                       }),
//                 )));
//   }
// }
