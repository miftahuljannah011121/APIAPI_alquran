import 'package:flutter/material.dart';
import 'detailQuran.dart';
import 'httpService.dart';
import 'quranModel.dart';

class QuranScreen extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Surah'),
      ),
      body: FutureBuilder<List<QuranModel>>(
        future: httpService.getSurah(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final surahList = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
              ),
              itemCount: surahList.length,
              itemBuilder: (context, index) {
                final surah = surahList[index];
                return Card(
                  child: ListTile(
                    title: Text('${surah.namaLatin}'),
                    subtitle: Text('${surah.nama} - ${surah.jumlahAyat} ayat'),
                    onTap: () {
                      print(
                          'Surah yang dipilih: ${surah.nomor}'); // Debugging untuk cek nomor surah

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(nomor: surah.nomor),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Tidak ada data'));
          }
        },
      ),
    );
  }
}
