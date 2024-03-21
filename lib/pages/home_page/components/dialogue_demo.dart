import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/headers.dart';

/*
    - SimpleDialogue
      - Title
      - Content
      - No buttons
    - Confirmation Dialogue
      - AlertDialogue
        - Title
        - Content
        - Action => Buttons

    method:

      showDialogue(
        context: context,
        builder: (context) => Widget(),
      );


*/

//UDF
Widget dialogueDemo({
  required BuildContext context,
}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                title: const Text("Simple Dialogue"),
                children: [
                  RadioListTile(
                    title: const Text("Male"),
                    value: "Male",
                    groupValue: "Male",
                    onChanged: (val) {},
                  ),
                  RadioListTile(
                    title: const Text("Female"),
                    value: "Female",
                    groupValue: "Female",
                    onChanged: (val) {},
                  ),
                ],
                // children: List.generate(
                //   3,
                //   (index) => ListTile(
                //     title: Text("Item: $index"),
                //   ),
                // ),
              ),
            );
          },
          child: const Text("Simple Dialogue"),
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(
                //Custom (full-screen)
                child: Container(
                  margin: const EdgeInsets.all(30),
                  color: Colors.blue,
                  //Expanded        =>  unscrollable row/column
                  //SizedBox.expand =>  any widget
                  child: SizedBox.expand(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              // builder: (context) => AlertDialog(
              //   title: const Text("Alert !!"),
              //   content: const Text("Are you sure to exit?"),
              //   actions: [
              //     ElevatedButton(
              //       onPressed: () {
              //         Navigator.pop(context);
              //       },
              //       child: const Text("Yes"),
              //     ),
              //     OutlinedButton(
              //       onPressed: () {
              //         Navigator.pop(context);
              //       },
              //       child: const Text("No"),
              //     ),
              //   ],
              // ),
            );
          },
          child: const Text("Conformational Dialogue"),
        ),
      ],
    ),
  );
}
