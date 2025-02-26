import 'dart:convert';

SurahModel surahModelFromJson(String str) =>
    SurahModel.fromJson(json.decode(str));

String surahModelToJson(SurahModel data) => json.encode(data.toJson());

class SurahModel {
  bool status;
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  List<Ayat> ayat;
  SuratSelanjutnya? suratSelanjutnya;
  bool suratSebelumnya;

  SurahModel({
    required this.status,
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.ayat,
    this.suratSelanjutnya,
    required this.suratSebelumnya,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        status: json["status"] == true,
        nomor: json["nomor"] ?? 0,
        nama: json["nama"] ?? '',
        namaLatin: json["nama_latin"] ?? '',
        jumlahAyat: json["jumlah_ayat"] ?? 0,
        tempatTurun: json["tempat_turun"] ?? '',
        arti: json["arti"] ?? '',
        deskripsi: json["deskripsi"] ?? '',
        ayat:
            List<Ayat>.from((json["ayat"] ?? []).map((x) => Ayat.fromJson(x))),
        suratSelanjutnya: (json["surat_selanjutnya"] is Map<String, dynamic>)
            ? SuratSelanjutnya.fromJson(json["surat_selanjutnya"])
            : null,
        suratSebelumnya: json["surat_sebelumnya"] == true,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "ayat": List<dynamic>.from(ayat.map((x) => x.toJson())),
        "surat_selanjutnya": suratSelanjutnya?.toJson(),
        "surat_sebelumnya": suratSebelumnya,
      };
}



class Ayat {
  int id;
  int surah;
  int nomor;
  String ar;
  String tr;
  String idn;

  Ayat({
    required this.id,
    required this.surah,
    required this.nomor,
    required this.ar,
    required this.tr,
    required this.idn,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        id: json["id"] ?? 0,
        surah: json["surah"] ?? 0,
        nomor: json["nomor"] ?? 0,
        ar: json["ar"] ?? '',
        tr: json["tr"] ?? '',
        idn: json["idn"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surah": surah,
        "nomor": nomor,
        "ar": ar,
        "tr": tr,
        "idn": idn,
      };
}

class SuratSelanjutnya {
  int id;
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  String audio;

  SuratSelanjutnya({
    required this.id,
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
  });

  factory SuratSelanjutnya.fromJson(Map<String, dynamic> json) =>
      SuratSelanjutnya(
        id: json["id"] ?? 0,
        nomor: json["nomor"] ?? 0,
        nama: json["nama"] ?? '',
        namaLatin: json["nama_latin"] ?? '',
        jumlahAyat: json["jumlah_ayat"] ?? 0,
        tempatTurun: json["tempat_turun"] ?? '',
        arti: json["arti"] ?? '',
        deskripsi: json["deskripsi"] ?? '',
        audio: json["audio"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
      };
}