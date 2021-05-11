import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'navigation_bar.dart';



class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      home: NavigationBar(),
      title: 'Talk Dim Sum',
    );
  }
}

