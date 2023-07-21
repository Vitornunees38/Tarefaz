import 'package:flutter/material.dart';
import 'package:tarefaz/constants/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            searchBar(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Icon(
          Icons.menu,
          color: txtBox,
          size: 30,
        ),
        Container(
          width: 35,
          height: 35,
          child: Image.network(
              'https://www.digitary.net/wp-content/uploads/2021/07/Generic-Profile-Image-300x300.png'),
        )
      ]),
    );
  }
}

Widget searchBar() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration:
        BoxDecoration(color: txtBox, borderRadius: BorderRadius.circular(20)),
    child: const TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          prefixIcon: Icon(
            Icons.search,
            color: bgColor,
            size: 25,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 25, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey)),
    ),
  );
}
