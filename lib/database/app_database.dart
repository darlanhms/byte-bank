import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String joinedPath = join(dbPath, 'bytebank.db');

    return openDatabase(
      joinedPath,
      onCreate: (db, version) => _handleCreateTables(db, version),
      version: 1,
    );
  });
}

void _handleCreateTables(Database db, int version) {
  db.execute('CREATE TABLE IF NOT EXISTS contacts('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'account_number INTEGER'
      ')');
}
