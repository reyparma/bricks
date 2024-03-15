import 'package:dartz/dartz.dart';
import 'package:{{appName.snakeCase()}}/core/error/failures.dart';
import 'package:{{appName.snakeCase()}}/features/authentication/domain/entities/credentials_entity.dart';
import 'package:{{appName.snakeCase()}}/features/authentication/domain/repositories/authentication_repository.dart';

class LogInUseCase {
  final AuthenticationRepository repository;

  LogInUseCase(this.repository);

  Future<Either<Failure, CredentialsEntity>> call() async {
    return await repository.logIn();
  }
}
