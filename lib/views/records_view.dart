import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecordsScreen extends StatefulWidget {
  static String routeName = "/recordsScreen";
  const RecordsScreen({Key? key}) : super(key: key);

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  final _dataRecords = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var scoresRef = _dataRecords.collection('Scores');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Rank"),
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream:
                    scoresRef.orderBy('score', descending: true).snapshots(),
                builder: (context, AsyncSnapshot asyncSnapshot) {
                  if (asyncSnapshot.hasError) {
                    return const Center(
                      child: Text("Please check your internet connection."),
                    );
                  } else {
                    if (asyncSnapshot.hasData) {
                      List<DocumentSnapshot> listOfDocumentSnap =
                          asyncSnapshot.data.docs;
                      return Flexible(
                          child: ListView.builder(
                              itemCount: listOfDocumentSnap.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    title: Text(
                                      "${index + 1}. ${listOfDocumentSnap[index].get('name')}",
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    subtitle: Text(
                                      "Point: ${listOfDocumentSnap[index].get('score')}",
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                );
                              }));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                })
          ],
        ),
      ),
    );
  }
}
