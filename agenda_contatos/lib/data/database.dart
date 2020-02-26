import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/contact.dart';

class DatabaseHelper {
  Database _database;

  DatabaseHelper._internal();

  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async =>
      _database == null ? await create() : _database;

  Future<Database> create() async {
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, "contacts.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute("""

          CREATE TABLE ${Contact.tableName} (
            ${Contact.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${Contact.nameColumn} TEXT NOT NULL,
            ${Contact.emailColumn} TEXT,
            ${Contact.phoneColumn} TEXT,
            ${Contact.pictureColumn} TEXT);

        """);
      },
    );
  }

  close() async {
    if (_database != null) {
      await _database.close();
      _database = null;
    }
  }
}
