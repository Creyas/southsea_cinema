import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  testWidgets(
    'home page displays title, movie cards and booking buttons',
    (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.text('Southsea Cinema'), findsOneWidget);
      expect(find.text('The Dark Knight'), findsOneWidget);
      expect(
        find.text('Chainsaw Man - The Movie: Reze Arc'),
        findsOneWidget,
      );
      expect(find.text('Book'), findsNWidgets(2));
    },
  );

  testWidgets(
    'booking button opens the selected movie listing',
    (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      final firstBookButton = find
          .widgetWithText(
            ElevatedButton,
            'Book',
          )
          .first;

      await tester.tap(firstBookButton);
      await tester.pumpAndSettle();

      expect(find.text('The Dark Knight'), findsOneWidget);
      expect(find.text('PG-13 | 2h 32m'), findsOneWidget);
      expect(find.text('£8.50'), findsOneWidget);
      expect(
        find.textContaining('When the Joker wreaks havoc on Gotham'),
        findsOneWidget,
      );
      expect(find.text('Add to order'), findsOneWidget);
    },
  );
}
