import 'package:flutter/material.dart';
import 'package:state_management_practice/bloc_projects/features/cart/ui/cart.dart';
import 'package:state_management_practice/bloc_projects/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_practice/bloc_projects/features/wishlist/ui/wishlist.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) { 
        if(state is HomeNavigateToCartPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
        } else if(state is HomeNavigateToWishlistPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => WishList()));
        }
      },
      builder: (context, state) {
        return Scaffold( 
          appBar: AppBar(
            title: const Text('Bloc grocery project'),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,  
            actions: [
              IconButton(onPressed: (){
                  homeBloc.add(HomeWishlistButtonNavigateEvent());
              }, icon: const Icon(Icons.favorite_border_outlined)),
              IconButton(onPressed: (){
                  homeBloc.add(HomeCartButtonNavigateEvent());
              }, icon: const Icon(Icons.shopping_bag_outlined))
            ],
          ),
        );
      },
    );
  }
}
