import 'package:flutter/material.dart';
import 'package:paginated_data_table_example/usuario.dart';

class MyDataTableSource extends DataTableSource {
  List<Usuario> usuarios;

  MyDataTableSource({this.usuarios});

  @override
  DataRow getRow(int index) {
    Usuario usuario = this.usuarios[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(usuario.nome)),
        DataCell(Text(usuario.email)),
        DataCell(Text(usuario.cpf)),
        DataCell(Text(usuario.ativo ? "Sim" : "Não"))
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => this.usuarios.length;

  @override
  int get selectedRowCount => 0;
}
