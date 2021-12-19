// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/screens/home.dart';
import 'package:home/screens/signin.dart';
import 'package:home/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:home/models/Quiz.dart';
import 'package:home/models/QuizProvider.dart';

// ignore: camel_case_types
class Home_Screen extends StatelessWidget
{
  const Home_Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        iconTheme: const IconThemeData(color: Colors.blue),
        centerTitle: true,
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      drawer: Drawer
      (
        child: ListView
        (
          padding: EdgeInsets.zero,
          children:
          [
            DrawerHeader
            (
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column
              (
                children:
                // ignore: prefer_const_literals_to_create_immutables
                [
                  const Text('Alan Turing',textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white)),
                  const Text('Level 41',textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white)),
                  const SizedBox(height: 40),
                  const Text('16 correct answers to lvl.(42)',textAlign: TextAlign.justify,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white))
                ],
              )
            ),
            ListTile
            (
              title: const Text('Notifications'),
              onTap: () {},
            ),
            ListTile
            (
              title: const Text('Sound'),
              onTap: () {},
            ),
            ListTile
            (
              title: const Text('Vibration'),
              onTap: () {},
            ),
            ListTile
            (
              title: const Text('Credits'),
              onTap: () {},
            ),
            ListTile
            (
              title: const Text('Sign Out'),
              onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn() ));},
            )
          ],
        )
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Padding
      (
        padding: const EdgeInsets.all(8.0),
        child: Consumer<QuizProviders>
        (
          builder: (context, QuizProviders data, child)
          {
            return data.getQuiz.isNotEmpty ? ListView.builder
            (
              itemCount: data.getQuiz.length,
              itemBuilder: (context, index) => CardList(data.getQuiz[index], index),
            )
            : GestureDetector
            (
              onTap: () {},
              child: Center
              (
                child: Column
                (
                  children:
                  [
                    const SizedBox(height: 80),
                    Image.asset
                    (
                      'images/quizlogo.png',
                      height: 200,
                      width: 200,
                    ),
                    
                    const SizedBox(height: 60),
                    const Text("ADD SOME QUIZZES NOW!!",style: TextStyle(color: Colors.black,fontSize: 20)),
                  ],
                )
              )
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton
      (
        onPressed: () {showAlertDialog(context);},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add,color: Colors.black),
      ),
    );
  }
}

// ignore: must_be_immutable
class CardList extends StatelessWidget
{
  Quiz notes;
  int index;
  CardList(this.notes, this.index, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return Padding
    (
      padding: const EdgeInsets.all(2.0),
      child: Container
      (
        decoration: const BoxDecoration
        (
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),

        child: ListTile
        (
          onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => const MyApp()));},
          leading: const Icon(Icons.note),
          title: Text(notes.title),
          subtitle: Text(notes.description),
          trailing: IconButton
          (
            icon: const Icon(Icons.delete),
            onPressed: () {Provider.of<QuizProviders>(context, listen: false).removeQuiz(index);},
          ),
        )
      )
    );
  }
}

showAlertDialog(BuildContext context)
{
  TextEditingController _Title = TextEditingController();
  TextEditingController _Description = TextEditingController();
  // Create button
  Widget okButton = TextButton
  (
    child: const Text("ADD QUIZ"),
    onPressed: ()
    {
      Provider.of<QuizProviders>(context, listen: false).addQuizz(_Title.text, _Description.text);
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog
  (
    title: const Text("ADD A NEW QUIZ "),
    content: Column
    (
      mainAxisSize: MainAxisSize.min,
      children:
      [
        TextField
        (
          controller: _Title,
          decoration: const InputDecoration(hintText: "Enter Title"),
        ),

        TextField
        (
          controller: _Description,
          decoration: const InputDecoration(hintText: "Enter Description"),
        ),
      ],
    ),

    actions: [okButton],
  );

  // show the dialog
  showDialog
  (
    context: context,
    builder: (BuildContext context) {return alert;}
  );
}
