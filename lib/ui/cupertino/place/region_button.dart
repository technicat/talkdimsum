/* Technicat LLC */

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:talkdimsum/core/model/region.dart';

import 'region_scaffold.dart';

class RegionButton extends StatelessWidget {
  final Region region;

  RegionButton({Key? key, required this.region}) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoButton(
      onPressed: () => Get.to(() => RegionScaffold(region: region)),
      child: Text(region.name,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)));
}
