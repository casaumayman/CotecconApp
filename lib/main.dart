import 'package:coteccons_app/shared/utils/flavor_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';

import 'app_binding.dart';
import 'di.dart';
import 'routes/routes.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DenpendencyInjection.init();
  final flavor = await FlavorUtil.getFlavor();
  runApp(App(
    flavor: flavor ?? Flavor.CTC,
  ));
  configLoading();
}

class App extends StatelessWidget {
  final Flavor flavor;

  const App({super.key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    final isCTCApp = flavor == Flavor.CTC;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: Routes.SPLASH,
      defaultTransition: Transition.fade,
      getPages: isCTCApp ? AppPages.routes : AppPages.consRoutes,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
      title: flavor == Flavor.CTC ? "VnTask" : "VnTask Partner",
      theme: ThemeConfig.lightTheme,
      builder: EasyLoading.init(),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    // ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = Colors.yellow
    ..backgroundColor = ColorConstants.lightGray
    ..indicatorColor = hexToColor('#64DEE0')
    ..textColor = hexToColor('#64DEE0')
    // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
