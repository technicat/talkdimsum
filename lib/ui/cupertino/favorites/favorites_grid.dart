import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/ui/common/error_text.dart';

import 'package:talkdimsum/ui/cupertino/dishes/dishes_grid.dart';

class FavoritesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return ref.watch(dimsumProvider).map(
          data: (_) => DishesGrid(dishes: _.value.favorites),
          loading: (_) => LoadingText(),
          error: (_) => ErrorText(error: _.error));
    });
  }
}
