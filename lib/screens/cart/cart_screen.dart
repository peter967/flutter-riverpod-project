import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final total = ref.watch(cartTotalProvider);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 5,
        title: const Text('Your Cart'),
        actions: [
          // output totals here
          Text(
            'total: £ $total',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(3),
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          final product = cartProducts.elementAt(index);
          return Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                Image.asset(
                  product.image,
                  width: 60,
                  height: 60,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text('${product.title}...'),
                const Expanded(child: SizedBox()),
                Text('£ ${product.price}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
