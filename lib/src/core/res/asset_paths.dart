class AssetPaths {
  AssetPaths._();

  static const String _baseSvg = 'assets/svg';

  static String svg(String fileName) => '$_baseSvg/$fileName';
}