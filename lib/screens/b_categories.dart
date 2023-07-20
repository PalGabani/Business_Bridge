import 'package:business_bridge/widgets/gridview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/business.dart';
import '../models/business_category.dart';


class category_page extends StatefulWidget {
  const category_page({super.key,required this.availableMeals });

  // final void Function(Meal meal) onToggleFavorite;
  //final List<Meal> availableMeals;
  final List<Business> availableMeals;
  @override
  State<category_page> createState() => _category_pageState();
}

class _category_pageState extends State<category_page>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,

    );
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  // void _selectedCategory(BuildContext context, Category category) {
  //   final filterMeals = widget.availableMeals
  //       .where((meal) => meal.categories.contains(category.id))
  //       .toList();
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (ctx) => meals_page(
  //         title: category.title,
  //         meals: filterMeals,
  //       ),
  //     ),
  //   );
  // }
void _selectedcateegory(BuildContext context,Category b_category){
  final filterMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(b_category.id))
        .toList();
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (ctx) => (
    //
    //     ),
    //   ),
    // );
}
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 15),
        children: [
          //availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(
             b_category: category,
              onSelectedCategory: () {
               // _selectedCategory(context, category);
              },
            )
        ],
      ),
      builder: (context, child) => SlideTransition(
        child: child,
        position: Tween(
          begin: Offset(0, 0.3),
          end: Offset(0, 0),
        ).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInCirc),
        ),
      ),
    );
  }
}
