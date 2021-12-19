// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:home/models/Quiz.dart';
import 'package:home/models/QuizProvider.dart';

// ignore: camel_case_types
class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.teal),
              child: Column(
                children: [
                  Text('Alan Turing',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white)),
                  Text('Level 41',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white)),
                  SizedBox(height: 40),
                  Text('16 correct answers to lvl.(42)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white))
                ],
              )),
          ListTile(
            title: const Text('Notifications'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Sound'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Vibration'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Credits'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Reset Game Progress'),
            onTap: () {},
          )
        ],
      )),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.teal,
          iconTheme: IconThemeData(color: Colors.white),
          title: const Text(
            "Welcome to Quiz game",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<QuizProviders>(
          builder: (context, QuizProviders data, child) {
            return data.getQuiz.length != 0
                ? ListView.builder(
                    itemCount: data.getQuiz.length,
                    itemBuilder: (context, index) {
                      return CardList(data.getQuiz[index], index);
                    },
                  )
                : GestureDetector(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Center(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Image.asset(
                          'images/quizlogo.png',
                          height: 200,
                          width: 200,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Text(
                          "ADD SOME QUIZZES NOW!!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog(context);
        },
        backgroundColor: Colors.teal,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CardList extends StatelessWidget {
  Quiz notes;
  int index;
  CardList(this.notes, this.index);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
              leading: Icon(Icons.note),
              title: Text(notes.title),
              subtitle: Text(notes.description),
              trailing: new IconButton(
                icon: new Icon(Icons.delete),
                onPressed: () {
                  Provider.of<QuizProviders>(context, listen: false)
                      .removeQuiz(index);
                },
              ),
            )));
  }
}

showAlertDialog(BuildContext context) {
  TextEditingController _Title = TextEditingController();
  TextEditingController _Description = TextEditingController();
  // Create button
  Widget okButton = TextButton(
    child: Text("ADD NOTE"),
    onPressed: () {
      Provider.of<QuizProviders>(context, listen: false)
          .addQuizz(_Title.text, _Description.text);

      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("ADD A NEW QUIZ "),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _Title,
          decoration: InputDecoration(hintText: "Enter Title"),
        ),
        TextField(
          controller: _Description,
          decoration: InputDecoration(hintText: "Enter Description"),
        ),
      ],
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
