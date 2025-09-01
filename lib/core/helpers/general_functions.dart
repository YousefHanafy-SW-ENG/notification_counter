import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class GeneralFunctions {
  static setPreferredOrientation() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  static Logger logger = Logger(
      printer: PrettyPrinter(colors: true, printEmojis: true, methodCount: 0));

}
