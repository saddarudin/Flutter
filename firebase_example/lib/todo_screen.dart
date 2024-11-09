// task make update method

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'add_todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final uid = auth.currentUser?.uid;

    final CollectionReference todoRef = FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .collection('todo');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: todoRef.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("No Data Found"));
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var todo = snapshot.data!.docs[index];
                      return ListTile(
                        title: Text(todo['title']),
                        subtitle:
                            Text("${todo['description']}- ${todo['date']}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            todoRef.doc(todo.id).delete().then((_) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Deleted Successfully'),
                                duration: Duration(milliseconds: 3000),
                              ));
                            });
                          },
                        ),
                      );
                    },
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddTodo()),
                  );
                },
                child: const Text("Add Task"),
              ),
              ElevatedButton(
                onPressed: () async {
                  QuerySnapshot querySnapshot = await todoRef.get();
                  for (QueryDocumentSnapshot doc in querySnapshot.docs) {
                    await doc.reference.delete();
                  }
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Delete Successfully"),
                    duration: Duration(milliseconds: 3000),
                  ));
                },
                child: const Text("Delete All"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
