import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:store/models/product_byname.dart';
import 'package:store/models/product_model.dart';
import 'package:store/pages/store/widgets/clipper_widget.dart';

import '../../constants.dart';
import '../../services/post_services.dart';

class DetailPage extends StatefulWidget {
  final Product productModel;
  final String productName;

  const DetailPage(
      {super.key, required this.productModel, required this.productName});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool _isSelected2;
  late bool _isSelected3;
  late bool _isSelected4;
  bool _flag = false;

  ProductByName? _product;

  @override
  void initState() {
    super.initState();
    if (widget.productName != "x") {
      _flag = true;
      _getData();
    }

    if (widget.productModel.productCategory == 'Dufle') {
      _isSelected2 = false;
      _isSelected3 = false;
      _isSelected4 = true;
    } else if (widget.productModel.productCategory == 'Bear') {
      _isSelected2 = true;
      _isSelected3 = false;
      _isSelected4 = false;
    } else {
      _isSelected2 = false;
      _isSelected3 = true;
      _isSelected4 = false;
    }
  }

  void _getData() async {
    _product = (await ApiService().getProductByName(widget.productName));

    print("----------------");
    print(_product?.productCategory);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    var color = _flag
        ? int.parse("0xff${_product!.productColor}")
        : int.parse("0xff${widget.productModel.productColor}");
    return Scaffold(
      backgroundColor: Color(color),
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
                          _flag
                              ? _product!.productName
                              : widget.productModel.productName,
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
                              _flag
                                  ? "${_product!.productStock} in stock"
                                  : "${widget.productModel.productStock} in stock",
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
                        height: sizeHeight * 0.01,
                      ),
                      Text(
                        _flag
                            ? _product!.productDescription
                            : widget.productModel.productDescription,
                        style: const TextStyle(
                            fontFamily: 'CocogooseSemilight',
                            fontSize: 12,
                            color: Colors.black38),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.025,
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
                          colorOption(Color(color)),
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
          image: AssetImage(widget.productModel.productImgPath),
        ));
  }

  Widget buildBottom() {
    final sizeWidth = MediaQuery.of(context).size.width;

    var color = _flag
        ? int.parse("0xff${_product!.productColor}")
        : int.parse("0xff${widget.productModel.productColor}");
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
                _flag
                    ? "\u0024${_product!.productPrice}"
                    : "\u0024${widget.productModel.productPrice}",
                style: const TextStyle(
                    color: bgCardAuth,
                    fontFamily: 'CocogooseItalic',
                    fontSize: 22),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(color),
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
