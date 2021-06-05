/* Technicat LLC */

import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'categories_grid.dart';

class CategoriesScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        // resizeToAvoidBottomInset: true,
        navigationBar: CupertinoNavigationBar(
          //  transitionBetweenRoutes: true,
          middle: Text(AppLocalizations.of(context)!.dishes),
        ),
        child: SafeArea(child: CategoriesGrid()));
  }
}
