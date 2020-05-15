import 'package:flutter/material.dart';
import 'package:ecom/components/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title:Text('Shopping Cart'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () {}),
         
        ],
      ),


       body: Cart_products(), 

   

      bottomNavigationBar: Container(
        color:Colors.white,
        child: Row(
          children:<Widget>[
                  Expanded(child: ListTile(
                    title:Text('Total:'),
                    subtitle:Text('\$1000')
                  ),),

                  Expanded(child: MaterialButton(onPressed: (){},
                  child: Text('CheckOut', style: TextStyle(color:Colors.white),),
                  color:Colors.red,
                  ))
                  
          ]
        ),
      ),
      
    );
  }
}