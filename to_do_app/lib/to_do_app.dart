import "package:flutter/material.dart";
import "package:to_do_app/first_screen.dart";
import "package:to_do_app/form.dart";

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title = ['Task1', 'Task2', 'Task3', 'Task 4', 'Task 5'];
    List<String> subtitle = [
      'This is task1',
      'This is task 2',
      'This is task 3',
      'This is task 4',
      'This is task 5'
    ];

    return Scaffold(
      drawer: SafeArea(
          child: Drawer(
        child: Column(
          children: [
            ListTile(
              onTap: () {},
              title: const Text("Second Screen"),
              // subtitle: ,
            )
          ],
        ),
      )),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        leading: const Icon(Icons.add_a_photo),
        title: const Center(child: Text("To Do App")),
        actions: [
          ElevatedButton(onPressed: () {}, child: const Text("Help")),
          TextButton(onPressed: () {}, child: const Text("Search"))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(400, 50, 400, 30),
          child: ListView.builder(
              itemCount: title.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(title[index]),
                  subtitle: Text(subtitle[index]),
                  trailing: const Wrap(
                      spacing: 12,
                      children: <Widget>[Icon(Icons.done), Icon(Icons.delete)]),
                );
              })),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(450, 20, 400, 100),
        child: Wrap(
          spacing: 12,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const FirstScreen();
                  }));
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //     // SnackBar show message for few seconds
                  //     SnackBar(
                  //         content: const Text("Add Task Clicked"),
                  //         duration: const Duration(seconds: 5),
                  //         action: SnackBarAction(
                  //             label: "Click Here", onPressed: () {})));
                },
                child: const Text("Add Task")),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    // MaterialPageRoute is used for moving from one page to another and Transition
                    .push(MaterialPageRoute(builder: (context) {
                  return const SignUp();
                }));
              },
              child: const Text("Delete All"),
            )
          ],
        ),
      ),
    );
  }
}
