import 'package:RentHouse/repository/repository.dart';
import 'package:RentHouse/ui/screens/login-forms.dart';
import 'package:RentHouse/ui/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock implements Repository {}

void main() {
  group('LoginPage', () {
    test('has a page', () {
      expect(Login(), isA<MaterialPage>());
    });

    testWidgets('renders a LoginForm', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider<Repository>(
          create: (_) => MockAuthenticationRepository(),
          //child: const MaterialApp(home: HomePage()),
        ),
      );
      expect(find.byType(LoginForm), findsOneWidget);
    });
  });
}
