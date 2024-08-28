import 'dart:math';

import 'package:flutter/material.dart';

import '../helper/ApiHelper.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('News',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        body: FutureBuilder(
            future: APIHelper.apiHelper.articles(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                Text("ERROR ${snapshot.error}");
              } else if (snapshot.hasData) {
                List? data = snapshot.data;
                return Center(
                  child: Column(
                    children: [
                      (data == null)
                          ? const Text('No data yet ')
                          : ListTile(
                              title: Text('${data[index]['source']['name']}'),
                            )
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
