import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => launch(
          'https://play.google.com/store/apps/details?id=com.google.android.googlequicksearchbox'),
      child: Text('Enable Google Voice Services'),
    );
  }
}
