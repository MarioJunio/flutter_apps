// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainPageController on _MainPageControllerBase, Store {
  Computed<List<Launcher>> _$filterLaunchersComputed;

  @override
  List<Launcher> get filterLaunchers => (_$filterLaunchersComputed ??=
          Computed<List<Launcher>>(() => super.filterLaunchers))
      .value;
  Computed<Launcher> _$formLauncherComputed;

  @override
  Launcher get formLauncher =>
      (_$formLauncherComputed ??= Computed<Launcher>(() => super.formLauncher))
          .value;

  final _$launchersAtom = Atom(name: '_MainPageControllerBase.launchers');

  @override
  ObservableList<Launcher> get launchers {
    _$launchersAtom.context.enforceReadPolicy(_$launchersAtom);
    _$launchersAtom.reportObserved();
    return super.launchers;
  }

  @override
  set launchers(ObservableList<Launcher> value) {
    _$launchersAtom.context.conditionallyRunInAction(() {
      super.launchers = value;
      _$launchersAtom.reportChanged();
    }, _$launchersAtom, name: '${_$launchersAtom.name}_set');
  }

  final _$_filterAtom = Atom(name: '_MainPageControllerBase._filter');

  @override
  String get _filter {
    _$_filterAtom.context.enforceReadPolicy(_$_filterAtom);
    _$_filterAtom.reportObserved();
    return super._filter;
  }

  @override
  set _filter(String value) {
    _$_filterAtom.context.conditionallyRunInAction(() {
      super._filter = value;
      _$_filterAtom.reportChanged();
    }, _$_filterAtom, name: '${_$_filterAtom.name}_set');
  }

  final _$_formLauncherAtom =
      Atom(name: '_MainPageControllerBase._formLauncher');

  @override
  Launcher get _formLauncher {
    _$_formLauncherAtom.context.enforceReadPolicy(_$_formLauncherAtom);
    _$_formLauncherAtom.reportObserved();
    return super._formLauncher;
  }

  @override
  set _formLauncher(Launcher value) {
    _$_formLauncherAtom.context.conditionallyRunInAction(() {
      super._formLauncher = value;
      _$_formLauncherAtom.reportChanged();
    }, _$_formLauncherAtom, name: '${_$_formLauncherAtom.name}_set');
  }

  final _$_MainPageControllerBaseActionController =
      ActionController(name: '_MainPageControllerBase');

  @override
  void addLauncher(Launcher launcher) {
    final _$actionInfo =
        _$_MainPageControllerBaseActionController.startAction();
    try {
      return super.addLauncher(launcher);
    } finally {
      _$_MainPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(int id) {
    final _$actionInfo =
        _$_MainPageControllerBaseActionController.startAction();
    try {
      return super.remove(id);
    } finally {
      _$_MainPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilter(String filter) {
    final _$actionInfo =
        _$_MainPageControllerBaseActionController.startAction();
    try {
      return super.setFilter(filter);
    } finally {
      _$_MainPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFormLauncher(Launcher launcher) {
    final _$actionInfo =
        _$_MainPageControllerBaseActionController.startAction();
    try {
      return super.setFormLauncher(launcher);
    } finally {
      _$_MainPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'launchers: ${launchers.toString()},filterLaunchers: ${filterLaunchers.toString()},formLauncher: ${formLauncher.toString()}';
    return '{$string}';
  }
}
