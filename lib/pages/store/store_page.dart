import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/pages/store/detail_page.dart';
import 'dart:math' as math;

import '../../constants.dart';
import 'widgets/clipper_widget.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<ProductModel> bagList = ProductModel.listBags;
  List<ProductModel> bearList = ProductModel.listBears;
  List<ProductModel> duflesList = ProductModel.listDufles;
  List<ProductModel> timeList = ProductModel.listTime;
  bool _isSelected1 = true;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected4 = false;
  final bool _isSelected5 = false;

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    final user = FirebaseAuth.instance.currentUser!; // Text(user.email!),

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onDoubleTap: () => FirebaseAuth.instance.signOut(),
          child: const Icon(
            Icons.cancel_outlined,
            color: bgCardAuth,
          ),
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/images/logos/sprayground_logo_red.png',
          scale: 2,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  color: bgCardAuth,
                  size: 26,
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {},
                child:
                    const Icon(Icons.shopping_bag_outlined, color: bgCardAuth),
              )),
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              const Text(
                "Ediciones Limitadas \u{1F525}",
                style: sTitleStyle,
              ),
              SizedBox(
                height: sizeHeight * 0.03,
              ),

              /// --- Button Rows
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categoryButton("All", _isSelected1),
                    categoryButton("Bears", _isSelected2),
                    categoryButton("Bags", _isSelected3),
                    categoryButton("Dufles", _isSelected4),
                    categoryButton("Otras", _isSelected5),
                  ],
                ),
              ),
              SizedBox(
                height: sizeHeight * 0.025,
              ),
              isCategory(sizeHeight, sizeWidth),
              SizedBox(
                height: sizeHeight * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Ultimas Unidades \u23f0",
                    style: sSTitleStyle,
                  ),
                  Text(
                    "VER TODO",
                    style: sSeeAllStyle,
                  )
                ],
              ),
              SizedBox(
                height: sizeHeight * 0.02,
              ),
              ...timeList.map((data) {
                return Padding(
                  padding: EdgeInsets.only(bottom: sizeHeight * 0.015),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => DetailPage(productModel: data)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: data.color,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizeWidth * 0.05,
                            vertical: sizeHeight * 0.008),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              data.imgPath,
                              height: sizeHeight * 0.11,
                              width: sizeWidth * 0.2,
                            ),
                            SizedBox(
                              width: sizeWidth * 0.35,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.name,
                                    style: const TextStyle(
                                      fontFamily: 'CocogooseSemilight',
                                      fontSize: 16,
                                      color: bgSignup,
                                    ),
                                  ),
                                  SizedBox(
                                    height: sizeHeight * 0.01,
                                  ),
                                  Text(
                                    data.category,
                                    style: const TextStyle(
                                      fontFamily: 'CocogooseSemilightItalic',
                                      fontSize: 12,
                                      color: bgSignup,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text("\u0024${data.price}", style: cPriceStyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ]),
    );
  }

  Column isCategory(double sizeHeight, double sizeWidth) {
    return Column(
      children: [
        _isSelected1
            ? showCategory(sizeHeight, sizeWidth, bagList, sizeWidth * 0.14,
                sizeHeight * 0.13) //lista completa
            : Container(),
        _isSelected2
            ? showCategory(sizeHeight, sizeWidth, bearList, sizeWidth * 0.08,
                sizeHeight * 0.13)
            : Container(),
        _isSelected3
            ? showCategory(sizeHeight, sizeWidth, bagList, sizeWidth * 0.14,
                sizeHeight * 0.13)
            : Container(),
        _isSelected4
            ? showCategory(
                sizeHeight,
                sizeWidth,
                duflesList,
                0,
                sizeHeight * 0.20,
              ) //lista dufles
            : Container(),
      ],
    );
  }

  SizedBox showCategory(double sizeHeight, double sizeWidth,
      List<ProductModel> list, double posLeft, double posBottom) {
    return SizedBox(
      height: sizeHeight * 0.42,
      child: ListView.builder(
        itemCount: list.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => DetailPage(productModel: list[index])));
            },
            child: Stack(
              children: [
                _buildBackground(index, sizeWidth, sizeHeight, list),

                /// --- Image
                Positioned(
                  bottom: posBottom,
                  left: posLeft,
                  child: Transform.rotate(
                    angle: _isSelected4 ? -math.pi / 5 : math.pi / 15,
                    child: Image.asset(
                      list[index].imgPath,
                      height:
                          _isSelected4 ? sizeHeight * 0.2 : sizeHeight * 0.28,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBackground(
      int index, double sizeWidth, double sizeHeight, List<ProductModel> list) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 40),
      child: SizedBox(
        height: sizeHeight,
        child: ClipPath(
          clipper: ClipperWidget(cornerSize: 25, diagonalHeight: 110),
          child: Container(
            color: list[index].color,
            width: sizeWidth * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding: EdgeInsets.only(right: sizeWidth * 0.15),
                      child: Text(
                        list[index].name,
                        style: cNameStyle,
                      ),
                    ),
                    SizedBox(
                      height: sizeHeight * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "\u0024${list[index].price}",
                          style: cPriceStyle,
                        ),
                        const Expanded(child: SizedBox()),
                        const Icon(
                          Icons.circle,
                          color: iStock,
                          size: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text(
                            "${list[index].stock} in stock",
                            style: cStockStyle,
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Padding categoryButton(String text, bool select) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: ElevatedButton(
        style: select
            ? ElevatedButton.styleFrom(
                primary: bgSignup,
                onPrimary: bgLogin,
                side: const BorderSide(color: bgLogin, width: 4),
                shape: radiusBorder,
              )
            : ElevatedButton.styleFrom(
                primary: bgSignup,
                onPrimary: bgCardAuth,
                side: const BorderSide(color: bgCardAuth, width: 2),
                shape: radiusBorder,
              ),
        onPressed: () {
          if (text == "Dufles") {
            setState(() {
              _isSelected1 = false;
              _isSelected2 = false;
              _isSelected3 = false;
              _isSelected4 = true;
            });
          } else if (text == "Bags") {
            setState(() {
              _isSelected1 = false;
              _isSelected2 = false;
              _isSelected3 = true;
              _isSelected4 = false;
            });
          } else if (text == "Bears") {
            setState(() {
              _isSelected1 = false;
              _isSelected2 = true;
              _isSelected3 = false;
              _isSelected4 = false;
            });
          } else {
            setState(() {
              _isSelected1 = true;
              _isSelected2 = false;
              _isSelected3 = false;
              _isSelected4 = false;
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: select
                ? const TextStyle(
                    fontFamily: 'CocogooseSemilight',
                    fontSize: 20,
                  )
                : const TextStyle(
                    fontFamily: 'CocogooseSemilight',
                    fontSize: 15,
                  ),
          ),
        ),
      ),
    );
  }
}
