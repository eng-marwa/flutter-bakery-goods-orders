import 'package:hnflutter_challenge/data/model/order_model.dart';
import 'package:hnflutter_challenge/data/model/product_model.dart';
import 'package:hnflutter_challenge/domain/entity/Bakery.dart';
import 'package:hnflutter_challenge/domain/entity/item.dart';
import 'package:hnflutter_challenge/domain/entity/order.dart';
import 'package:hnflutter_challenge/utils/mapper/mapper.dart';

import '../data/model/bakery_model.dart';
import '../domain/entity/product.dart';

var listOfBakeries = [
  BakeryResponse(
      id: 1,
      name: 'Bakery1',
      lat: 31.26,
      lon: 30.16,
      rate: 4.7,
      type: 'cake',
      products: [
        ProductResponse(
            id: 1, name: 'Product1', ingredients: [], type: 'cake1', image: ''),
        ProductResponse(
            id: 2, name: 'Product2', ingredients: [], type: 'cake2', image: ''),
      ],
      logo:
          'https://static.vecteezy.com/system/resources/previews/005/992/398/original/bakery-shop-building-that-sells-various-types-of-bread-such-as-white-bread-pastry-and-others-all-baked-in-flat-background-for-poster-illustration-vector.jpg'),
  BakeryResponse(
      id: 2,
      name: 'Bakery2',
      lat: 31.26,
      lon: 30.16,
      rate: 5.3,
      type: 'pie',
      products: [
        ProductResponse(
            id: 5, name: 'Product5', ingredients: [], type: 'pie', image: ''),
        ProductResponse(
            id: 6, name: 'Product6', ingredients: [], type: 'pie', image: ''),
      ],
      logo:
          'https://img.freepik.com/free-vector/outside-bakery-shop-background_1308-122413.jpg'),
  BakeryResponse(
      id: 3,
      name: 'Bakery3',
      lat: 31.26,
      lon: 30.16,
      rate: 7.2,
      type: 'pie',
      products: [
        ProductResponse(
            id: 5, name: 'Product5', ingredients: [], type: 'pie', image: ''),
        ProductResponse(
            id: 6, name: 'Product6', ingredients: [], type: 'pie', image: ''),
      ],
      logo:
          'https://www.shutterstock.com/image-illustration/bakery-shop-showcases-bread-buns-260nw-1818578891.jpg'),
  BakeryResponse(
      id: 4,
      name: 'Bakery4',
      lat: 31.26,
      lon: 30.16,
      rate: 5.4,
      type: 'bread',
      products: [
        ProductResponse(
            id: 3, name: 'Product3', ingredients: [], type: 'bread', image: ''),
        ProductResponse(
            id: 4, name: 'Product4', ingredients: [], type: 'bread', image: ''),
      ],
      logo:
          'https://t3.ftcdn.net/jpg/01/02/34/64/360_F_102346424_oMkEu5HzkRzDvlxT1HIK6K7aeU3BYlBD.jpg'),
  BakeryResponse(
      id: 5,
      name: 'Bakery5',
      lat: 31.26,
      lon: 30.16,
      rate: 4.9,
      type: 'bread',
      products: [
        ProductResponse(
            id: 3, name: 'Product3', ingredients: [], type: 'bread', image: ''),
        ProductResponse(
            id: 4, name: 'Product4', ingredients: [], type: 'bread', image: ''),
      ],
      logo:
          'https://c8.alamy.com/comp/2D9D9FY/showcase-bakery-shop-food-store-facade-city-cartoon-illustration-2D9D9FY.jpg'),
];
var listOfProducts = [
  ProductResponse(
      id: 1, name: 'Product1', ingredients: [], type: 'cake1', image: ''),
  ProductResponse(
      id: 2, name: 'Product2', ingredients: [], type: 'cake2', image: ''),
  ProductResponse(
      id: 3, name: 'Product3', ingredients: [], type: 'bread1', image: ''),
  ProductResponse(
      id: 4, name: 'Product4', ingredients: [], type: 'bread2', image: ''),
  ProductResponse(
      id: 5, name: 'Product5', ingredients: [], type: 'pie1', image: ''),
  ProductResponse(
      id: 6, name: 'Product6', ingredients: [], type: 'pie2', image: ''),
];

BakeryResponse? viewProfile(int id) {
  for (var element in listOfBakeries) {
    if (element.id == id) {
      return element;
    }
  }
  return null;
}

List<Product> getListOfProducts(int bakeryId) {
  var list = <Product>[];
  listOfBakeries.forEach((element) {
    if (element.id == bakeryId) {
      list = element.products.map((e) => e.toDomain()).toList();
    }
  });
  return list;
}

List<OrderResponse> getOrderList() {
  var list = <OrderResponse>[
    OrderResponse(
        orderId: 1,
        orderDate: '15/12/2022',
        items: [],
        rate: 2.1,
        status: 'Done',
        paymentMethod: 'cash',
        price: 500),
    OrderResponse(
        orderId: 2,
        orderDate: '1/1/2023',
        items: [],
        rate: 5.2,
        status: 'Cancelled',
        paymentMethod: 'cash',
        price: 200),
    OrderResponse(
        orderId: 3,
        orderDate: '20/1/2023',
        items: [],
        rate: 0.0,
        status: 'Active',
        paymentMethod: 'cash',
        price: 1000)
  ];
  return list;
}

List<BakeryResponse> useTypeFilter(String type) {
  var list = <BakeryResponse>[];
  listOfBakeries.forEach((element) {
    if (element.type == type) {
      list.add(element);
    }
  });
  return list;
}
