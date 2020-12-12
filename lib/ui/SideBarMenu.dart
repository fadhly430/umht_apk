import 'package:flutter/material.dart';
import 'package:umht_app/ui/Home.dart';





// void main() {
//   runApp(new MaterialApp(
//     home: new MyApp(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

class MySidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'UTS by Fadhly',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        initialRoute: '/Home',
        routes: <String, WidgetBuilder>{
          '/Home': (BuildContext context) => new HomePage(),
          '/Hal1Page': (BuildContext context) => new Hal1Page(),
          '/Hal2Page': (BuildContext context) => new Hal2Page(),
          '/Hal3Page': (BuildContext context) => new Hal3Page(),
          '/Hal4Page': (BuildContext context) => new Hal4Page(),
        });
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('fadhly@bagus.com'),
            accountName: Text('Muhammad Fadhly', style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold),),
         
            currentAccountPicture: CircleAvatar(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    image: DecorationImage( 
                      image:
                      NetworkImage("https://media-exp1.licdn.com/dms/image/C5603AQGsC50Drqbcmg/profile-displayphoto-shrink_200_200/0?e=1609977600&v=beta&t=dyHQ0yizg_V4lfJGGBEg0CNjZJiX9urb3PqYNdqUZ3E"),
                      fit: BoxFit.cover,
                      
                      ),

                    ),
                  ),
                  
                  ),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.popAndPushNamed(context, '/Home');
            },
          ),
          ListTile(
            title: Text('Halman 1'),
            leading: Icon(Icons.work),
            onTap: () {
              Navigator.popAndPushNamed(context, '/Hal1Page');
            },
          ),
          ListTile(
            title: Text('Halaman 2'),
            leading: Icon(Icons.face),
            onTap: () {
              Navigator.popAndPushNamed(context, '/Hal2Page');
            },
          ),
          ListTile(
            title: Text('Halaman 3'),
            leading: Icon(Icons.group),
            onTap: () {
              Navigator.popAndPushNamed(context, '/Hal3Page');
            },
          ),
          ListTile(
            title: Text('CURD Sqflite'),
            leading: Icon(Icons.group),
            onTap: () {
              Navigator.popAndPushNamed(context, '/Hal4Page');
            },
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("UTS PEMROGRAMAN ANDROID"),
        backgroundColor: Colors.black,
        
      ),
      drawer: AppDrawer(),
      body: Center( 
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        
        children: <Widget> [

          Image.network("https://media-exp1.licdn.com/dms/image/C5603AQGsC50Drqbcmg/profile-displayphoto-shrink_200_200/0?e=1609977600&v=beta&t=dyHQ0yizg_V4lfJGGBEg0CNjZJiX9urb3PqYNdqUZ3E"),
          Text(''),
          Text("NAME : MUHAMMAD FADLI ", style: TextStyle(fontSize: 15)),
          Text( "NIM : 2022182218", style: TextStyle(fontSize: 15)),
          Text("FACULTY : FAKULTAS KOMPUTER", style: TextStyle(fontSize: 15)),
          Text("PROGRAM STUDY : S1 TEKNIK INFORMATIKA", style: TextStyle(fontSize: 15)),
        ],),
      )
    );
  }
}

class Hal1Page extends StatefulWidget {
  @override
  _Hal1PageState createState() => _Hal1PageState();
}

class _Hal1PageState extends State<Hal1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cerpen Singkat Lucu"),
        backgroundColor: Colors.black,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: ListView(
          
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.network("https://cdn.popmama.com/content-images/post/20190322/img-22032019-092715-800-x-420-pixel-0e4a0fcf9775b12a0f4da06efb5befe9.jpg"),
            ),
            
            Center(child: Text("Scrub Gula Pasir", style: TextStyle(fontSize: 25),)),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text("Di siang hari, Lia sedang ngobrol santai dengan Andes terlihat sangat asyik pembicaraan mereka. “Ndes, menurutmu Dion itu suka tipe perempuan yang seperti apa?”. “Em, apa ya? Kalau aku terawang Dion sukanya perempuan santai yang gak banyak ulah. Ujar Andes. “Jadi gak suka cewe ginju?” Tanya Lia. “Maybe yes maybe no.” “Menurut kamu apa yang bisa menggantikan lipstik?”. “Coba kamu pake scrub gula pasir.”“Oya?”. ”Nanti malam ku coba demi sang pujaan hati adinda. Hahaha.” “Kan seminggu lagi ada bazar dikampus siapa tau ketemu Dion, scruban aja terus kamu tiap malam.” “Bener, harus tampil maksimal.” Tukas Lia mengiyakan. Beberapa hari sudah lewat. Di hari sebelum acara, Lia tampil seperti saran Andes, Andes kaget melihatnya. “Ada apa dengan bibir kamu Lia? Kenapa sangat merah ? Berapa kilo gula yang kamu gunakan  ? Ujar Andes menahan tawa. “Ini gigitan semut tiap malam tauu, perjuangan gara gara scrub fula pasir.” Jawab Lia.“Oh My Good”. Teriak Andes tertawa terpingkal-pingkal.", style: TextStyle(fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }
}

