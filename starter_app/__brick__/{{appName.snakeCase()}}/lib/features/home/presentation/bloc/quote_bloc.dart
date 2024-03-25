import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:{{appName.snakeCase()}}/app/injection_container.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc() : super(QuoteEmpty()) {
    on<QuoteChange>((event, emit) async {
      emit(QuoteLoading());
      final response = await Dio().get("https://api.quotable.io/quotes/random");
      if (response.statusCode == 200) {
        final data = response.data;
        locator<Box>().put('quoteInfo', data[0]);
        emit(QuoteLoaded(data[0]['content']));
      } else {
        emit(const QuoteLoadFailure("Cannot get quote from server"));
      }
    });
  }
}
