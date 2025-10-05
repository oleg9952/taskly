import 'package:flutter/material.dart';
import './widgets/category_card.dart';
import '../../shared/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final insets = MediaQuery.viewPaddingOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Taskly',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: HORIZONTAL_PADDING),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: const Icon(
                Icons.add,
                size: 30,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            padding: EdgeInsets.only(
              top: 10,
              left: HORIZONTAL_PADDING + insets.left,
              right: HORIZONTAL_PADDING + insets.right,
              bottom: 30,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: getColumnsCount(constraints.maxWidth),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 140,
            ),
            itemCount: 40,
            itemBuilder: (_, __) => const CategoryCard(
              title: 'Home',
              description: 'Some long description...',
            ),
          );
        },
      ),
    );
  }

  int getColumnsCount(double maxWidth) {
    if (maxWidth >= 1300) return 4;
    if (maxWidth >= 1000) return 3;
    if (maxWidth >= 600) return 2;
    return 1;
  }
}
