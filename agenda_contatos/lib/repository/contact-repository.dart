import 'package:agenda_contatos/data/database.dart';
import 'package:sqflite/sqflite.dart';
import '../model/contact.dart';

class ContactRepository {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  Future<List<Contact>> all() async {
    List<Contact> contacts = List();

    final Database database = await databaseHelper.database;
    List<Map> results = await database.query(Contact.tableName, columns: [
      Contact.idColumn,
      Contact.nameColumn,
      Contact.emailColumn,
      Contact.phoneColumn,
      Contact.pictureColumn
    ]);

    if (results.isNotEmpty)
      results.forEach((e) => contacts.add(Contact.fromMap(e)));

    return contacts;
  }

  Future<Contact> save(Contact contact) async {
    final Database database = await databaseHelper.database;

    contact.id = await database.insert(Contact.tableName, contact.toMap());
    return contact;
  }

  Future<Contact> edit(Contact contact) async {
    final Database database = await databaseHelper.database;

    await database.update(Contact.tableName, contact.toMap(),
        where: "${Contact.idColumn} = ?", whereArgs: [contact.id]);
    return contact;
  }

  Future<Contact> get(int id) async {
    final Database database = await databaseHelper.database;

    final List<Map> results = await database.query(Contact.tableName,
        columns: [
          Contact.idColumn,
          Contact.nameColumn,
          Contact.emailColumn,
          Contact.phoneColumn,
          Contact.pictureColumn
        ],
        where: "${Contact.idColumn} = ?",
        whereArgs: [id]);

    return results.isNotEmpty ? Contact.fromMap(results.first) : null;
  }

  Future<int> delete(int id) async {
    final Database database = await databaseHelper.database;

    return (await database.delete(Contact.tableName,
        where: "${Contact.idColumn} = ?", whereArgs: [id]));
  }

  Future<int> count() async {
    final Database database = await databaseHelper.database;

    return Sqflite.firstIntValue(
        await database.rawQuery("SELECT COUNT(*) FROM ${Contact.tableName}"));
  }
}
