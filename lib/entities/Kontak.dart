class Kontak {
  int id;
  // ignore: non_constant_identifier_names
  String nama_mahasiswa;
  // ignore: non_constant_identifier_names
  String jenis_kelamin;
  // ignore: non_constant_identifier_names
  String tgl_lahir;
  // ignore: non_constant_identifier_names
  String tempat_lahir;
  String jurusan;
  String alamat;
  // Constructor ini memungkinkan anda untuk
  // Membuat class beserta isinya sekaligus
  // ignore: non_constant_identifier_names
  Kontak({this.nama_mahasiswa, this.jenis_kelamin, this.tgl_lahir, this.tempat_lahir, this.jurusan,  this.alamat});
  // Fungsi untuk menerima dari format Map
  Kontak.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.nama_mahasiswa = map['nama_mahasiswa'];
    this.jenis_kelamin = map['jenis_kelamin'];
    this.tgl_lahir = map['tgl_lahir'];
    this.tempat_lahir = map['tempat_lahir'];
    this.jurusan = map['jurusan'];
    this.alamat = map['alamat'];
  }
  // Fungsi untuk return ke format Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama_mahasiswa': nama_mahasiswa,
      'jenis_kelamin': jenis_kelamin,
      'tgl_lahir': tgl_lahir,
      'tempat_lahir': tempat_lahir,
      'jurusan': jurusan,
      'alamat': alamat,
    };
  }
}
