class Path {
  final String name;
  final String path;

  Path({required this.name, required this.path});
}

class Paths {
  static final home = Path(name: 'home', path: '/');
  static final category = Path(name: 'category', path: '/category/:id');
}
