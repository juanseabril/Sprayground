import 'package:flutter/material.dart';

class ProductModel {
  final String name;
  final double price;
  final String desc;
  final Color color;
  final String category;
  final String imgPath;
  final int stock;

  ProductModel(
      {required this.name,
      required this.price,
      required this.desc,
      required this.color,
      required this.category,
      required this.imgPath,
      required this.stock});

  static List<ProductModel> listBags = [
    ProductModel(
      name: 'Shark Bite Attack',
      price: 80.00,
      desc:
          "Dimensions: 18' x 6' x 11.5' • Front zipper pocket • Side pockets • Zippered Stash pocket • Separate velour sunglass compartment • Ergonomic mesh back padding • Adjustable Straps for custom sizing • Red zippers with metal hardware",
      color: const Color.fromARGB(255, 203, 47, 42),
      category: 'Bag',
      imgPath: "assets/images/bags/bite/bite_brown_front.png",
      stock: 2,
    ),
    ProductModel(
      name: 'Moneygram Powder',
      price: 80.00,
      desc:
          "Dimensions: 18' x 6' x 11.5' • Front zipper pocket • Side pockets • Zippered Stash pocket • Separate velour sunglass compartment • Ergonomic mesh back padding • Adjustable Straps for custom sizing • Red zippers with metal hardware",
      color: const Color.fromARGB(255, 136, 131, 119),
      category: 'Bag',
      imgPath: "assets/images/bags/moneygram/moneygram_white_front.png",
      stock: 7,
    ),
    ProductModel(
      name: 'Miami Beach Polo',
      price: 150.00,
      desc:
          "Dimensions: 18' x 6' x 11.5' • Front zipper pocket • Side pockets • Zippered Stash pocket • Separate velour sunglass compartment • Ergonomic mesh back padding • Adjustable Straps for custom sizing • Red zippers with metal hardware",
      color: const Color(0xff1aaadc),
      category: 'Bag',
      imgPath: "assets/images/bags/miami/miami_black_front.png",
      stock: 9,
    ),
  ];

  static List<ProductModel> listBears = [
    ProductModel(
      name: 'Camocheck Moneybear',
      price: 80.00,
      desc:
          "Gold Necklace. Money Stack. Dimensions: 17' x 6' x 11' • Zippered pocket on belly • Zippered pockets on each arm • Large zippered pocket on back panel • Adjustable Straps for custom sizing",
      color: const Color.fromARGB(255, 179, 152, 134),
      category: 'Bear',
      imgPath: "assets/images/bears/cammo/bear_cammo_front.png",
      stock: 4,
    ),
    ProductModel(
      name: 'Veni Vidi Teddybear',
      price: 80.00,
      desc:
          "Gold Necklace. Money Stack. Dimensions: 17' x 6' x 11' • Zippered pocket on belly • Zippered pockets on each arm • Large zippered pocket on back panel • Adjustable Straps for custom sizing",
      color: const Color(0xffee6647),
      category: 'Bear',
      imgPath: "assets/images/bears/red/bear_red_front.png",
      stock: 2,
    ),
    ProductModel(
      name: 'Panda Moneybear',
      price: 80.00,
      desc:
          "Gold Necklace. Money Stack. Dimensions: 17' x 6' x 11' • Zippered pocket on belly • Zippered pockets on each arm • Large zippered pocket on back panel • Adjustable Straps for custom sizing",
      color: const Color.fromARGB(255, 38, 146, 143),
      category: 'Bear',
      imgPath: "assets/images/bears/panda/bear_panda_front.png",
      stock: 11,
    ),
  ];

