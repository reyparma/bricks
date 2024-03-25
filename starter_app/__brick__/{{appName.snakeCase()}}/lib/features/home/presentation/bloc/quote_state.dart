part of 'quote_bloc.dart';

abstract class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object?> get props => [];
}

class QuoteEmpty extends QuoteState {}

class QuoteLoading extends QuoteState {}

class QuoteLoaded extends QuoteState {
  final String quote;

  const QuoteLoaded(this.quote);

  @override
  List<Object?> get props => [quote];
}

class QuoteLoadFailure extends QuoteState {
  final String message;

  const QuoteLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}