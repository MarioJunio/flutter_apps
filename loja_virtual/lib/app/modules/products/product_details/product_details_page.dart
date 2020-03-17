import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_virtual/app/modules/products/product_details/product_details_controller.dart';
import 'package:loja_virtual/app/shared/models/product.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final ProductDetailsController controller = ProductDetailsController();

  @override
  void initState() {
    super.initState();
    controller.setCurrentProduct(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.product.description,
          maxLines: 1,
          softWrap: true,
        ),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: AspectRatio(
              aspectRatio: 1,
              child: Carousel(
                images: controller.product.images
                    .map((img) => Image.network(
                          img,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                autoplay: false,
                dotSpacing: 15,
                dotSize: 4,
                dotBgColor: Colors.transparent,
                dotColor: Colors.teal,
                dotIncreasedColor: Colors.teal,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            controller.product.description,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          SizedBox(height: 10),
          Text(
            "R\$ ${controller.product.price.toStringAsFixed(2)}",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          Divider(),
          Text(
            "Tamanho",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 30,
            child: GridView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 15,
                childAspectRatio: 0.5,
              ),
              children: _buildGridSizes(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildGridSizes() => controller.product.sizes
      .map((size) => _buildBoxSize(size.toString()))
      .toList();

  Widget _buildBoxSize(String size) {
    return Observer(
      builder: (_) {
        Color colorSelected =
            controller.size == size ? Colors.teal : Colors.black54;

        return GestureDetector(
          onTap: () {
            controller.selectSize(size);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
              border: Border.all(width: 3, color: colorSelected),
            ),
            child: Text(
              size,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colorSelected),
            ),
          ),
        );
      },
    );
  }
}
