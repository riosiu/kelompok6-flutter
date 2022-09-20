import 'package:belajar_flutter/book_card.dart';
import 'package:flutter/material.dart';

class ListViewHome extends StatelessWidget {
  const ListViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: const Text("Baru saja ditambahkan ke daftar tersimpan",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black54))),
        const BookCard(
          title: "Nineteen Eighty-four",
          year: 1949,
          coverImageSrc:
              "http://books.google.com/books/content?id=JT_JDAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
          description:
              "Sepanjang hidupnya, Winston berusaha menjadi warga negara yang baik dengan mematuhi setiap aturan Partai meski jauh di dalam hati dan pikirannya bersemayam antipati terhadap kediktatoran yang ada di negaranya. Walaupun begitu, Winston tidak berani melakukan perlawanan secara terbuka. Tidak mengherankan, karena Polisi Pikiran, teleskrin, dan mikrofon tersembunyi membuat privasi hanya serupa fantasi. Bahkan, sejarah ditulis ulang sesuai kehendak Partai. Negara berkuasa mutlak atas rakyatnya. ",
        ),
        Card(
          elevation: 11.0,
          shadowColor:  Colors.greenAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)
          ),
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage( './assets/images/books-1.jpg',
              ),
              ),
            ),
          ),
        ),
        const BookCard(
          title: "Nineteen Eighty-four",
          year: 1949,
          coverImageSrc:
              "http://books.google.com/books/content?id=JT_JDAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
          description:
              "Sepanjang hidupnya, Winston berusaha menjadi warga negara yang baik dengan mematuhi setiap aturan Partai meski jauh di dalam hati dan pikirannya bersemayam antipati terhadap kediktatoran yang ada di negaranya. Walaupun begitu, Winston tidak berani melakukan perlawanan secara terbuka. Tidak mengherankan, karena Polisi Pikiran, teleskrin, dan mikrofon tersembunyi membuat privasi hanya serupa fantasi. Bahkan, sejarah ditulis ulang sesuai kehendak Partai. Negara berkuasa mutlak atas rakyatnya. ",
        )
      ],
    );
  }
}
