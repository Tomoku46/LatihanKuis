import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihanquiz/data_dummy.dart';

class Homescreen  extends StatelessWidget {
  final String username;
  Homescreen ({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 500,
                child: Card(
                  color: Color.fromARGB(255, 29, 75, 155),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Image.asset('assets/LOGIN.png',
                            height: 100,
                            width: 100,),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 35),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text('$username', style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),),
                                Text('Member', style: GoogleFonts.nunitoSans(
                                  color: Colors.white60,
                                  
                                )),
                                
                                 Container(
                                  width: 200,
                                  height: 60,
                                   child: Padding(
                                     padding: const EdgeInsets.all(15.0),
                                     child: FloatingActionButton(
                                       onPressed: (){Navigator.pop(context);
                                       }, 
                                       child: Text('log out', style: GoogleFonts.nunitoSans(
                                        fontWeight: FontWeight.bold
                                        
                                       ),)),
                                   ),
                                 )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                        ],
                  ),
                ),
              ),
            ),

            
            Container(
              height: 500,
                width: 500,
                child: Card(
                  color: Color.fromARGB(255, 190, 192, 197),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      ), 
                      itemCount: vehicleList.length,
                      itemBuilder: (BuildContext context,int index) { 
                        final Vehicle place = vehicleList[index];
                        return Container(
                          child: Card(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(place.imageUrls[1], width: 150, height: 100,),
                                Text(vehicleList[index].name,),
                                Text(vehicleList[index].type),
                                Text(vehicleList[index].price),
                              ],
                            ),
                          ),
                        );
                       },),
                ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}