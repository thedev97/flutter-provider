import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:master_provider/app/core/values/values.dart';
import 'package:master_provider/app/provider/counter_state.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  void initState() {
    super.initState();
    final countProvider = Provider.of<CounterProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
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
          Consumer<CounterProvider>(builder: (context, value, child) {
            return Center(
              child: Text(
                value.count.toString(),
                style: AppTextStyles.header,
              ),
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterProvider.setCount(),
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

  Widget subTitle() {
    return Text(
      'Single Provider',
      style: AppTextStyles.subHeader,
    );
  }
}
