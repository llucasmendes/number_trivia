import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'date_trivia_state.dart';

class DateTriviaCubit extends Cubit<DateTriviaState> {
  DateTriviaCubit() : super(DateTriviaInitial());
}
