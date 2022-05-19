import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:store/models/product_model.dart';
import 'package:store/pages/store/widgets/clipper_widget.dart';

import '../../constants.dart';

class DetailPage extends StatefulWidget {
  final ProductModel productModel;

  const DetailPage({super.key, required this.productModel});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool _isSelected2;
  late bool _isSelected3;
  late bool _isSelected4;

  @override
  void initState() {
    super.initState();
    if (widget.productModel.category == 'Dufle') {
      _isSelected2 = false;
      _isSelected3 = false;
      _isSelected4 = true;
    } else if (widget.productModel.category == 'Bear') {
      _isSelected2 = true;
      _isSelected3 = false;
      _isSelected4 = false;
    } else {
      _isSelected2 = false;
      _isSelected3 = true;
      _isSelected4 = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: widget.productModel.color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: bgSignup,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/images/logos/sprayground_logo_white.png',
          scale: 2,
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.shopping_bag_outlined, color: bgSignup),
              )),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: sizeHeight * 0.75,
              width: sizeWidth,
              child: ClipPath(
                clipper: ClipperWidget(
                    cornerSize: 50, diagonalHeight: 180, roundedBottom: false),
                child: Container(
                  color: bgSignup,
                  padding: EdgeInsets.only(
                      top: sizeHeight * 0.22,
                      left: 20,
                      right: 20,
                      bottom: sizeHeight * 0.15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: sizeWidth * 0.6,
                        child: Text(
                          widget.productModel.name,
                          style: const TextStyle(
                              fontFamily: 'CocogooseSemilight', fontSize: 30),
                        ),
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: const EdgeInsets.only(right: 3.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: iStar,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          SizedBox(width: sizeWidth * 0.05),
                          const Icon(
                            Icons.circle,
                            color: iStock,
                            size: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                              "${widget.productModel.stock} in stock",
                              style: const TextStyle(
                                color: bgCardAuth,
                                fontFamily: 'CocogooseItalicLight',
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: sizeHeight * 0.038,
                      ),
                      const Text(
                        "DETALLES",
                        style: TextStyle(
                            fontFamily: 'CocogooseSemilight', fontSize: 14),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.02,
                      ),
                      Text(
                        widget.productModel.desc,
                        style: const TextStyle(
                            fontFamily: 'CocogooseSemilight',
                            fontSize: 12,
                            color: Colors.black38),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.038,
                      ),
                      const Text(
                        "COLORES",
                        style: TextStyle(
                            fontFamily: 'CocogooseSemilight', fontSize: 14),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.01,
                      ),
                      Row(
                        children: [
                          colorOption(widget.productModel.color),
                          colorOption(bgCardAuth),
                          colorOption(iStar),
                          colorOption(iStock),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(bottom: 0, child: buildBottom()),
          _isSelected2
              ? setImage(
                  sizeWidth * 0.26, sizeWidth * 0.45, sizeHeight * 0.35, 0)
              : Container(),
          _isSelected3
              ? setImage(sizeWidth * 0.3, sizeWidth * 0.4, sizeHeight * 0.3,
                  sizeHeight * 0.02)
              : Container(),
          _isSelected4
              ? setImage(sizeWidth * 0.14, sizeWidth * 0.7, sizeHeight * 0.32,
                  sizeHeight * 0.02)
              : Container(),
        ],
      ),
    );
  }

  Positioned setImage(double left, double width, double height, double top) {
    return Positioned(
        top: top,
        left: left,
        child: Image(
          width: width,
          height: height,
          image: AssetImage(widget.productModel.imgPath),
        ));
  }

  Widget buildBottom() {
    final sizeWidth = MediaQuery.of(context).size.width;

    return Container(
      width: sizeWidth,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: const BoxDecoration(
          color: bgSignup,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 10)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("PRECIO",
                  style: TextStyle(
                      fontFamily: 'CocogooseSemilight',
                      fontSize: 11,
                      color: Colors.black38)),
              Text(
                "\u0024${widget.productModel.price}",
                style: const TextStyle(
                    color: bgCardAuth,
                    fontFamily: 'CocogooseItalic',
                    fontSize: 22),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: widget.productModel.color,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                "COMPRAR",
                style: TextStyle(
                    color: bgSignup,
                    fontFamily: 'CocogooseLight',
                    fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container colorOption(Color color) {
    return Container(
      width: 15,
      height: 15,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(50))),
    );
  }
}
