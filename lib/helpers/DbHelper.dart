import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// Class untuk menghubungkan aplikasi ke db
class DbHelper {
  // Declare variable
  static Database _database;
  // Constructor Db Helper,
  // Dipanggil ketika Db Helper di-inisialisasi
  DbHelper() {
    // Jika database blm siap, maka siapkan
    if (DbHelper._database == null) {
      initialize().then((result) {
        DbHelper._database = result;
      });
    }
  }

  // Fungsi penyiapan database
  Future<Database> initialize() async {
    //untuk menentukan nama_mahasiswa database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'default.db';
    //create, read databases
    var dbInUse = openDatabase(path, version: 1, onCreate: _createDb);
    //mengembalikan nilai object sebagai hasil dari fungsinya
    return dbInUse;
  }

  // Buat tabel baru dengan nama_mahasiswa kontak
  void _createDb(Database db, int version) async {
    await db.execute('''
 CREATE TABLE IF NOT EXISTS kontak (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 nama_mahasiswa TEXT,
 jenis_kelamin TEXT,
 tgl_lahir TEXT,
 tempat_lahir TEXT,
 jurusan TEXT,
 alamat TEXT
 )
 ''');
  }

  // Fungsi get database
  Future<Database> get database async {
    // Jika database blm siap, maka siapkan
    if (DbHelper._database == null) {
      DbHelper._database = await initialize();
    }
    return _database;
  }
}
