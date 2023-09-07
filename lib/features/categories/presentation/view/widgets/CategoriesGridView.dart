import 'package:ebook_app/features/categories/presentation/view/widgets/CategoryItem.dart';
import 'package:ebook_app/features/categories/presentation/view_models/category_tools/categories.dart';
import 'package:flutter/material.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({
    super.key,
    required Categories categoriesConstructor,
  }) : _categoriesConstructor = categoriesConstructor;

  final Categories _categoriesConstructor;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 350,
        childAspectRatio: 1,
        //   crossAxisSpacing: 10,
        //    mainAxisSpacing: 10,
      ),
      itemCount: _categoriesConstructor.CategoriesList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: ((context, index) {
        return CategoryItem(
          category: _categoriesConstructor.CategoriesList[index].category,
          imgLink: _categoriesConstructor.CategoriesList[index].imageAsset,
        );
      }),
    );
  }
}