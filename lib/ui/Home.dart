import 'package:flutter/material.dart';
import 'dart:async';
import 'package:umht_app/models/Mkontak.dart';
import 'package:umht_app/entities/Kontak.dart';
import 'package:umht_app/ui/FormInput.dart';
import 'package:umht_app/ui/SideBarMenu.dart';

// class Home extends StatefulWidget {
//   @override
//   HomeState createState() => HomeState();
// }

class FormSqflite extends State<Hal4Page> {
  // Declare variable
  Mkontak _mkontak = new Mkontak();
  int count = 0;
  List<Kontak> contactList;
  @override
  Widget build(BuildContext context) {
    // If list is null, the initialize list
    if (contactList == null) {
      contactList = List<Kontak>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Data Mahasiswa'),
        backgroundColor: Colors.black,
        elevation: 5,
      ),
      body: createListView(),
      // floatingActionButton disini adalah tombol mengambang (+)
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        backgroundColor: Colors.black,
        onPressed: () async {
          // Munculkan pop up form input
          // Jika hasilnya bukan null, maka tambahkan data
          var contact = await pushAndGetFormInputResult(context, null);
          if (contact != null) addData(contact);
        },
      ),
    );
  }

  // Fungsi untuk memunculkan pop up form input
  // Dan memberikan return hasilnya berupa entity Kontak
  Future<Kontak> pushAndGetFormInputResult(
      BuildContext context, Kontak contact) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return FormInput(contact);
    }));
    return result;
  }

  // Fungsi ini digunakan untuk menampilkan list view
  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 45,
            ),
            title: Text(
              this.contactList[index].nama_mahasiswa,
              style: textStyle,
            ),
            subtitle: Text(this.contactList[index].jurusan, ),
            
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                // Menghapus data ketika icon delete diketuk
                deleteData(contactList[index]);
              },
            ),
            onTap: () async {
              // Memunculkan data ketika nama_mahasiswa diketuk
              // Pop up akan dimunculkan dan melakukan return berupa entity Kontak
              // Lalu dilanjutkan jika kontak tidak null, maka update data
              var contact = await pushAndGetFormInputResult(
                  context, this.contactList[index]);
              if (contact != null) editData(contact);
            },
          ),
        );
      },
    );
  }

  // Fungsi untuk menambahkan kontak ke db dan mengupdate list view
  void addData(Kontak object) async {
    int result = await _mkontak.insert(object);
    if (result > 0) {
      updateListView();
    }
  }

  // Fungsi untuk mengubah kontak ke db dan mengupdate list view
  void editData(Kontak object) async {
    int result = await _mkontak.update(object);
    if (result > 0) {
      updateListView();
    }
  }

  // Fungsi untuk menghapus kontak dari db dan mengupdate list view
  void deleteData(Kontak object) async {
    int result = await _mkontak.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  // Fungsi untuk mengupdate list view
  void updateListView() {
    Future<List<Kontak>> contactListFuture = _mkontak.getList();
    contactListFuture.then((contactList) {
      setState(() {
        this.contactList = contactList;
        this.count = contactList.length;
      });
    });
  }
}
