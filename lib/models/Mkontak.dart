import 'dart:async';
import 'package:umht_app/entities/Kontak.dart';
import 'package:umht_app/helpers/DbHelper.dart';
import 'package:sqflite/sqflite.dart';

// Class model kontak
// Ini berfungsi untuk menghubungkan dari entity Kontak ke Model Kontak
// Di mana Model Kontak akan terhubung ke DB Helper
class Mkontak {
  // Deklarasi variable
  DbHelper _dbHelper;
  Future<Database> _database;
  // Pengaturan nama_mahasiswa table, kolom id dan kolom sorting
  final String _tableName = 'kontak'; // nama_mahasiswa table pada database
  final String _idColumn = 'id'; // Kolom id pada table tersebut
  final String _sortColumn = 'nama_mahasiswa'; // Kolom utk sorting secara default

  // Construtor MKontak
  // Fungsi ini dipanggil ketika class pertama-kali di-inisialisasi
  Mkontak() {
    this._dbHelper = new DbHelper();
    this._database = this._dbHelper.database;
  }
  // Select kontak
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this._database;
    var mapList = await db.query(this._tableName, orderBy: _sortColumn);
    return mapList;
  }

  // Insert kontak
  Future<int> insert(Kontak object) async {
    Database db = await this._database;

    int count = await db.insert(
        this._tableName, // Mengacu pada nama_mahasiswa table, contohnya table: kontak
        object.toMap() // Input data yang akan di-insert
        );
    return count;
  }

  // Update kontak
  Future<int> update(Kontak object) async {
    Database db = await this._database;
    int count = await db.update(
        this._tableName, // Mengacu pada nama_mahasiswa table, contohnya table: kontak
        object.toMap(), // Input data yang akan di-update
        where: _idColumn + '=?', // Hasilnya akan menjadi: " where: 'id=?' "
        whereArgs: [
          object.id
        ] // Mengacu pada object id, contohnya Kontak id: 12
        );
    return count;
  }

  // Delete kontak
  Future<int> delete(int id) async {
    Database db = await this._database;
    int count = await db.delete(
        this._tableName, // Mengacu pada nama_mahasiswa table, contohnya table: kontak
        where: _idColumn + '=?', // Hasilnya akan menjadi: " where: 'id=?' "
        whereArgs: [id] // Mengacu pada object id, contohnya Kontak id: 12
        );
    return count;
  }

  // Get List
  Future<List<Kontak>> getList() async {
    var objectList = await select();
    int count = objectList.length;
    var contactList = List<Kontak>();
    for (int i = 0; i < count; i++) {
      contactList.add(Kontak.fromMap(objectList[i]));
    }
    return contactList;
  }

  // Fungsi untuk menahan dan melakukan trigger ketika database sudah siap
  Future isReady() async {
    await this._database;
    return true;
  }
}
