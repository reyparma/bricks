import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final name = (context.vars['appName'] as String).snakeCase;

  final appDirectory = Directory.current;
  if (!appDirectory.existsSync()) return;

  File file = File('$name/env.template');
  await file.rename('$name/.env');

  file = File('$name/web/index.template');
  await file.rename('$name/web/index.html');

  file = File('$name/pubspec.template');
  await file.rename('$name/pubspec.yaml');

  final progress = context.logger.progress('Installing packages');
  // Run `flutter packages get` after generation.
  await Process.run('flutter', ['packages', 'get']);
  progress.complete();

  print("\n===================================================================");
  print("WEB Version:");
  print("\$ cd $name/");
  print("\$ flutter run -d chrome --web-port=3000 --web-renderer=html");
  print("\nIOS Version:");
  print("\$ cd $name/");
  print("\n\$ open ios/Runner.xcworkspace");
  print("(Edit the bundle identifier and signing information as needed. See https://github.com/reyparma/bricks/tree/main/starter_app for more details.) When done, exit XCode and type:");
  print("\n\$ flutter build ios");
  print("\$ flutter run -d <IOS SIMULATOR DEVICE ID>");
  print("\nANDROID Version:");
  print("\$ cd $name/");
  print("\$ flutter build apk");
  print("\$ flutter run -d <ANDROID SIMULATOR DEVICE ID>");
  print("\n===================================================================\n");
}
