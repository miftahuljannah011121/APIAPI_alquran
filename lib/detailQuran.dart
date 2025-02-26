import 'package:flutter/material.dart';
import 'httpService.dart';
import 'surahModel.dart';
import 'package:html/parser.dart' as htmlParser;

class DetailScreen extends StatelessWidget {
  final int nomor;
  final HttpService httpService = HttpService();

  DetailScreen({required this.nomor});

  String cleanHtml(String htmlContent) {
    final document = htmlParser.parse(htmlContent);
    return document.body?.text ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Surah'),
      ),
      body: FutureBuilder<SurahModel>(
        future: httpService.dataSurah(nomor),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final surah = snapshot.data!;

            print('Data diterima untuk Surah: ${surah.nama}'); // Cek nama surah
            print(
                'Jumlah Ayat: ${surah.ayat.length}'); // Pastikan ayat tidak kosong

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nomor: ${surah.nomor}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('Nama: ${surah.nama}', style: TextStyle(fontSize: 16)),
                    Text('Nama Latin: ${surah.namaLatin}',
                        style: TextStyle(fontSize: 16)),
                    Text('Jumlah Ayat: ${surah.jumlahAyat}',
                        style: TextStyle(fontSize: 16)),
                    Text('Tempat Turun: ${surah.tempatTurun}',
                        style: TextStyle(fontSize: 16)),
                    Text('Arti: ${surah.arti}', style: TextStyle(fontSize: 16)),
                    Text('Deskrispi: ${cleanHtml(surah.deskripsi)}',
                        style: TextStyle(fontSize: 16)),
                    Text('Ayat:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: surah.ayat.length,
                      itemBuilder: (context, index) {
                        final ayat = surah.ayat[index];
                        return ListTile(
                          title: Text(ayat.ar),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cleanHtml(ayat.tr)),
                              Text(cleanHtml(ayat.idn)),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                  
                ),
              ),
            );
          } else {
            return Center(child: Text('Tidak ada data'));
          }
        },
      ),
    );
  }
}
