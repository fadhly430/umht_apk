import 'package:flutter/material.dart';
import 'package:umht_app/entities/Kontak.dart';

class FormInput extends StatefulWidget {
  // Declare variable
  final Kontak _kontak;
  // Constructor ini memungkinkan class utk dipanggil dgn parameter
  FormInput(this._kontak);
  // Memanggil EntryFormState dengan parameter
  @override
  FormInputState createState() => FormInputState(this._kontak);
}

class FormInputState extends State<FormInput> {
  // Declare variable
  final _formKey = GlobalKey<FormState>();
  Kontak _kontak;
  // Constructor ini memungkinkan class utk dipanggil dgn parameter
  FormInputState(this._kontak);
  // Declare controller
  // ignore: non_constant_identifier_names
  // ignore: non_constant_identifier_names
  var nama_mahasiswaController = TextEditingController();
  // ignore: non_constant_identifier_names
  var jenis_kelaminController = TextEditingController();
  // ignore: non_constant_identifier_names
  var tgl_lahirController = TextEditingController();
  // ignore: non_constant_identifier_names
  var tempat_lahirController = TextEditingController();
  var jurusanController = TextEditingController();
  var alamatController = TextEditingController();
  // Widget build
  @override
  Widget build(BuildContext context) {
    // Jika object tidak kosong,
    // maka isi dengan parameter yg ada
    // dgn kata lain ini parameter if untuk edit
    if (_kontak != null) {
      nama_mahasiswaController.text = _kontak.nama_mahasiswa;
      jenis_kelaminController.text = _kontak.jenis_kelamin;
      tgl_lahirController.text = _kontak.tgl_lahir;
      tempat_lahirController.text = _kontak.tempat_lahir;
      jurusanController.text = _kontak.jurusan;
      alamatController.text = _kontak.alamat;
    }

    // Form input
    return Scaffold(
        appBar: AppBar(
          title: _kontak == null ? Text('Tambah') : Text('Ubah'),
          backgroundColor: Colors.black,
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: _formKey,
            child: new ListView(
              children: <Widget>[
                // Input nama_mahasiswa
                new TextFormField(
                  controller:
                      nama_mahasiswaController, // Disambungkan dengan controller tadi
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Nama Mahasiswa'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon input nama mahasiswa';
                    }
                    return null;
                  },
                ),

                // Input jenis_kelamin
                new TextFormField(
                  controller:
                      jenis_kelaminController, // Disambungkan dengan controller tadi
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Jenis Kelamin'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon input jenis kelamin';
                    }
                    return null;
                  },
                ),

                // Input tgl_lahir
                new TextFormField(
                  controller:
                      tgl_lahirController, // Disambungkan dengan controller tadi
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Tanggal Lahir'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon input tanggal lahir';
                    }
                    return null;
                  },
                ),

                // Input tempat_lahir
                new TextFormField(
                  controller:
                      tempat_lahirController, // Disambungkan dengan controller tadi
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Tempat Lahir'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon input tempat lahir';
                    }
                    return null;
                  },
                ),

                  // Input Jurusan
                new TextFormField(
                  controller:
                      jurusanController, // Disambungkan dengan controller tadi
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Jurusan'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon input jurusan  mahasiswa';
                    }
                    return null;
                  },
                ),

                // Input Alamat
                new TextFormField(
                  controller:
                      alamatController, // Disambungkan dengan controller tadi
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Alamat'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon input alamat mahasiswa';
                    }
                    return null;
                  },
                ),

                // Submit button
                new Container(
                  child: new RaisedButton(
                    shape: StadiumBorder(),
                    child: new Text(
                      'Submit',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // Jika validasi berhasil
                      if (_formKey.currentState.validate()) {
                        // Jika metode tambah
                        if (_kontak == null) {
// tambah data
                          _kontak = new Kontak(
                              nama_mahasiswa: nama_mahasiswaController.text,
                              jenis_kelamin: jenis_kelaminController.text,
                              tgl_lahir: tgl_lahirController.text,
                              tempat_lahir: tempat_lahirController.text,
                              jurusan: jurusanController.text,
                              alamat: alamatController.text);
                        }
// Jika metode edit
                        else {
                          // ubah data
                          _kontak.nama_mahasiswa = nama_mahasiswaController.text;
                          _kontak.jenis_kelamin = jenis_kelaminController.text;
                          _kontak.tgl_lahir = tgl_lahirController.text;
                          _kontak.tempat_lahir = tempat_lahirController.text;
                          _kontak.jurusan = jurusanController.text;
                          _kontak.alamat = alamatController.text;
                        }
                        // kembali ke layar sebelumnya dengan membawa objek contact
                        Navigator.pop(context, _kontak);
                      }
                    },
                    color: Colors.black,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          ),
        ));
  }
}
