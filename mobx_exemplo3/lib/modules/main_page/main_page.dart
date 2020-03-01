import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_exemplo3/modules/main_page/components/form_item.dart';
import 'package:mobx_exemplo3/modules/main_page/components/list_item.dart';
import 'package:mobx_exemplo3/modules/main_page/main_page_controller.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainPageController controller = GetIt.I.get<MainPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: _bottomActionButton(),
      body: Container(
        child: Observer(
          builder: (_) {
            return ListView.builder(
              itemBuilder: _listItemBuilder,
              itemCount: controller.filterLaunchers.length,
            );
          },
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: TextField(
        onChanged: controller.setFilter,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.white),
            hintText: "Pesquisar..."),
      ),
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return ListItem(controller.filterLaunchers[index]);
  }

  Widget _bottomActionButton() {
    return FloatingActionButton(
      onPressed: _addItem,
      child: Icon(Icons.add),
      backgroundColor: Colors.blueAccent,
    );
  }

  void _addItem() async {
    showDialog(context: context, builder: (_) => DialogFormItem());
  }
}
