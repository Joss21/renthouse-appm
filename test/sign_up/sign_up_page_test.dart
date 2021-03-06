// ignore_for_file: prefer_const_constructors
import 'package:RentHouse/repository/repository.dart';
import 'package:RentHouse/ui/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock implements Repository {}

void main() {
  group('SignUpPage', () {
    test('has a route', () {
      expect(CrearCuenta(), isA<MaterialPageRoute>());
    });

    testWidgets('renders a SignUpForm', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider<Repository>(
          create: (_) => MockAuthenticationRepository(),
          child: MaterialApp(home: CrearCuenta()),
        ),
      );
      //expect(find.byType(CrearCuentaForm()), findsOneWidget);
    });
  });
}
