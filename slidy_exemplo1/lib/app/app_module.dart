import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_exemplo1/app/app_widget.dart';
import 'package:slidy_exemplo1/app/pages/dashboard/dashboard_controller.dart';
import 'package:slidy_exemplo1/app/pages/dashboard/dashboard_page.dart';
import 'package:slidy_exemplo1/app/pages/detail/detail_controller.dart';
import 'package:slidy_exemplo1/app/pages/detail/detail_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds =>
      [Bind((i) => DashboardController()), Bind((i) => DetailController())];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
        Router("/",
            child: (_, args) => DashboardPage(),
            transition: TransitionType.fadeIn),
        Router(
          "/detail/:id",
          transition: TransitionType.fadeIn,
          child: (_, args) => DetailPage(
            id: int.parse(args.params['id']),
          ),
        ),
      ];
}
