import 'package:flutter/material.dart';
import 'package:state_management_practice/bloc_projects/features/cart/bloc/cart_bloc.dart';
import 'package:state_management_practice/bloc_projects/features/home/bloc/home_bloc.dart';
import 'package:state_management_practice/bloc_projects/features/wishlist/bloc/wishlist_bloc.dart';

import '../../home/models/home_product_data_model.dart';  
import 'package:shimmer/shimmer.dart';


class WishListTileWidget extends StatelessWidget {
  const WishListTileWidget({super.key, required this.productDataModel, required this.wishlistBloc});

  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF49DD81), Color(0xFFFFFFFF)], 
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
            },
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: Image.network(
                        productDataModel.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              color: Colors.white,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Icon(Icons.broken_image, size: 40));
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    productDataModel.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212121),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    productDataModel.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF616161),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "₹${productDataModel.price}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF388E3C),
                            ),
                          ),

                          IconButton(onPressed: (){ 
                            wishlistBloc.add(WishListRemoveFromWishListEvent(clickedProduct: productDataModel)); 

                          }, icon: const Icon(Icons.favorite)),
                          IconButton(onPressed: (){ 
                          }, icon: const Icon(Icons.shopping_bag_outlined)),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1976D2),  
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          elevation: 2,
                        ),
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
