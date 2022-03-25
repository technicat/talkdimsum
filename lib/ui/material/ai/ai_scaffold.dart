/* Technicat LLC */

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../dishes/categories_grid.dart';

class AIScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.ai),
            actions: <Widget>[
             
            ]),
        body: CategoriesGrid(),
      
      );
}
