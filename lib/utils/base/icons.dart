class BaseIcon {
  static String _getImage(String path) {
    return "assets/icons/$path";
  }

  static String get google => _getImage("google.svg");
  static String get star => _getImage("star.svg");
}
