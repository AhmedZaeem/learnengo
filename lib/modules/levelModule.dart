class levelModule {
  late bool enabled;
  late String icon;
  late String levelTitle;
  late String subLevelsCount;

  levelModule(
      {this.enabled = true,
      required this.icon,
      required this.levelTitle,
      required this.subLevelsCount});
}
