import 'package:flutter/material.dart';
import 'package:home/screens/Home_Screen.dart';
import 'package:home/widgets/widgets.dart';
import 'package:home/screens/signup.dart';

class SignIn extends StatefulWidget
{
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn>
{
  final _formKey = GlobalKey<FormState>();
  String? email, password;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      body: Form
      (
        key: _formKey,
        child: Container
        (
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column
          (
            children:
            [
              const Spacer(),
              TextFormField
              (
                validator: (val){return val!.isEmpty ? "Enter email" : null;},
                decoration: const InputDecoration(hintText: "Email"),
                onChanged: (val)
                {
                  email = val;
                },
              ),
              const SizedBox(height: 6),
              TextFormField
              (
                validator: (val){return val!.isEmpty ? "Enter password" : null;},
                decoration: const InputDecoration(hintText: "Password"),
                onChanged: (val)
                { 
                  password = val;
                },
              ),
              const SizedBox(height: 14),
              GestureDetector(
                onTap: ()
                {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home_Screen() ));
                },
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
                  width: MediaQuery.of(context).size.width - 48,
                  child: const Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
              ),
              const SizedBox(height:18),
              Row
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Text("Don't have an account? ", style: TextStyle(fontSize: 16),),
                  GestureDetector(
                    onTap: ()
                    {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp() ));
                    },
                    child: Text("Sign Up", style: TextStyle(fontSize: 16, decoration: TextDecoration.underline, color: Colors.blue))
                  )
                ],
              ),
              const SizedBox(height: 80)
            ],
          ),
        ),
      ),
    );
  }
}