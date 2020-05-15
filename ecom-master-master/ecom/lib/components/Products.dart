import 'package:flutter/material.dart';
import 'package:ecom/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name":"Blazer",
      "picture":"images/products/blazer1.jpeg",
      "old_price":"1500",
      "price":"1100",
    },

    {
      "name":"Dress",
      "picture":"images/products/dress1.jpeg",
      "old_price":"1800",
      "price":"1200",
    },

    

    {
      "name":"Heels",
      "picture":"images/products/hills1.jpeg",
      "old_price":"1800",
      "price":"1200",
    },

    

    {
      "name":"Pants",
      "picture":"images/products/pants2.jpeg",
      "old_price":"1800",
      "price":"1200",
    },

     {
      "name":"Blazers",
      "picture":"images/products/blazer2.jpeg",
      "old_price":"1800",
      "price":"1200",
    },

    {
      "name":"Dresss",
      "picture":"images/products/dress2.jpeg",
      "old_price":"1800",
      "price":"1200",
    },
    

  


    
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index){
        return Single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_oldprice: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],

        );
      },
      
    );
  }
}


class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_oldprice;
  final prod_price;

  Single_prod({
      this.prod_name,
      this.prod_picture,
      this.prod_oldprice,
      this.prod_price,
  }
  );
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(tag: prod_name, 
      child: Material(
        child:InkWell(
          onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetails(
            product_detail_name: prod_name,
            product_detail_newprice: prod_price,
            product_detail_oldprice: prod_oldprice,
            product_detail_picture: prod_picture,
          ))),


          child: GridTile(
            footer: Container(
              height: 50.0,
              color: Colors.white70,
              child: ListTile(
                leading: Text(prod_name, style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                title: Padding(
                  padding: EdgeInsets.only(bottom: 7.0),
                  child: Text("\$$prod_price",style: TextStyle(fontWeight:FontWeight.w800,color: Colors.red,),),
                ),

                

                
              ),
            ),
            child: Image.asset(prod_picture,
            fit: BoxFit.cover,),
            
           
        ),

        

        
      )
      
      ),
       ),
       
    );
    
  }
}