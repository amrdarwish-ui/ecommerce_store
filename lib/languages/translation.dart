import 'package:ecommerce_store/languages/ar.dart';
import 'package:get/get.dart';

import 'en.dart';

class Translation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
}
