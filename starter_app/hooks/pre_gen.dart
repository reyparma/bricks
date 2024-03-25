import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final name = (context.vars['appName'] as String).snakeCase;
  
  final progress = context.logger.progress('Creating $name');
  await Process.run('flutter', ['create', name,'--platforms=ios,android,web']);
  progress.complete();

  // Delete main.dart
  File file = File('$name/lib/main.dart');
  await file.delete();
}
