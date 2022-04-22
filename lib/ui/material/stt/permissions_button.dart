import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';

class PermissionsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => AppSettings.openAppSettings(),
      child: Text('Enable permissions'),
    );
  }
}
