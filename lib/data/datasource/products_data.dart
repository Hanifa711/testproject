import 'package:myshop/data/model/products_model.dart';

List<ProductModel> productsData = [
  ProductModel(
    id: 1,

    name: "Radhuni Shemai - 200 gm",
    price: 60,
    oldPrice: 100,
    categoryId: 5,
    images: [
      "assets/products/snack1.png",
      "assets/products/snack1-1.png", // صورة ثانية للطعمة أو التغليف
    ],
    desc: '',
    weight: '',
    categoryName: '',
    description: '',
  ),
  ProductModel(
    id: 2,
    name: "Cheese Puffs Chips - 32 gm",
    price: 70,
    oldPrice: 100,
    categoryId: 5,
    images: ["assets/products/snack2.png", "assets/products/snack2-1.png"],
    desc: '',
    weight: '',
    categoryName: '',
    description: '',
  ),
  ProductModel(
    id: 3,
    name: "Classic Coffee Jar - 50gm",
    price: 125,
    oldPrice: 200,
    categoryId: 5,
    images: ["assets/products/snack3.png", "assets/products/snack3-1.png"],
    desc: '',
    weight: '',
    categoryName: '',
    description: '',
  ),
  ProductModel(
    id: 4,
    name: "Sugar - 1kg",
    price: 30,
    oldPrice: 45,
    categoryId: 5,
    images: ["assets/products/snack4.png", "assets/products/snack4-1.png"],
    desc: '',
    weight: '',
    description: '',
    categoryName: '',
  ),
  ProductModel(
    id: 5,
    name: "Dano",
    price: 30,
    oldPrice: 45,
    categoryId: 5,
    images: ["assets/products/snack5.png", "assets/products/snack5-1.png"],
    desc: 'Arla DANO Full Cream Milk Powder Instant',
    weight: "10 KG",
    categoryName: 'Dairy Products',
    description:
        'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id,',
  ),
];
