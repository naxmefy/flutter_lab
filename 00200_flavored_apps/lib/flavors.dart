enum Flavor {
  APPLE,
  BANANA,
  LEMON,
}

class F {
  static Flavor? appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.APPLE:
        return 'Apple App';
      case Flavor.BANANA:
        return 'Banana App';
      case Flavor.LEMON:
        return 'Lemon App';
      default:
        return 'title';
    }
  }

}
