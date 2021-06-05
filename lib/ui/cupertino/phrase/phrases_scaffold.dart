/* Technicat LLC */

import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'phrases_widget.dart';

class PhrasesScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.phrases),
      ),
      child: PhrasesWidget());
}
