import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:ecom/components/horizontal_list_view.dart';
import 'package:ecom/components/Products.dart';
import 'package:ecom/pages/cart.dart';
import 'package:ecom/utils/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  Widget image_carousel =  Container(
     height: 200.0,


     child:Carousel(
      boxFit: BoxFit.cover,
       images:[
         AssetImage('images/c1.jpg'),
         AssetImage('images/m1.jpeg'),
         AssetImage('images/w1.jpeg'),
         AssetImage('images/w4.jpeg'),
       ],
       autoplay:false,
      //  animationCurve:Curves.fastOutSlowIn,
      //  animationDuration:Duration(milliseconds: 1000),
      dotSize: 4.0,
      indicatorBgPadding: 4.0,
     ),
   );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title:Text('Samraz'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Cart();

            }));
          })
        ],
      ),

   drawer: new Drawer(
     child: ListView(
       children: <Widget>[
         UserAccountsDrawerHeader(accountName: Text('Samrat Basnet'), accountEmail:Text('samratbasnet17@gmail.com'),
         currentAccountPicture: GestureDetector(
           child: CircleAvatar(
             backgroundColor: Colors.grey,
             child: Icon(Icons.person, color: Colors.white,),
           ),
         ),
         decoration: BoxDecoration(
           color: Colors.red,
         ),
         ),


         InkWell(
           onTap: (){},
                    child: ListTile(
             title:Text('Home', style: TextStyle(color: Colors.black),),
             leading: Icon(Icons.home, color: Colors.black,),
           ),
         ),

        InkWell(
           onTap: (){},
                    child: ListTile(
             title:Text('My Account', style: TextStyle(color: Colors.black),),
             leading: Icon(Icons.person, color: Colors.black,),
           ),
         ),

         InkWell(
           onTap: (){},
                    child: ListTile(
             title:Text('My Orders', style: TextStyle(color: Colors.black),),
             leading: Icon(Icons.shopping_basket, color: Colors.black,),
           ),
         ),

         InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context){
                   return Cart();
             }));
           },
                    child: ListTile(
             title:Text('Shopping Cart', style: TextStyle(color: Colors.black),),
             leading: Icon(Icons.shopping_cart, color: Colors.black,),
           ),
         ),

         InkWell(
           onTap: (){},
                    child: ListTile(
             title:Text('Favourites', style: TextStyle(color: Colors.black),),
             leading: Icon(Icons.favorite, color: Colors.black,),
           ),
         ),

         Divider(),


         InkWell(
           onTap: (){},
                    child: ListTile(
             title:Text('Settings', style: TextStyle(color: Colors.black),),
             leading: Icon(Icons.settings, color: Colors.black,),
           ),
         ),

         InkWell(
           onTap: (){},
                    child: ListTile(
             title:Text('About', style: TextStyle(color: Colors.black),),
             leading: Icon(Icons.info, color: Colors.blue,),
           ),
         ),


       ],
     )
   ),


   body:Column(
     children:<Widget>[
       image_carousel,

       Padding(padding: EdgeInsets.all(8.0),
       child: Text('Categories'),
       ),

       HorizontalList(),

       RaisedButton(
              child: Text("Log out"),
              onPressed: (){
                AuthProvider().logOut();
              },
            ),

       Padding(padding: EdgeInsets.all(15.0),
       child: Text('Recent Products'),

       ),

       Flexible(
         child: Products(),

       ),
     ]
   ),


    );
  }
}
