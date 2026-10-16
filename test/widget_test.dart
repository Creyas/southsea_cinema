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
}
