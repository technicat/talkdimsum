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
    return Consumer(builder: (context, watch, child) {
      var dimsum = watch(dimsumProvider);
      return dimsum.map(
          data: (_) => Obx(() => _.value.favorites.contains(dish)
              ? CupertinoButton(
                  child: Icon(
                    CupertinoIcons.heart_fill,
                    semanticLabel: 'Remove this dish from favorites',
                  ),
                  onPressed: () {
                    _.value.removeFavorite(dish);
                  })
              : CupertinoButton(
                  child: Icon(CupertinoIcons.heart,
                      semanticLabel: 'Add this dish to favorites'),
                  onPressed: () {
                    _.value.addFavorite(dish);
                  })),
          loading: (_) => LoadingText(),
          error: (_) => ErrorText(error: _.error));
    });
  }
}
