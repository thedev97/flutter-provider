import 'my_fav_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/values/values.dart';
import '../../provider/favourite_state.dart';

class FavouriteApp extends StatefulWidget {
  const FavouriteApp({Key? key}) : super(key: key);

  @override
  State<FavouriteApp> createState() => _FavouriteAppState();
}

class _FavouriteAppState extends State<FavouriteApp> {
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
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyFavList())),
              icon: const Icon(
                Icons.favorite,
                size: 20,
                color: Colors.white,
              ))
        ],
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
            favList(),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Text(
      'Favourite List',
      style: AppTextStyles.titleText,
    );
  }

  Widget subTitle() {
    return Text(
      'With Provider',
      style: AppTextStyles.subHeader,
    );
  }

  Widget favList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) =>
            Consumer<FavouriteProvider>(builder: (context, value, child) {
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
    );
  }
}