  static List<ProductModel> listDufles = [
    ProductModel(
      name: 'Moneygram Brick',
      price: 100.00,
      desc:
          "Dimensions: 20' x 10' x 10.75' • Metal zipper pocket• Back Zippers •Zippered sneaker pocket • gold zippers • Adjustable Straps for custom sizing •Metal Zippers with Metal Hardware • bag of Sprayground money",
      color: const Color(0xff581711),
      category: 'Dufle',
      imgPath: "assets/images/dufles/moneygram/dmoneygram_red_front.png",
      stock: 4,
    ),
    ProductModel(
      name: 'XTC Sharks',
      price: 120.00,
      desc:
          "Dimensions: 20' x 10' x 10.75' • Metal zipper pocket• Back Zippers •Zippered sneaker pocket • gold zippers • Adjustable Straps for custom sizing •Metal Zippers with Metal Hardware • bag of Sprayground money",
      color: const Color.fromARGB(255, 171, 47, 19),
      category: 'Dufle',
      imgPath: "assets/images/dufles/xtc/xtc_brown_front.png",
      stock: 15,
    ),
    ProductModel(
      name: '3AM Emperor',
      price: 120.00,
      desc:
          "Dimensions: 20' x 10' x 10.75' • Metal zipper pocket• Back Zippers •Zippered sneaker pocket • gold zippers • Adjustable Straps for custom sizing •Metal Zippers with Metal Hardware • bag of Sprayground money",
      color: const Color.fromARGB(255, 136, 131, 119),
      category: 'Dufle',
      imgPath: "assets/images/dufles/3am/3am_white_front.png",
      stock: 7,
    ),
  ];

  static List<ProductModel> listTime = [
    ProductModel(
      name: 'Veni Vidi Teddybear',
      price: 80.00,
      desc:
          "Gold Necklace. Money Stack. Dimensions: 17' x 6' x 11' • Zippered pocket on belly • Zippered pockets on each arm • Large zippered pocket on back panel • Adjustable Straps for custom sizing",
      color: const Color(0xffee6647),
      category: 'Bear',
      imgPath: "assets/images/bears/red/bear_red_front.png",
      stock: 2,
    ),
    ProductModel(
      name: '3AM Emperor',
      price: 120.00,
      desc:
          "Dimensions: 20' x 10' x 10.75' • Metal zipper pocket• Back Zippers •Zippered sneaker pocket • gold zippers • Adjustable Straps for custom sizing •Metal Zippers with Metal Hardware • bag of Sprayground money",
      color: const Color.fromARGB(255, 136, 131, 119),
      category: 'Duffle',
      imgPath: "assets/images/dufles/3am/3am_white_front.png",
      stock: 7,
    ),
    ProductModel(
      name: 'Miami Beach Polo',
      price: 150.00,
      desc:
          "Dimensions: 18' x 6' x 11.5' • Front zipper pocket • Side pockets • Zippered Stash pocket • Separate velour sunglass compartment • Ergonomic mesh back padding • Adjustable Straps for custom sizing • Red zippers with metal hardware • Metal 'Sprayground Authentic' badge • Slide through back sleeve connects to carry-on luggage to free your hands",
      color: const Color(0xff1aaadc),
      category: 'Bag',
      imgPath: "assets/images/bags/miami/miami_black_front.png",
      stock: 9,
    ),
    ProductModel(
      name: 'Camocheck Moneybear',
      price: 80.00,
      desc:
          "• Gold Necklace. Money Stack. Dimensions: 17' x 6' x 11' • Zippered pocket on belly • Zippered pockets on each arm • Large zippered pocket on back panel • Adjustable Straps for custom sizing",
      color: const Color.fromARGB(255, 179, 152, 134),
      category: 'Bear',
      imgPath: "assets/images/bears/cammo/bear_cammo_front.png",
      stock: 4,
    ),
    ProductModel(
      name: 'Moneygram Brick',
      price: 100.00,
      desc:
          "• Dimensions: 20' x 10' x 10.75' • Metal zipper pocket• Back Zippers •Zippered sneaker pocket • gold zippers • Adjustable Straps for custom sizing •Metal Zippers with Metal Hardware • bag of Sprayground money",
      color: const Color(0xff581711),
      category: 'Duffle',
      imgPath: "assets/images/dufles/moneygram/dmoneygram_red_front.png",
      stock: 4,
    ),
    ProductModel(
      name: 'Shark Bite Attack',
      price: 80.00,
      desc:
          "• Dimensions: 18' x 6' x 11.5' • Front zipper pocket • Side pockets • Zippered Stash pocket • Separate velour sunglass compartment • Ergonomic mesh back padding • Adjustable Straps for custom sizing • Red zippers with metal hardware • Metal 'Sprayground Authentic' badge • Slide through back sleeve connects to carry-on luggage to free your hands",
      color: const Color.fromARGB(255, 203, 47, 42),
      category: 'Bag',
      imgPath: "assets/images/bags/bite/bite_brown_front.png",
      stock: 2,
    ),
  ];
}
