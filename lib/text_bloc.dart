import 'package:bloc_test/text_event.dart';
import 'package:bloc_test/text_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextBloc extends Bloc<TextEvent, TextState> {
  TextBloc() : super(InitState()) {
    on<EnterTextEvent>(
      (event, emit) {
        List<int> nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
        String txt = event.text;
        if (txt.length > 6) {
          emit(OverCharState());
        } else if (txt.isEmpty) {
          emit(EmptyState());
        } else if (txt.contains('$nums')) {
          emit(WriteNumState());
        } else {
          emit(CorrectState());
        }
      },
    );
  }
}
