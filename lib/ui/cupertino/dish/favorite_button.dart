import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/model/dish.dart';
import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/ui/common/error_text.dart';

class FavoriteButton extends StatelessWidget {
  final Dish dish;

  FavoriteButton({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      var dimsum = ref.watch(dimsumProvider);
      return dimsum.map(
          data: (_) => Obx(() => _.value.favorites.contains(dish)
              ? CupertinoButton(
                  onPressed: () => _.value.removeFavorite(dish),
                  child: Icon(
                    CupertinoIcons.heart_fill,
                    semanticLabel: 'Remove this dish from favorites',
                  ),
                )
              : CupertinoButton(
                  onPressed: () => _.value.addFavorite(dish),
                  child: Icon(CupertinoIcons.heart,
                      semanticLabel: 'Add this dish to favorites'),
                )),
          loading: (_) => LoadingText(),
          error: (_) => ErrorText(error: _.error));
    });
  }
}
