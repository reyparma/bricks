import 'package:dartz/dartz.dart';
import 'package:{{appName.snakeCase()}}/core/error/failures.dart';
import 'package:{{appName.snakeCase()}}/features/authentication/domain/repositories/authentication_repository.dart';

class LogOutUseCase {
  final AuthenticationRepository repository;

  LogOutUseCase(this.repository);

  Future<Either<Failure, Unit>> call() async {
    return await repository.logOut();
  }
}
