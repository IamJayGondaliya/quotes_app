import 'package:quotes_app/headers.dart';
import 'package:quotes_app/modals/quote_modal.dart';
import 'package:quotes_app/utils/fonts_enum.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color color = Colors.white;
  double opacity = 1;
  String fonts = AppFonts.dancingScript.name;

  @override
  Widget build(BuildContext context) {
    Quote quote = ModalRoute.of(context)!.settings.arguments as Quote;

    return PopScope(
      canPop: false,
      onPopInvoked: (val) {
        if (val) {
          return;
        }
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Alert !!"),
            content: const Text("Are you sure to exit?"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // _canPop = true;
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text("Yes"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No"),
              ),
            ],
          ),
        );
      },
      // onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detail Page"),
          actions: [
            IconButton(
              onPressed: () {
                opacity = 1;
                color = Colors.white;
                fonts = AppFonts.dancingScript.name;
                setState(() {});
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: color.withOpacity(opacity),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      quote.quote,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: fonts,
                      ),
                    ),
                    Text("- ${quote.author}"),
                  ],
                ),
              ),
            ),
            Expanded(
              //Column
              child: ListView(
                children: [
                  Text("Background color"),
                  //Row
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        18,
                        (index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GestureDetector(
                            onTap: () {
                              color = Colors.primaries[index];
                              setState(() {});
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.primaries[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Slider(
                      value: opacity,
                      min: 0,
                      max: 1,
                      onChanged: (val) {
                        opacity = val;
                        setState(() {});
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: AppFonts.values
                        .map(
                          (e) => TextButton(
                            onPressed: () {
                              fonts = e.name;
                              setState(() {});
                            },
                            child: Text(
                              "Abc",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: e.name,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
