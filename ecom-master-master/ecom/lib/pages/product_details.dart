import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_newprice;
  final product_detail_oldprice;
  final product_detail_picture;

    ProductDetails({
      this.product_detail_name,
      this.product_detail_newprice,
      this.product_detail_oldprice,
      this.product_detail_picture,
    });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title:Text('Samraz'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: () {})
        ],
      ),


      body: ListView(
        children:<Widget>[
          Container(
            height:300.0,
             child: GridTile(
               child:Container(
                 color:Colors.white,
                 child: Image.asset(widget.product_detail_picture),
               ),

               footer: Container(
                 color: Colors.white,
                 child:ListTile(
                   leading: Text(widget.product_detail_name,
                   style: TextStyle(fontWeight:FontWeight.bold, fontSize: 17.0),
                   ),
                   title: Row(
                     children: <Widget>[
                       Expanded(child: Text("\$${widget.product_detail_oldprice}",
                       style: TextStyle( decoration:TextDecoration.lineThrough),),),
                        Expanded(child: Text("\$${widget.product_detail_newprice}"),),
                     ]
                   ),
                 ),
               ),

               
             ),
          ),


          Row(
            children:<Widget>[
              Expanded(
                child:MaterialButton(onPressed: (){
                  showDialog(context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text('Size'),
                      content: Text('Choose the size'),
                      actions: <Widget>[
                        MaterialButton(onPressed: (){
                          Navigator.of(context).pop(context);
                        },
                        child: Text('Close', style: TextStyle(color:Colors.teal),),
                        )
                      ],
                    );
                  }
                  );
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 2.0,
                child:Row(
                  children:<Widget>[
                    Expanded(child: Text('Size'),),
                    Expanded(child: Icon(Icons.arrow_drop_down)),
                  ]
                )
                )
              ),

              Expanded(
                child:MaterialButton(onPressed: (){
                  showDialog(context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text('Color'),
                      content: Text('Choose the color'),
                      actions: <Widget>[
                     MaterialButton(onPressed: (){
                        Navigator.of(context).pop(context);
                     },
                     child: Text('Close',style: TextStyle(color:Colors.teal),
                     
                     ),
                        


                     )],
                    );
                  }
                  );
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 2.0,
                child:Row(
                  children:<Widget>[
                    Expanded(child: Text('Color'),),
                    Expanded(child: Icon(Icons.arrow_drop_down)),
                  ]
                )
                )
              ),

              Expanded(
                child:MaterialButton(onPressed: (){
                  showDialog(context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text('Quantity'),
                      content: Text('No. of quantity'),
                      actions: <Widget>[
                        MaterialButton(onPressed: (){
                          Navigator.of(context).pop(context);
                        },
                        child: Text('Close',style: TextStyle(color:Colors.teal),
                        ),)
                        
                      ],
                    );
                      


                  },
                  );
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 2.0,
                child:Row(
                  children:<Widget>[
                    Expanded(child: Text('Qty'),),
                    Expanded(child: Icon(Icons.arrow_drop_down)),
                  ]
                )
                )
              ),

            ],
          ),
          Row(children: <Widget>[
             Expanded(
                child:MaterialButton(onPressed: (){},
                color: Colors.red,
                textColor: Colors.white,
                elevation: 2.0,
               child: Text('Buy Now'),
                )
              ),
              IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.red,), onPressed:(){}, ),
              IconButton(icon: Icon(Icons.favorite_border, color: Colors.red,), onPressed:(){}, )
              
              
             
              
          ],),
         Divider(),
         ListTile(
           title: Text('Product Details'),
           subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
         ),


         Divider(),
         Row(children: <Widget>[
           Padding(padding:EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
           child: Text('Product Name', style:TextStyle(color: Colors.black)),
           ),
           Padding(padding: EdgeInsets.all(5.0),
           child:Text(widget.product_detail_name),
           )
           
         ],),

          Row(children: <Widget>[
           Padding(padding:EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
           child: Text('Product Brand', style:TextStyle(color: Colors.black)),
           ),
            Padding(padding: EdgeInsets.all(5.0),
           child:Text(widget.product_detail_name),
           )
           
         ],),

          Row(children: <Widget>[
           Padding(padding:EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
           child: Text('Product Condition', style:TextStyle(color: Colors.black)),
           ),
            Padding(padding: EdgeInsets.all(5.0),
           child:Text(widget.product_detail_name),
           )
           
         ],),
        ]
        
      ),
    );
  }
}