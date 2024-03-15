import 'package:dartz/dartz.dart';
import 'package:{{appName.snakeCase()}}/core/error/failures.dart';
import 'package:{{appName.snakeCase()}}/features/authentication/domain/entities/user_entity.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, UserEntity>> getUserProfile();
}
