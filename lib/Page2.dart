import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Untuk ikon Instagram
import 'package:url_launcher/url_launcher.dart'; // Untuk membuka link

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  // Fungsi untuk membuka link
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Avatar bagian atas
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage("assets/images/profil.JPG"),
            ),
            SizedBox(height: 10.0),
            Text(
              "Andika Surya Elang Pratama",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            // Kartu 'About'
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Color(0xFFFCDC8D),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Saya adalah seorang junior back-end developer yang saat ini masih menempuh Sekolah Menengah Kejuruan di SMK Wikrama, dengan minat besar dalam coding dan pemecahan masalah. Saya memiliki pemahaman yang cukup baik tentang Java, PHP, dan JavaScript (Pemula), serta berpengalaman menggunakan framework seperti Laravel dan Spring Boot. Saya selalu berusaha untuk terus belajar dan berkembang di bidang ini, serta mencari kesempatan untuk terlibat dalam proyek-proyek menarik. Tujuan saya adalah membangun sistem back-end yang skalabel dan efisien, sambil terus mengikuti perkembangan teknologi terbaru dan tren industri.",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Kartu 'History'
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "History",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Saya mulai tertarik dengan pemrograman saat belajar bahasa pemograman PHP di sekolah. Sejak itu, saya mendalami pengembangan back-end dengan mempelajari JavaScript, serta framework Laravel dan Spring Boot. Saya telah mengerjakan beberapa proyek kecil yang membantu saya memahami dasar-dasar pengembangan aplikasi. Saat ini, saya terus belajar dan mencari pengalaman baru untuk mengasah kemampuan saya di bidang ini.",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Kartu 'Skill'
            SizedBox(
              width: MediaQuery.of(context).size.width *
                  1, // 90% dari lebar layar
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Skill",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("• MySQL"),
                          Text("• PostgreSQL"),
                          Text("• PHP"),
                          Text("• GitHub"),
                          Text("• Java"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      // Footer dengan icon Instagram
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.black),
                onPressed: () {
                  _launchURL('https://instagram.com/andkaasep');
                },
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.github, color: Colors.black),
                onPressed: () {
                  _launchURL('https://github.com/Elgzprtma');
                },
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.linkedinIn,color: Colors.black,),
                onPressed: () {
                  _launchURL('https://www.linkedin.com/in/andikasuryael/');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
