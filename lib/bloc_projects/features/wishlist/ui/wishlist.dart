import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wishlist_bloc.dart'; 


class WishList extends StatefulWidget {
  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {


final WishlistBloc wishListBloc = WishlistBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishListBloc,
      // listenWhen: (previous, current) => current is HomeActionState,
      // buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) { 
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('WishList'),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,  
            actions: [
              IconButton(onPressed: (){ 
              }, icon: const Icon(Icons.favorite_border_outlined)),
              IconButton(onPressed: (){ 
              }, icon: const Icon(Icons.shopping_bag_outlined))
            ],
          ),
        );
      },
    );
  }
}
