import 'package:flutter/material.dart';

import '../../models/Category.dart';
import '../../services/category_operations.dart';

Widget createCategory(Category category) {
  return Container(
      color: Colors.blueGrey.shade400,
      child: Row(
        children: [
          Image.network(category.imageURL, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              category.name,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ));
}


List<Widget> createListOfCategories() {
  List<Category> categoryList =
  CategoryOperations.getCategories(); // Rec Data
  // Convert Data to Widget Using map function
  List<Widget> categories = categoryList
      .map((Category category) => createCategory(category))
      .toList();
  return categories;
}

Widget createGrid() {
  return Container(
    padding: EdgeInsets.all(10),
    height: 280,
    child: GridView.count(
      childAspectRatio: 5 / 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: createListOfCategories(),
      crossAxisCount: 2,
    ),
  );
}