import 'package:apple/controllers/product_controler.dart';
import 'package:apple/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../data/demo_data.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          'The latest.',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        ),
        const Text(
          'Take a look at what’s new, right now.',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        FutureBuilder(
            future: ProductController().fetchAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircleAvatar();
              }
              if (snapshot.hasError) {
                return Text('Something went wrong!');
              }

              List<Product> products = snapshot.data!;
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.92,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 200,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.network(
                            products[index].image,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                products[index].name,
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                '\$ ${products[index].price}',
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }),
      ],
    );
  }
}
