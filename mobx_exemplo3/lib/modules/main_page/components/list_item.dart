import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_exemplo3/model/launcher.dart';
import 'package:mobx_exemplo3/modules/main_page/main_page_controller.dart';
import 'package:mobx_exemplo3/utils/Dates.dart';

class ListItem extends StatelessWidget {
  MainPageController controller = GetIt.I.get<MainPageController>();
  Launcher launcher;

  ListItem(this.launcher);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(launcher.description),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(launcher.observation),
                  Text("R\$ ${launcher.price.toStringAsFixed(2)}"),
                  Text("${Dates.formatDate(launcher.date)}")
                ],
              ),
              leading: Checkbox(value: _isCompleted, onChanged: _checkItem),
              trailing: IconButton(
                  icon: Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                  onPressed: _removeItem),
            ),
            Divider(),
          ],
        );
      },
    );
  }

  void _checkItem(bool value) {
    launcher
        .setStatus(value ? LauncherStatus.COMPLETED : LauncherStatus.PENDING);
  }

  void _removeItem() {
    controller.remove(launcher.id);
  }

  bool get _isCompleted => launcher.status == LauncherStatus.COMPLETED;
}
