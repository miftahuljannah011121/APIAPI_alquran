import 'dart:convert';

QuranModel quranModelFromJson(String str) =>
    QuranModel.fromJson(json.decode(str));

String quranModelToJson(QuranModel data) => json.encode(data.toJson());

class QuranModel {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;

  QuranModel({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
  });

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    return QuranModel(
      nomor: json["nomor"] is int ? json["nomor"] : 0,
      nama: json["nama"] ?? "",
      namaLatin: json["nama_latin"] ?? "",
      jumlahAyat: json["jumlah_ayat"] is int ? json["jumlah_ayat"] : 0,
      tempatTurun: json["tempat_turun"] ?? "",
      arti: json["arti"] ?? "",
      deskripsi: json["deskripsi"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nomor": nomor,
      "nama": nama,
      "nama_latin": namaLatin,
      "jumlah_ayat": jumlahAyat,
      "tempat_turun": tempatTurun,
      "arti": arti,
      "deskripsi": deskripsi,
    };
  }
}
