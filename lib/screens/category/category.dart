import 'package:flutter/material.dart';

import '../../shared/types.dart';
import 'widgets/category_tab_view.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryId;
  const CategoryScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              title: Text('Work'),
              centerTitle: true,
              floating: true, // reappears when you scroll up
              snap: true, // immediately snaps into view
              pinned: false, // doesn't stay fixed at the top
              bottom: TabBar(
                tabs: [Text('In Progress'), Text('Completed')],
                labelColor: Colors.black,
                labelPadding: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.blue,
                indicatorWeight: 4.0,
              ),
            ),
          ],
          body: const TabBarView(
            children: [
              CategoryTabView(variant: CategoryTabViewVariant.inProgress),
              CategoryTabView(variant: CategoryTabViewVariant.completed),
            ],
          ),
        ),
      ),
    );
  }
}
