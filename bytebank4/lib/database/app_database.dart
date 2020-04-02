import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase(String sql) async {
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'bytebank.db'),
    onCreate: (db, version) {
      return db.execute(sql,);
    },
    version: 2,
    //onDowngrade: onDatabaseDowngradeDelete,
  );
  return database;
}


