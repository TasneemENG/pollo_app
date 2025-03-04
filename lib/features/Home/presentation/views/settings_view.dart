import 'package:flutter/material.dart';
import 'package:pollo/features/Home/presentation/views/widgets/settings/settings_body.dart';
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SettingsBody()
    );
  }
}
