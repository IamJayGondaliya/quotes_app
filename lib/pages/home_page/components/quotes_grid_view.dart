import 'package:quotes_app/headers.dart';

Widget quotesGridView() {
  return Expanded(
    flex: 12,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scrollbar(
        thickness: 10,
        interactive: true,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: allQuotes.length,
          itemBuilder: (context, index) => Card(
            color: Colors.primaries[index % 18].shade400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    allQuotes[index].quote,
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text("- ${allQuotes[index].author}"),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
