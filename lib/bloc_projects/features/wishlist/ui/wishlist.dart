import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_practice/bloc_projects/features/wishlist/ui/wishlist_tile_widget.dart';

import '../bloc/wishlist_bloc.dart'; 


class WishList extends StatefulWidget {
  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {


final WishlistBloc wishListBloc = WishlistBloc();


@override
  void initState() {
    wishListBloc.add(WishListInitialEvent());
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your WishList'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white, 
      ),
      
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishListBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is !WishlistActionState,
        listener: (context, state) { 
        if(state is WishlistItemRemovedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item Removed from Cart'),backgroundColor: Colors.red));
        }
        },
        builder: (context, state) { 
          switch (state.runtimeType) {
            case WishlistLoadingState :
            return const CircularProgressIndicator();
            case WishlistSuccessState :
            final successState = state as WishlistSuccessState;
            return  ListView.builder(
              itemCount: successState.WishlistItems.length,
              itemBuilder: (context, index) {
                return WishListTileWidget(wishlistBloc: wishListBloc,productDataModel: successState.WishlistItems[index] ,);
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