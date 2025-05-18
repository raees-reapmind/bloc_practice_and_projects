import 'package:flutter/material.dart';
import 'package:state_management_practice/bloc_projects/features/cart/ui/cart.dart';
import 'package:state_management_practice/bloc_projects/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_practice/bloc_projects/features/home/ui/product_tile_widget.dart';
import 'package:state_management_practice/bloc_projects/features/wishlist/ui/wishlist.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


final HomeBloc homeBloc = HomeBloc();


@override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();

  }

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
        } else if(state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item Added to WishList'),backgroundColor: Colors.pink,));
        } else if(state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item Added to Cart'),backgroundColor: Colors.green));
        }
      },
      builder: (context, state) {
        switch(state.runtimeType) {
          case HomeLoadingState :
          return const Scaffold(
            body:  Center(child:  CircularProgressIndicator()),
          );
          case HomeLoadedSuccessState :
          final successState = state as HomeLoadedSuccessState;
          return  Scaffold( 
            appBar: AppBar(
              title: const Text('Bloc Grocery App'),
              backgroundColor: Colors.teal,
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
            body: ListView.builder(
              itemCount: successState.products.length,
              itemBuilder: (context, index) {
                return ProductTileWidget(productDataModel: successState.products[index], homeBloc: homeBloc,);
              },
            ),
          );
         case HomeErrorState :  
         return const Scaffold(
            body:  Center(child: Text('Error')),
          );
          default :
          return const SizedBox();
        } 
      },
    );
  }
}

