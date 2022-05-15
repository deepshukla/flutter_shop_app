

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/cart.dart';
import 'package:flutter_shop_app/providers/product.dart';
import 'package:flutter_shop_app/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItems extends StatelessWidget {
 /* final String id;
  final String title;
  final String imgUrl;

  const ProductItems(this.id, this.title, this.imgUrl);*/

  @override
  Widget build(BuildContext context) {
    final product=Provider.of<Product>(context,listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: (){
         Navigator.pushNamed(context,ProductDetailScreen.routeName,arguments: product.id);
        },
        child: GridTile(
          child: Image.network(product.imageUrl),
          footer: GridTileBar(
            backgroundColor: Colors.black12,
            title: Text(product.title,textAlign: TextAlign.center,),
            leading: Consumer<Product>(
              builder: (ctx, product, _) => IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
              },
              icon: Icon(
                Icons.shopping_cart,
              ),
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
