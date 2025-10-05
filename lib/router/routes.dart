import 'package:go_router/go_router.dart';

import '../screens/category/category.dart';
import '../screens/home/home.dart';

import 'paths.dart';

final routes = GoRouter(routes: [
  GoRoute(
    name: Paths.home.name,
    path: Paths.home.path,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    name: Paths.category.name,
    path: Paths.category.path,
    builder: (context, state) =>
        CategoryScreen(categoryId: state.pathParameters['id']!),
  )
]);
