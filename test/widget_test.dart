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

  testWidgets(
    'add to order button displays booking feedback',
    (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      await tester.tap(
        find.widgetWithText(ElevatedButton, 'Book').first,
      );
      await tester.pumpAndSettle();

      final ticketDropdown = find.byType(DropdownMenu<int>);

      await tester.scrollUntilVisible(
        ticketDropdown,
        300,
        scrollable: find.byType(Scrollable).last,
      );

      await tester.tap(ticketDropdown);
      await tester.pumpAndSettle();

      final quantityThree = find.text('3').last;

      await tester.scrollUntilVisible(
        quantityThree,
        200,
        scrollable: find.byType(Scrollable).last,
      );

      await tester.tap(quantityThree);
      await tester.pumpAndSettle();

      final addToOrderButton = find.widgetWithText(
        ElevatedButton,
        'Add to order',
      );

      await tester.scrollUntilVisible(
        addToOrderButton,
        300,
        scrollable: find.byType(Scrollable).last,
      );

      await tester.tap(addToOrderButton);
      await tester.pump();

      expect(
        find.text('Added 3 tickets to the order'),
        findsOneWidget,
      );
    },
  );
}
