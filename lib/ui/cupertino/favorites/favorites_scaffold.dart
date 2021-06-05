import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'favorites_grid.dart';

class FavoritesScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.favorites),
      ),
      child: SafeArea(child: FavoritesGrid()));
}
