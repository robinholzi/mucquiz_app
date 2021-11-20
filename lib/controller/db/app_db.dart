
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

MQDb mqDb = MQDb();

class DatabaseError {}

class MQDb {

  bool _initialized = false;

  // ===========================================================================
  // basic db prefs ============================================================
  static final String DATABASE_FILE = "mucquiz_db.db";
  Database? _db;

  // ===========================================================================

  Future<void> init() async {
    assert(!_initialized);
    _db = await openDatabase(
      join(await getDatabasesPath(), DATABASE_FILE),
      version: 1,
      // example
      // onCreate: (db, version) {
      //   return db.execute(
      //     _DB_COMMANDS.CREATE_COMMUNITY,
      //   )
      //       .then((value) { print("DB: community table created"); })
      //       .onError((error, stackTrace) { print(stackTrace); } );
      // },
    );
    if (_db == null || !_db!.isOpen) {
      // TODO error
      throw DatabaseError();
    }

    print("DB: initialized!");
    _initialized = true;

    await readAndLoadCommunities();
    print("DB: read!");
  }

  Future<void> close() async {
    await _db?.close();
    _db = null;
    _initialized = false;
  }

  Future<void> resetApp() async {
    try { await close(); } catch(ex){}
    await deleteDatabase(join(await getDatabasesPath(), DATABASE_FILE),);
  }

  // example
  /*
  Future<void> addOrReplaceCommunity(Community community) async {
    assert (_db != null && _initialized && community != null);
    await _db!.insert(
      _DB_COMMANDS.TABLE_COMMUNITY,
      community.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    addToListIfNotPresent(community);
  }
  */

  Future<void> readAndLoadCommunities() async {
    assert (_db != null && _initialized);

    // example
    /*
    List<Map<String, dynamic>> maps = await _db!.query('community');

    // List<Map<String, dynamic> --> List<Community>.
    List<Community> communities = List<Community>.generate(maps.length, (int i) {
      return Community(
        id: maps[i]['id'] as int,
        name: maps[i]['name'] as String,
        description: maps[i]['description'] as String,
        members: maps[i]['members'] as int,
        cryptMemberId: maps[i]['crypt_member_id'] as String,
        cryptSecretKey: maps[i]['crypt_secret_key'] as String,
        cryptAccessToken: maps[i]['crypt_access_token'] as String,
        imgUrl: maps[i]['img_url'] as String,
        invalid: (maps[i]['invalid'] as int) == 1,
      );
    });
    _communities.clear();
    _communities.addAll(communities);
    */

  }

}

class _DB_COMMANDS {
  // example

  // static const String TABLE_COMMUNITY = "community";
  // static const String CREATE_COMMUNITY = """
  // CREATE TABLE "$TABLE_COMMUNITY" (
  // "id"	INTEGER NOT NULL,
  // "name"	TEXT NOT NULL,
  // "description"	TEXT,
  // "members"	INTEGER NOT NULL,
  // "crypt_member_id"	TEXT NOT NULL,
  // "crypt_secret_key"	TEXT NOT NULL,
  // "crypt_access_token"	TEXT,
  // "img_url"	TEXT,
  // "invalid" INTEGER NOT NULL DEFAULT 1,
  // PRIMARY KEY("id" AUTOINCREMENT)
  // )""";
}