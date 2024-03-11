import 'package:flutter/material.dart';

void main() {
  runApp(Myclass());
}
class Myclass extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
        home:Scaffold(
          

    backgroundColor: Colors.red,
    body: SafeArea(
    child:Center(

    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      

      children:

      [
        Container(


        child: CircleAvatar(
          radius: 65,
          backgroundImage: AssetImage('images/patrick.jpg'),
        ),




      ),
        Container(
          child: Text('Patrick Bateman',style:TextStyle(
              color: Colors.black,
              fontSize: 40,
          fontFamily: 'Teko',
          fontWeight: FontWeight.bold),
          ),

        ),
        SizedBox(
          height: 5
        ),
        Container(
          child: Text('Vice President',style:TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: 'Teko',
              fontWeight: FontWeight.bold),
          ),

        ),
        SizedBox(
          width: 200,
            height: 10,

            child:Divider(
color: Colors.black,
            )
        ),
        Card(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),

          child: ListTile(



              leading: Icon(Icons.contact_phone_rounded),

              title: Text('212 555 6342',style: TextStyle(fontFamily: 'Teko',fontSize: 25,fontWeight: FontWeight.bold),),


          ),

        ),
        Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),

            child:ListTile(
              leading: Icon(Icons.location_city),
              title: Text('358 Exchange Place, New York',style: TextStyle(fontFamily: 'Teko',fontSize: 25,fontWeight: FontWeight.bold),),
            )
          ),
        Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),

            child:ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Pierce & Pierce',style: TextStyle(fontFamily: 'Teko',fontSize: 25,fontWeight: FontWeight.bold),),
            )
        ),



      ],

    ),
    ),
    ),
        ),
    );


  }
}


