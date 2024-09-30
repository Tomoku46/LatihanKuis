import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihanquiz/homescreen.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _loginpagestate createState() => _loginpagestate();
}
class _loginpagestate extends State<Loginpage> {
  String username = "";
  String Password = "";
  bool isLoginSuccess = false;
  bool visible = true;
  
  _navigatepage()async {
  Future.delayed(Duration(seconds: 3));
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Homescreen(
        username: username,
      );
    }));
  }
  @override
  Widget build(BuildContext context){
     return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 520,
                width: 300,
                child: Card( 
                  
                  color: Colors.white70,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Image.asset('assets/LOGIN.png', width: 180, ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("WELCOME", style: GoogleFonts.robotoMono(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),
                      ),
                      _usernameField(),
                      _PasswordField(),
                      _loginbutton(context),
                    ],
                  ),
              ),
              ),
            ),
          ],
        ),
      ) 
    );
  }


  Widget _usernameField(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value){
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'username',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
             borderSide: BorderSide(color: (isLoginSuccess) ?
            Colors.blue : Colors.red),
          )
        ),
      ),
    );
  }
   Widget _PasswordField(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value){
          Password = value;
        },
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius:BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: (isLoginSuccess) ?
            Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }
  Widget _loginbutton(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor:const Color.fromARGB(255, 29, 75, 155)
        ),
        onPressed: (){
          String text = ""; 
          if (username == 'Dafabagus' && Password == "12345678"){
            _navigatepage();
            setState(() {
              text = "login succes";
              isLoginSuccess = true;
            });
          } else {
              isLoginSuccess = false;
            text = "Failed";
          }
          SnackBar snackBar = SnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: isLoginSuccess?Colors.green:Colors.red,
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child:  Text('Login'),
        
        
         
    ),
    );
  }
}