import 'package:dartz/dartz.dart';
import 'package:{{appName.snakeCase()}}/core/error/failures.dart';
import 'package:{{appName.snakeCase()}}/features/authentication/domain/entities/credentials_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, CredentialsEntity>> logIn();
  Future<Either<Failure, Unit>> logOut();
}
