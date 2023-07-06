import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/values/values.dart';
import '../../provider/theme_state.dart';

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({Key? key}) : super(key: key);

  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Flutter Provider",
          style: AppTextStyles.normalText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            title(),
            const SizedBox(
              height: 5,
            ),
            subTitle(),
            const SizedBox(
              height: 25,
            ),
            Consumer<ThemeProvider>(builder: (context, value, child) {
              return RadioListTile<ThemeMode>(
                  title: Text(
                    'Light',
                    style: AppTextStyles.radioValueText,
                  ),
                  activeColor: Colors.black,
                  value: ThemeMode.light,
                  groupValue: value.themeMode,
                  onChanged: value.setTheme);
            }),
            Consumer<ThemeProvider>(builder: (context, value, child) {
              return RadioListTile<ThemeMode>(
                  title: Text(
                    'Dark',
                    style: AppTextStyles.darkRadioValueText,
                  ),
                  activeColor: Colors.white,
                  value: ThemeMode.dark,
                  groupValue: value.themeMode,
                  onChanged: value.setTheme);
            }),
            Consumer<ThemeProvider>(builder: (context, value, child) {
              return RadioListTile<ThemeMode>(
                  title: Text(
                    'System Mode',
                    style: AppTextStyles.radioValueText,
                  ),
                  activeColor: Colors.black,
                  value: ThemeMode.system,
                  groupValue: value.themeMode,
                  onChanged: value.setTheme);
            }),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Text(
      'Theme Mode Changer',
      style: AppTextStyles.titleText,
    );
  }

  Widget subTitle() {
    return Text(
      'With Provider',
      style: AppTextStyles.subHeader,
    );
  }
}
