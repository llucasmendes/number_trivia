import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository!);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia for the number from the repository',
    () async {
      // arrange
      when(
        () => mockNumberTriviaRepository?.getConcreteNumberTrivia(1),
      ).thenAnswer(
        (_) async => const Right(tNumberTrivia),
      );
      // act
      final result = await usecase!(
        Params(number: tNumber),
      );
      // acert
      expect(
        result,
        const Right<dynamic, NumberTrivia>(tNumberTrivia),
      );

      verify(
        () => mockNumberTriviaRepository?.getConcreteNumberTrivia(tNumber),
      );

      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
