import 'package:apple/models/category_model.dart';
import 'package:apple/models/product_model.dart';

class DemoData {
  static List<String> sliderImages = [
    'https://media.cnn.com/api/v1/images/stellar/prod/ios-17-review-lead-cnnu.jpg?c=16x9',
    'https://www.apple.com/v/ios/ios-17/a/images/meta/ios-17__ni2koxyri7m2_og.png',
    'https://www.livemint.com/lm-img/img/2023/09/18/600x338/ios_17_1685986638198_1695016956548.png',
    'https://sempreupdate.com.br/wp-content/uploads/2023/10/ios-17-1-promete-mudancas-emocionantes-para-o-seu-iphone-860x484.jpg',
  ];

  static List<CategoryModel> categories = [
    CategoryModel(image: 'assets/images/mac.png', name: 'Mac'),
    CategoryModel(image: 'assets/images/ipad.png', name: 'i Pad'),
    CategoryModel(image: 'assets/images/iphone.png', name: 'i Phone'),
    CategoryModel(image: 'assets/images/watch.png', name: 'Watch'),
    CategoryModel(image: 'assets/images/airpods.png', name: 'AirPods'),
  ];

  static List<Product> products = [
    Product(
        image:
            'https://static.doji.co/product/medias/smartphones/apple/iphone-14/1-front-back-starlight.png',
        price: 999,
        title: 'iPhone 15 Pro'),
    Product(
        image:
            'https://static.doji.co/product/medias/smartphones/apple/iphone-14/1-front-back-yellow.png',
        price: 850,
        title: 'iPhone 13'),
    Product(
        image:
            'https://static.doji.co/product/medias/smartphones/apple/iphone-14/1-front-back-purple.png',
        price: 789,
        title: 'iPhone 13'),
    Product(
        image:
            'https://static.doji.co/product/medias/smartphones/apple/iphone-14/1-front-back-blue.png',
        price: 1100,
        title: 'iPhone 14'),
    Product(
        image:
            'https://static.doji.co/product/medias/smartphones/apple/iphone-14/1-front-back-midnight.png',
        price: 1299,
        title: 'iPhone 15')
  ];
}