class Hal2Page extends StatefulWidget {
  @override
  _Hal2PageState createState() => _Hal2PageState();
}

class _Hal2PageState extends State<Hal2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SEJARAH UNIVERSITAS MH.THAMRIN"),
          backgroundColor: Colors.black,
        ),
        drawer: AppDrawer(),
        body: Center(
          child: ListView(
             
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.network("http://www.thamrin.ac.id/medias/home/logo%20umht2020.png"),
                ),
                Center(child: Text("Sejarah Universitas MH. Thamrin", style: TextStyle(fontSize: 20.0,),)),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Text("UNIVERSITAS MH.THAMRIN, Yayasan Pendidikan MH. Thamrin JakartaTimur didirikan di Jakarta oleh Dr. H. Abdul Radjak, DSOG,. KampusUniversitas MH. Thamrin beralamat di Jl.Raya Podok Gede No. 23-25 Kramat Jati Jakarta Timur dan menempati gedung miliksendiri. Pendirian Yayasan didorong oleh suatu cita-cita dan tekad, ikut berperanaktif dalam usaha mencerdaskan kehidupan bangsa, seperti yang diamanatkan dalamPembukaan Undang-Undang Dasar1945. Pada awal pendiriannya pendidikan yang dikelola adalah pendidikan setingkatkursus, dengan membuka kursus Penolong Orang Sakit (POS), ini berlangsung daritahun 1982-1983, selanjutnya dikembangkan ke sekolah formal setingkat diplomayang bernaung dibawah Departemen Kesehatan, antara lain: AkademiKeperawatan, Akademi Gizi, Akademi Analis Kesehatan, Akademi Analis danFarmasi, Akademi Manajemen Pelayanan Rumah Sakit, Akademi Kebidanan. Mulaitahun 2000, seluruh Akademi yang berada dibawah Departemen Kesehatan dileburmenjadi satu ke dalam Sekolah Tinggi, yaitu Sekolah Tinggi Ilmu Kesehatan(STIKes) MH. Thamrin, dengan Surat Keputusan Mediknas Nomor : 60/D/O/2005,dan bernaung dibawah Departemen Pendidikan Nasional,sesuai denganUndang-undang Sistem Pendidikan Nasional Republik Indonesia. "),
                  
                )
              ]),
        ));
  }
}

class Hal3Page extends StatefulWidget {
  @override
  _Hal3PageState createState() => _Hal3PageState();
}

class _Hal3PageState extends State<Hal3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Artificial intelligence (AI)"),
        backgroundColor: Colors.black,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network(
                  'https://i0.wp.com/www.blogpress.id/wp-content/uploads/2020/07/Artificial-Intellegence.png?w=750&ssl=1'),
            ),
            Center(child: Text('Artificial intelligence (AI)', style: TextStyle(fontSize: 25.0,),)),
            Padding(
              
              padding: const EdgeInsets.all(50.0),
              child: Text(
                  "Artificial intelligence (AI) adalah kecerdasan buatan dari cabang ilmu yang ada di bidang komputer, yang isi di dalamnya lebih menekankan pola pikir dan bekerja pada manusia, pengembangan dalam hal intellejen mesin, dan lain sebagainya. Contoh penerapannya yaitu seperti pemecahan suatu masalah, pengenalan suara, dll. Kecerdasasan buatan ini kini telah menjadi perbincangan atau pembahasan menarik, yang juga banyak dibahas oleh orang-orang yang ahli dalam bidang bisnis serta teknologi. Bahkan, banyak juga ahli serta analisis industri yang memiliki pendapat bahwa artificial intelligence (AI) adalah apa yang bisa kita ketahui dari masa depan atau masa kini."),
            ),
          ],
        ),
      ),
    );
  }
}

class Hal4Page extends StatefulWidget {
  @override
  FormSqflite createState() => FormSqflite();
}

