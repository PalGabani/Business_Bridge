import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/business_category.dart';

//import 'package:flutter/src/material/theme.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.b_category,required this.onSelectedCategory});

  final Category b_category;
  final void Function() onSelectedCategory;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onSelectedCategory,
      splashColor: Theme.of(context).primaryColor ,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              b_category.color.withOpacity(0.5),
              b_category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          b_category.name,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color:Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
