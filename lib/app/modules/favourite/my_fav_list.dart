import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/values/values.dart';
import '../../provider/favourite_state.dart';

class MyFavList extends StatefulWidget {
  const MyFavList({Key? key}) : super(key: key);

  @override
  State<MyFavList> createState() => _MyFavListState();
}

class _MyFavListState extends State<MyFavList> {
  @override
  Widget build(BuildContext context) {
    final myFavProvider =
        Provider.of<FavouriteProvider>(context, listen: false);
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
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: myFavProvider.selectedItemList.length,
                itemBuilder: (context, index) => Consumer<FavouriteProvider>(
                    builder: (context, value, child) {
                  return ListTile(
                    onTap: () => value.selectedItemList.contains(index)
                        ? value.removeItem(index)
                        : value.addItem(index),
                    title: Text(
                      "Item $index",
                      style: AppTextStyles.listText,
                    ),
                    trailing: Icon(
                      value.selectedItemList.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red,
                      size: 20,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Text(
      'My Favourite List',
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
