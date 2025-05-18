import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_practice/bloc_projects/features/cart/ui/cart_tile_widget.dart';

import '../bloc/cart_bloc.dart';


class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> { 

final CartBloc cartBloc = CartBloc();

@override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white, 
      ),
      
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,
        listener: (context, state) { 
        if(state is CartRemoveFromCartEvent) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item Removed from Cart'),backgroundColor: Colors.red));
        }
        },
        builder: (context, state) { 
          switch (state.runtimeType) {
            case CartLoadingState :
            return const CircularProgressIndicator();
            case CartSuccessState :
            final successState = state as CartSuccessState;
            return  ListView.builder(
              itemCount: successState.cartItems.length,
              itemBuilder: (context, index) {
                return CartTileWidget(cartBloc: cartBloc, productDataModel: successState.cartItems[index]);
              },
            );  
            default :
            return Container();
          }
        }
      ),
    );
  }
}
