/* Technicat LLC */

import 'package:flutter/widgets.dart';

class ErrorText extends StatelessWidget {
  final Object error;

  ErrorText({Key key, @required this.error}) : super();

  @override
  Widget build(BuildContext context) {
    return  Text(
                error.toString()
              );
  }
}

class LoadingText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Text('Loading...)'
      );
  }
}
