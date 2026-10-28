# Minecraft Quiz

## Identitas Mahasiswa

- **Nama:** Cindy Aulia
- **NIM:** 241401033
- **Lab:** 5

## Informasi Aplikasi

- **Nama Aplikasi:** Minecraft Quiz
- **Deskripsi Singkat:** Aplikasi kuis pilihan ganda bertema Minecraft. Pengguna memasukkan nama, menjawab 8 pertanyaan seputar Minecraft, lalu melihat skor akhirnya.

### Fitur-fitur yang tersedia

- Input nama pemain
- Soal pilihan ganda dengan progress bar
- Umpan balik langsung (jawaban benar berwarna hijau, salah berwarna merah)
- Skor akhir beserta pesan sesuai nilai
- Tombol main lagi dan kembali ke menu utama
- Tampilan responsif untuk HP, tablet, dan web

### Teknologi

- Flutter (Dart)
- `go_router` untuk navigasi
- `provider` untuk state management

### Struktur Folder

```
lib/
  config/      -> routes.dart (navigasi)
  data/        -> dummy_questions.dart (data soal lokal)
  models/      -> question.dart
  providers/   -> quiz_provider.dart (state management)
  screens/     -> welcome, name, quiz, result
  widgets/     -> background, button, text field, question card, answer option
```

## Dokumentasi

### i. Credit Aset

| Aset | Sumber |
|------|--------|
| Gambar background | https://id.pinterest.com/pin/931048922992720754/ |
| Font Press Start 2P |https://fonts.google.com/specimen/Press+Start+2P |

### ii. Screenshot Tiap Halaman
https://drive.google.com/drive/folders/1c0BFTVnbc-dpfa3HxoWTf3x2HyIkL84v?usp=sharing
### iii. Link Mockup/Prototype

...
