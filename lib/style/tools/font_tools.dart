import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

class FontTools {
  // Use this for reference:
  static String h1Label = "H1";
  static String h2Label = "H2";
  static String h3Label = "H3";
  static String h4Label = "H4";
  static String h5Label = "H5";
  static String normalLabel = "Normal";
  static String highlightLabel1 = "Highlight1";
  static String highlightLabel2 = "Highlight2";
  static String linkLabel = "Link";
  static String robotoLabel = "Roboto";
  static String latoLabel = "Lato";
  static String dancingScriptLabel = "DancingScript";

  final Map<String, FontModel> fonts = new Map();
  final RgbModel? headerColor1To3;
  final RgbModel? headerColor4To5;
  final RgbModel? defaultColor;
  final RgbModel? highlightColor;
  final RgbModel? linkColor;

  static List<EliudFontWeight> _weights = <EliudFontWeight>[
    EliudFontWeight.Bold,
    EliudFontWeight.Bold,
    EliudFontWeight.Bold,
    EliudFontWeight.Bold,
    EliudFontWeight.Normal
  ];
  static List<EliudFontStyle> _styles = <EliudFontStyle>[
    EliudFontStyle.Normal,
    EliudFontStyle.Normal,
    EliudFontStyle.Normal,
    EliudFontStyle.Normal,
    EliudFontStyle.Normal
  ];
  static List<EliudFontDecoration> decorations = <EliudFontDecoration>[
    EliudFontDecoration.None,
    EliudFontDecoration.None,
    EliudFontDecoration.None,
    EliudFontDecoration.None,
    EliudFontDecoration.None
  ];
  static double _defaultSize = 18;
  static List<double> _sizes = <double>[30, 22, 20, 20, 20];
  static List<String> _styleLabels = <String>[
    h1Label,
    h2Label,
    h3Label,
    h4Label,
    h5Label
  ];

  List<String> fontKeys = <String>[robotoLabel, latoLabel, dancingScriptLabel];
  List<String> fontNames = <String>["Roboto", "Lato", "Dancing Script"];

  FontTools({
    this.headerColor1To3,
    this.headerColor4To5,
    this.defaultColor,
    this.highlightColor,
    this.linkColor,
  }) {
    _setupFonts();
  }

  static String key(String fontLabel, String styleLabel) {
    return fontLabel + styleLabel;
  }

  FontModel _getHeaderFont(int fontIndex, int styleIndex) {
    double size = _sizes[styleIndex];
    String documentID = key(fontKeys[fontIndex], _styleLabels[styleIndex]);
    FontModel fontModel = FontModel(
      documentID: documentID,
      fontName: fontNames[fontIndex],
      size: size.toDouble(),
      weight: _weights[styleIndex],
      style: _styles[styleIndex],
      decoration: decorations[styleIndex],
      color: styleIndex < 3 ? headerColor1To3 : headerColor4To5,
    );
    fonts[documentID] = fontModel;
    return fontModel;
  }

  FontModel _getNormalFont(int fontIndex) {
    double size = _defaultSize;
    String documentID = key(fontKeys[fontIndex], normalLabel);
    FontModel fontModel = FontModel(
      documentID: documentID,
      fontName: fontNames[fontIndex],
      size: size.toDouble(),
      weight: EliudFontWeight.Normal,
      style: EliudFontStyle.Normal,
      decoration: EliudFontDecoration.None,
      color: defaultColor,
    );
    fonts[documentID] = fontModel;
    return fontModel;
  }

  FontModel _getHightlightFont1(int fontIndex) {
    double size = _defaultSize;
    String documentID = key(fontKeys[fontIndex], highlightLabel1);
    FontModel fontModel = FontModel(
      documentID: documentID,
      fontName: fontNames[fontIndex],
      size: size.toDouble(),
      weight: EliudFontWeight.MostThick,
      style: EliudFontStyle.Italic,
      decoration: EliudFontDecoration.None,
      color: highlightColor,
    );
    fonts[documentID] = fontModel;
    return fontModel;
  }

  FontModel _getHightlightFont2(int fontIndex) {
    double size = _defaultSize;
    String documentID = key(fontKeys[fontIndex], highlightLabel2);
    FontModel fontModel = FontModel(
      documentID: documentID,
      fontName: fontNames[fontIndex],
      size: size.toDouble(),
      weight: EliudFontWeight.MostThick,
      style: EliudFontStyle.Normal,
      decoration: EliudFontDecoration.Underline,
      color: highlightColor,
    );
    fonts[documentID] = fontModel;
    return fontModel;
  }

  FontModel _getLinkFont(int fontIndex) {
    double size = _defaultSize;
    String documentID = key(fontKeys[fontIndex], linkLabel);
    FontModel fontModel = FontModel(
      documentID: documentID,
      fontName: fontNames[fontIndex],
      size: size.toDouble(),
      weight: EliudFontWeight.Normal,
      style: EliudFontStyle.Normal,
      decoration: EliudFontDecoration.Underline,
      color: linkColor,
    );
    fonts[documentID] = fontModel;
    return fontModel;
  }

  void _installHeaderFontsFor(int fontIndex) {
    for (int i = 0; i < _weights.length; i++) {
      _getHeaderFont(fontIndex, i);
    }
  }

  void _installNormalFontFor(int fontIndex) {
    for (int i = 0; i < _weights.length; i++) {
      _getNormalFont(fontIndex);
    }
  }

  void _installHighlightFont1For(int fontIndex) {
    for (int i = 0; i < _weights.length; i++) {
      _getHightlightFont1(fontIndex);
    }
  }

  void _installHighlightFont2For(int fontIndex) {
    for (int i = 0; i < _weights.length; i++) {
      _getHightlightFont2(fontIndex);
    }
  }

  void _installLinkFontFor(int fontIndex) {
    for (int i = 0; i < _weights.length; i++) {
      _getLinkFont(fontIndex);
    }
  }

  void _setupFonts() {
    for (int i = 0; i < fontNames.length; i++) {
      _installHeaderFontsFor(i);
      _installNormalFontFor(i);
      _installHighlightFont1For(i);
      _installHighlightFont2For(i);
      _installLinkFontFor(i);
    }
  }

  /*
   * In case we want to store the fonts in a repository, to re-retrieve
   */
  Future<void> storeFonts() async {
    fonts.forEach((key, value) async {
      await AbstractRepositorySingleton.singleton.fontRepository()!.add(value);
    });
  }

  FontModel? getFont(String fontKey) {
    FontModel? fontModel = fonts[fontKey];
    if (fontModel == null) {
      print("Warning: font $fontKey not found");
    }
    return fontModel;
  }
}
