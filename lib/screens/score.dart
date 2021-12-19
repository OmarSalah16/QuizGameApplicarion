import 'package:flutter/material.dart';
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

        
      ),
    );
  }
}