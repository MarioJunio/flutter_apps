import 'package:flutter/material.dart';
import 'package:loja_virtual/app/modules/products/product_details/product_details_page.dart';
import 'package:loja_virtual/app/modules/products/products_controller.dart';
import 'package:loja_virtual/app/modules/products/products_module.dart';
import 'package:loja_virtual/app/modules/products/widgets/grid_list_products.dart';
import 'package:loja_virtual/app/modules/products/widgets/list_products.dart';
import 'package:loja_virtual/app/shared/models/product.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductsController controller = ProductsModule.to.getBloc();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(controller.category.title),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.grid_on,
                  color: Theme.of(context).primaryColorDark,
                  size: 30,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.list,
                  color: Theme.of(context).primaryColorDark,
                  size: 30,
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildGrid(),
            _buildList(),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return GridListProducts(
      snapshot: controller.products,
      onTapItem: _navigateToProductDetails,
    );
  }

  Widget _buildList() {
    return ListProducts(
      snapshot: controller.products,
      onTapItem: _navigateToProductDetails,
    );
  }

  void _navigateToProductDetails(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProductDetailsPage(product: product)),
    );
  }
}
