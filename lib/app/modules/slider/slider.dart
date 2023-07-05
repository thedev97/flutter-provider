import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/values/values.dart';
import '../../provider/slider_state.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({Key? key}) : super(key: key);

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Flutter Provider",
          style: AppTextStyles.normalText,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          Consumer<SliderProvider>(builder: (context, value, child) {
            return Slider(
              onChanged: (val) => value.setValue(val),
              value: value.value,
              min: 0.0,
              max: 1.0,
              activeColor: Colors.black,
            );
          }),
          const SizedBox(
            height: 15,
          ),
          Consumer<SliderProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(value.value),
                    ),
                    child: Center(
                      child: Text(
                        'Container 1',
                        style: AppTextStyles.valueText,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(value.value),
                    ),
                    child: Center(
                      child: Text(
                        'Container 2',
                        style: AppTextStyles.valueText,
                      ),
                    ),
                  ),
                )
              ],
            );
          })
        ],
      ),
    );
  }

  Widget title() {
    return Text(
      'Slider',
      style: AppTextStyles.titleText,
    );
  }

  Widget subTitle() {
    return Text(
      'Multi Provider',
      style: AppTextStyles.subHeader,
    );
  }
}
