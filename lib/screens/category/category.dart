import 'package:flutter/material.dart';

import '../../shared/types.dart';
import 'widgets/category_tab_view.dart';
import './widgets//header_popup.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryId;
  const CategoryScreen({super.key, required this.categoryId});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              title: const Text('Work'),
              actions: [
                HeaderPopup(
                  categoryName: widget.categoryId,
                  viewVariant:
                      CategoryTabViewVariant.values[_tabController.index],
                )
              ],
              centerTitle: true,
              floating: true,
              snap: false,
              pinned: true,
              bottom: TabBar(
                controller: _tabController,
                tabs: const [Text('In Progress'), Text('Completed')],
                labelColor: Colors.black,
                labelPadding: const EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.blue,
                indicatorWeight: 4.0,
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
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
