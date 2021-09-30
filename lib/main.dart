import 'package:liveasy/meta/hook/hook.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const StartView());
}
