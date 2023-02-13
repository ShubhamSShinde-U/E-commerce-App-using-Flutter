import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}
//'_' under score used tp make variable private
class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton =false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    //calling setState to call the build method to change the data on the same screen
    if(_formKey.currentState!.validate()){
       setState(() {
      changeButton =  true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      changeButton =  false;
    });
    }
   
  }



  // const MyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    
    return Material(
     child:SingleChildScrollView(
     child: Form
     (
      key: _formKey,
       child: Column(
        children: [
          Image.asset(
            "assests/images/hey.png" , 
            fit:BoxFit.cover,
            // height: 600,
            ),
          SizedBox(
            height: 20.0,
            child: Text("Hello All !!!"),
          ),
          Text("Welcome $name" , 
              style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:16.0,horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                  hintText: "Enter UserName",
                  labelText: "UserName",
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Username can not be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    name = value;
                    //now to change the state we need to call the build function the setState function do this
                    setState(() {});
                  },
              ), 
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
              ),
              validator: (value) {
                    if(value!.isEmpty){
                      return "Password can not be empty";
                    }
                    else if(value.length < 6){
                      return "Length should be > 6";
                    }
                    return null;
                  },
            ),
            SizedBox(
              height: 50.0,
     
            ),
            // ElevatedButton(
            //   onPressed: (){
            //     print("HI Shubham");
            //     //one page to another page
            //     Navigator.pushNamed(context, MyRoutes.homeRoute);
            //   }, 
            //   child: Text("Login"),
            //   style: TextButton.styleFrom(minimumSize: Size(150,40)),
            // )
     
            //Perform the click opration we need to wrap container with InkWell
            //make Container as child
            Material
            (
              color: Colors.deepPurpleAccent,  
              borderRadius: BorderRadius.circular(changeButton? 50: 8),
              child: InkWell( 
                onTap: () =>moveToHome(context),
                child: AnimatedContainer(
                duration: Duration(seconds: 1),
                //conditional change 3 param
                width: changeButton? 50 : 150,
                height: 60,
               
                alignment: Alignment.center,
                //if button is clicked then make it as done
                  child: changeButton?Icon(Icons.done,color: Colors.white,): Text("Login",
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight:FontWeight.bold,
                      fontSize: 18
                      ),
                    ),
              ),
              ),
            ),
              ],
            ),
          )
        ],
       ),
     ),
     )
    );
  }
}