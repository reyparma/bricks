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
  print("\n==============================");
  print("TODO: Additional instructions for IOS and Android setup");
  print("==============================\n");
}
