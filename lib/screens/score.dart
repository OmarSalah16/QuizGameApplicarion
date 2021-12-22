import 'package:flutter/material.dart';
import 'package:home/screens/Home_Screen.dart';
import 'package:home/widgets/widgets.dart';

class Score extends StatefulWidget
{
  const Score({ Key? key }) : super(key: key);

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score>
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      title: "Score",
      home: Scaffold
      (
        appBar: AppBar
        (
          iconTheme: const IconThemeData(color: Colors.green),
          centerTitle: true,
          title: appBar(context),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),

        body: Center
        (
          child: Column
          (
            children: 
            // ignore: prefer_const_literals_to_create_immutables
            [
              const SizedBox(height: 150,),
              const Text("Your Score", style: TextStyle(fontSize: 30)),
              const Text("100%", style: TextStyle(fontSize: 50)),
              const SizedBox(height: 100),
              GestureDetector
              (
                onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => const Home_Screen()));},
                child: Container
                (
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration
                  (
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  height: 50,
                  width: MediaQuery.of(context).size.width - 125,
                  child: const Text("Return to Home Screen", style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
              )
            ],
          ),
        ),
        
      ),
    );
  }
}