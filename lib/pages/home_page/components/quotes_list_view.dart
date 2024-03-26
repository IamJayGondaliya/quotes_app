import 'package:quotes_app/headers.dart';
import 'package:quotes_app/utils/fonts_enum.dart';

Widget quotesListView() {
  return Expanded(
    flex: 12,
    child: ListView.separated(
      itemCount: allQuotes.length,
      itemBuilder: (context, index) => ExpansionTile(
        title: Text(
          allQuotes[index].quote,
          style: TextStyle(
            fontFamily: AppFonts.foundation.name,
          ),
        ),
        children: [
          Text("Author: ${allQuotes[index].author}"),
          Text("Category: ${allQuotes[index].category}"),
        ],
      ),
      separatorBuilder: (context, index) => const Divider(
        indent: 16,
        endIndent: 16,
      ),
    ),
  );
}
