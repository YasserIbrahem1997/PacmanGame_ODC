import 'package:get/instance_manager.dart';

import '../fethGoogleLogin.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => fethGoogleLogin());
  }

}