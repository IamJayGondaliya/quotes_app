import 'package:quotes_app/headers.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _canPop = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _canPop,
      onPopInvoked: (val) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Alert !!"),
            content: const Text("Are you sure to exit?"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _canPop = true;
                },
                child: const Text("Yes"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _canPop = false;
                },
                child: const Text("No"),
              ),
            ],
          ),
        ).then((value) {
          if (_canPop) {
            Navigator.pop(context);
          }
        });
      },
      // onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detail Page"),
        ),
      ),
    );
  }
}
