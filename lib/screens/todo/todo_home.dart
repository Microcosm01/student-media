import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;
    final userId = _auth.currentUser?.uid;
    final docRef = db.collection('Student').doc(userId).collection('todo');
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/tasks');
              },
              icon: const Icon(Icons.add)),
          title: const Text('All your tasks'),
        ),
        body: StreamBuilder(
            stream: docRef.snapshots(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      final DocumentSnapshot docSnapshot =
                          snapshot.data!.docs[index];
                      return Slidable(
                        endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          SlidableAction(
                              icon: Icons.delete,
                              onPressed: (BuildContext context) async {
                                final docId = docSnapshot.id;
                                await docRef.doc(docId).delete();
                              })
                        ]),
                        child: Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(docSnapshot['title']),
                            subtitle: Text(docSnapshot['desciption']),
                          ),
                        ),
                      );
                    }));
              }
              return const CircularProgressIndicator();
            })));
  }
}
