import 'package:get/get.dart';
import 'package:liveasy/meta/hook/hook.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: Langs.english,
      title: AppSetting.appName,
      translations: LocalString(),
      getPages: AppRoutes().routes,
      initialBinding: GlobalBinding(),
      initialRoute: AppRoutes.language,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
    );
  }
}
