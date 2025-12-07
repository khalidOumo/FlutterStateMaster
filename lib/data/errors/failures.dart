import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message: message);
  
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class NetworkFailure extends Failure {
  NetworkFailure({required String message}) : super(message: message);

    @override
  // TODO: implement props
  List<Object?> get props => [message];
}