import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quotes_app/headers.dart';
import 'package:quotes_app/modals/quote_modal.dart';
import 'package:quotes_app/utils/quote_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showRandomQuote() {
    //Random  => dart:math
    Random r = Random();

    String category = "art";

    List<Quote> l = allQuotes
        .where(
          (element) => element.category == category,
        )
        .toList();

    Quote q = l[r.nextInt(l.length)];

    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text("Welcome !!"),
        contentPadding: const EdgeInsets.all(16),
        children: [
          Text(q.quote),
        ],
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        showRandomQuote();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          //Categories
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: allCategories
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Text(e),
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            flex: 12,
            child: ListView.separated(
              itemCount: allQuotes.length,
              itemBuilder: (context, index) => ExpansionTile(
                title: Text(allQuotes[index].quote),
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.detailPage,
          );
        },
      ),
    );
  }
}
