import 'package:flutter/material.dart';
import 'package:home/widgets/widgets.dart';
import 'package:home/screens/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();
  String? name, email, password;

  @override
  Widget build(BuildContext context) {
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
                validator: (val){return val!.isEmpty ? "Enter name" : null;},
                decoration: const InputDecoration(hintText: "Name"),
                onChanged: (val)
                {
                  name = val;
                },
              ),
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
              GestureDetector
              (
                onTap: (){},
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
                  child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
              ),
              const SizedBox(height:18),
              Row
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Text("Already have an account? ", style: TextStyle(fontSize: 16),),
                  GestureDetector
                  (
                    onTap: ()
                    {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn() ));
                    },
                    child: Text("Sign In", style: TextStyle(fontSize: 16, decoration: TextDecoration.underline, color: Colors.blue))
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