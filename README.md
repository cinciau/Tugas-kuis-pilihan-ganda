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
| Gambar background | ... (isi dengan sumber gambar, misalnya nama situs atau pembuatnya) |
| Font Press Start 2P | Google Fonts, karya CodeMan38, lisensi SIL Open Font License |
| Ikon (trofi) | Material Icons bawaan Flutter |

### ii. Screenshot Tiap Halaman

| Welcome | Input Nama |
|---------|------------|
| ![Welcome](docs/screenshots/welcome.png) | ![Nama](docs/screenshots/name.png) |

| Kuis | Hasil |
|------|-------|
| ![Kuis](docs/screenshots/quiz.png) | ![Hasil](docs/screenshots/result.png) |

### iii. Link Mockup/Prototype

...
