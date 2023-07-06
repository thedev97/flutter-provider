import 'package:flutter/material.dart';
import '../../core/values/values.dart';

class ValueNotifierPage extends StatelessWidget {
  ValueNotifierPage({Key? key}) : super(key: key);

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      resizeToAvoidBottomInset: false,
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
              height: 25,
            ),
            title(),
            const SizedBox(
              height: 5,
            ),
            subTitle(),
            const SizedBox(
              height: 25,
            ),
            ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Center(
                    child: Text(
                      "Value = ${_counter.value.toString()}",
                      style: AppTextStyles.header,
                    ),
                  );
                }),
            const SizedBox(
              height: 50,
            ),
            title2(),
            const SizedBox(
              height: 5,
            ),
            subTitle(),
            const SizedBox(
              height: 5,
            ),
            ValueListenableBuilder(
                valueListenable: _toggle,
                builder: (context, value, child) {
                  return Center(
                    child: TextFormField(
                      obscureText: _toggle.value,
                      style: AppTextStyles.listText,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: AppTextStyles.subHeader,
                        suffixIcon: GestureDetector(
                          onTap: () => _toggle.value = !_toggle.value,
                          child: Icon(
                            _toggle.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green.withOpacity(0.5),
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        backgroundColor: Colors.black,
        mini: true,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Widget title() {
    return Text(
      'Counter',
      style: AppTextStyles.titleText,
    );
  }

  Widget title2() {
    return Text(
      'Password Field',
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
