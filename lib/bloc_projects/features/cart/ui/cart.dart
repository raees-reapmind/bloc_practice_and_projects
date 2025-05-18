import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';


class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {


final CartBloc cartBloc = CartBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      // listenWhen: (previous, current) => current is HomeActionState,
      // buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) { 
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
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
