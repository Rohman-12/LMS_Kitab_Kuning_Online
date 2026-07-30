-- ===================================================
-- DATABASE PEMBELAJARAN KITAB KUNING ONLINE
-- Mazhab: Syafi'i | Charset: utf8mb4_unicode_ci
-- ===================================================

CREATE DATABASE IF NOT EXISTS `db_kitab_tanpa_login` 
DEFAULT CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE `db_kitab_tanpa_login`;

-- ---------------------------------------------------
-- 1. Tabel `kitab`
-- ---------------------------------------------------
DROP TABLE IF EXISTS `bab_kitab`;
DROP TABLE IF EXISTS `kitab`;

CREATE TABLE `kitab` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `judul_kitab` VARCHAR(255) NOT NULL,
  `judul_arab` VARCHAR(255) NOT NULL,
  `pengarang` VARCHAR(255) NOT NULL,
  `kategori` VARCHAR(100) NOT NULL,
  `deskripsi` TEXT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------
-- 2. Tabel `bab_kitab`
-- ---------------------------------------------------
CREATE TABLE `bab_kitab` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `kitab_id` INT(11) NOT NULL,
  `judul_bab` VARCHAR(255) NOT NULL,
  `matan_arab` TEXT NOT NULL,
  `terjemah_indo` TEXT NOT NULL,
  `file_audio` VARCHAR(255) DEFAULT 'default_syarah.mp3',
  `urutan` INT(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `kitab_id` (`kitab_id`),
  CONSTRAINT `fk_bab_kitab` FOREIGN KEY (`kitab_id`) REFERENCES `kitab` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------
-- DATA INSERTS: KITAB 1 (Safinatun Najah)
-- ---------------------------------------------------
INSERT INTO `kitab` (`id`, `judul_kitab`, `judul_arab`, `pengarang`, `kategori`, `deskripsi`) VALUES
(1, 'Safinatun Najah', 'سَفِينَةُ النَّجَاةِ', 'Syekh Salim bin Sumair Al-Hadhrami', 'Fiqih Dasar', 'Matan ringkas fiqih ibadah mazhab Syafi'i yang menjadi rujukan utama santri pemula, membahas rukun Islam, iman, thaharah, dan shalat.');

INSERT INTO `bab_kitab` (`id`, `kitab_id`, `judul_bab`, `matan_arab`, `terjemah_indo`, `file_audio`, `urutan`) VALUES
(1, 1, 'Fasal: Rukun Islam', 
 'أَرْكَانُ الْإِسْلَامِ خَمْسَةٌ: شَهَادَةُ أَنْ لَا إِلٰهَ إِلَّا اللهُ وَأَنَّ مُحَمَّدًا رَسُولُ اللهِ، وَإِقَامُ الصَّلَاةِ، وَإِيتَاءُ الزَّكَاةِ، وَصَوْمُ رَمَضَانَ، وَحَجُّ الْبَيْتِ مَنِ اسْتَطَاعَ إِلَيْهِ سَبِيلًا.', 
 'Rukun Islam itu ada 5 (lima) perkara:\n1. Mengucapkan dua kalimat syahadat (Bersaksi bahwa tidak ada Tuhan selain Allah dan bahwa Nabi Muhammad adalah utusan Allah).\n2. Mendirikan shalat lima waktu.\n3. Menunaikan zakat.\n4. Berpuasa di bulan Ramadhan.\n5. Menunaikan ibadah haji ke Baitullah bagi orang yang mampu menempuh perjalanannya.', 
 'safinah_bab1_rukun_islam.mp3', 1),

(2, 1, 'Fasal: Syarat-Syarat Wudhu', 
 'شُرُوطُ الْوُضُوءِ عَشَرَةٌ: الْإِسْلَامُ، وَالتَّمْيِيزُ، وَالنَّقَاءُ عَنِ الْحَيْضِ وَالنِّفَاسِ، وَعَمَّا يَمْنَعُ وُصُولَ الْمَاءِ إِلَى الْبَشَرَةِ، وَأَنْ لَا يَكُونَ عَلَى الْعُضْوِ مَا يُغَيِّرُ الْمَاءَ، وَالْعِلْمُ بِفَرْضِيَّتِهِ، وَأَنْ لَا يَعْتَقِدَ فَرْضًا مِنْ فُرُوضِهِ سُنَّةً، وَالْمَاءُ الطَّهُورُ، وَدُخُولُ الْوَقْتِ، وَالْمُوَالَاةُ لِدَائِمِ الْحَدَثِ.', 
 'Syarat-syarat wudhu ada 10 (sepuluh) perkara:\n1. Islam.\n2. Tamyiz (dapat membedakan baik dan buruk).\n3. Suci dari haid dan nifas.\n4. Suci dari sesuatu yang menghalangi sampainya air ke permukaan kulit.\n5. Tidak ada sesuatu pada anggota wudhu yang dapat mengubah sifat air.\n6. Mengetahui bahwa hukum wudhu adalah fardhu (wajib).\n7. Tidak menganggap salah satu fardhu wudhu sebagai amalan sunnah.\n8. Menggunakan air yang suci lagi menyucikan (air mutlaq).\n9. Telah masuk waktu shalat (khusus bagi orang yang selalu berhadats).\n10. Muwalah (berturut-turut tanpa jeda lama) bagi orang yang selalu berhadats.', 
 'safinah_bab2_syarat_wudhu.mp3', 2),

(3, 1, 'Fasal: Hal yang Membatalkan Wudhu', 
 'نَوَاقِضُ الْوُضُوءِ أَرْبَعَةُ أَشْيَاءَ: الْأَوَّلُ: الْخَارِجُ مِنْ أَحَدِ السَّبِيلَيْنِ مِنْ قُبُلٍ أَوْ دُبُرٍ رِيحٌ أَوْ غَيْرُهُ إِلَّا الْمَنِيَّ، الثَّانِي: زَوَالُ الْعَقْلِ بِنَوْمٍ أَوْ غَيْرِهِ إِلَّا نَوْمَ قَاعِدٍ مُمَكِّنٍ مَقْعَدَهُ مِنَ الْأَرْضِ، الثَّالِثُ: الْتِقَاءُ بَشَرَتَيْ رَجُلٍ وَامْرَأَةٍ كَبِيرَيْنِ أَجْنَبِيَّيْنِ مِنْ غَيْرِ حَائِلٍ، الرَّابِعُ: مَسُّ قُبُلِ الْآدَمِيِّ أَوْ حَلَقَةِ دُبُرِهِ بِبَطْنِ الرَّاحَةِ أَوْ بُطُونِ الْأَصَابِعِ.', 
 'Hal-hal yang membatalkan wudhu ada 4 (empat) perkara:\n1. Sesuatu yang keluar dari salah satu dua jalan (kemaluan depan/belakang) baik berupa angin maupun lainnya, kecuali mani.\n2. Hilangnya akal sebab tidur atau lainnya, kecuali tidurnya orang yang duduk dalam posisi mantap di atas lantai.\n3. Bersentuhan kulit antara laki-laki dan perempuan yang sama-sama dewasa dan bukan mahram tanpa penghalang.\n4. Menyentuh kemaluan manusia atau lingkaran duburnya dengan telapak tangan bagian dalam atau perut jari-jemari.', 
 'safinah_bab3_batal_wudhu.mp3', 3);

-- ---------------------------------------------------
-- DATA INSERTS: KITAB 2 (Fathul Qarib Al-Mujib)
-- ---------------------------------------------------
INSERT INTO `kitab` (`id`, `judul_kitab`, `judul_arab`, `pengarang`, `kategori`, `deskripsi`) VALUES
(2, 'Fathul Qarib Al-Mujib', 'فَتْحُ الْقَرِيبِ الْمُجِيبِ', 'Syekh Ibn Qasim Al-Ghazi', 'Fiqih Menengah', 'Kitab Syarah Matan Al-Ghayah wat Taqrib karya Abu Syuja', membahas hukum Fiqih Mazhab Syafi'i secara mendalam dan sistematis.');

INSERT INTO `bab_kitab` (`id`, `kitab_id`, `judul_bab`, `matan_arab`, `terjemah_indo`, `file_audio`, `urutan`) VALUES
(4, 2, 'Fasal: Macam-Macam Air Yang Boleh Untuk Bersuci', 
 'الْمِيَاهُ الَّتِي يَجُوزُ بِهَا التَّطْهِيرُ سَبْعُ مِيَاهٍ: مَاءُ السَّمَاءِ، وَمَاءُ الْبَحْرِ، وَمَاءُ النَّهْرِ، وَمَاءُ الْبِئْرِ، وَمَاءُ الْعَيْنِ، وَمَاءُ الثَّلْجِ، وَمَاءُ الْبَرَدِ. ثُمَّ الْمِيَاهُ عَلَى أَرْبَعَةِ أَقْسَامٍ: طَاهِرٌ مُطَهِّرٌ غَيْرُ مَكْرُوهٍ وَهُوَ الْمَاءُ الْمُطْلَقُ، وَطَاهِرٌ مُطَهِّرٌ مَكْرُوهٌ وَهُوَ الْمَاءُ الْمُشَمَّسُ، وَطَاهِرٌ غَيْرُ مُطَهِّرٍ وَهُوَ الْمَاءُ الْمُسْتَعْمَلُ وَالْمُتَغَيِّرُ بِمَا خَالَطَهُ مِنَ الطَّاهِرَاتِ، وَمَاءٌ نَجِسٌ وَهُوَ الَّذِي حَلَّتْ فِيهِ نَجَاسَةٌ وَهُوَ دُونَ الْقُلَّتَيْنِ.', 
 'Air yang boleh digunakan untuk bersuci ada 7 (tujuh) macam air:\n1. Air hujan (langit).\n2. Air laut.\n3. Air sungai.\n4. Air sumur.\n5. Air mata air.\n6. Air salju/es.\n7. Air embun.\n\nKemudian air terbagi menjadi 4 (empat) hukum:\n1. Suci menyucikan dan tidak makruh (Air Mutlaq).\n2. Suci menyucikan namun makruh (Air Musyammas/terkena panas matahari pada wadah logam).\n3. Suci tetapi tidak menyucikan (Air Musta'mal dan air yang berubah sebab bercampur benda suci).\n4. Air Najis (Air kurang dari dua qullah yang kejatuhan najis, atau dua qullah yang berubah sifatnya).', 
 'fathul_qarib_bab1_macam_air.mp3', 1),

(5, 2, 'Fasal: Fardhu-Fardhu Wudhu', 
 'وَفُرُوضُ الْوُضُوءِ سِتَّةُ أَشْيَاءَ: الْأَوَّلُ: النِّيَّةُ عِنْدَ غَسْلِ الْوَجْهِ، وَالثَّانِي: غَسْلُ الْوَجْهِ، وَالثَّالِثُ: غَسْلُ الْيَدَيْنِ إِلَى الْمِرْفَقَيْنِ، وَالرَّابِعُ: مَسْحُ بَعْضِ الرَّأْسِ، وَالْخَامِسُ: غَسْلُ الرِّجْلَيْنِ إِلَى الْكَعْبَيْنِ، وَالسَّادِسُ: التَّرْتِيبُ عَلَى مَا ذَكَرْنَاهُ.', 
 'Fardhu (rukun) wudhu ada 6 (enam) perkara:\n1. Niat ketika pertama kali membasuh muka.\n2. Membasuh seluruh muka.\n3. Membasuh kedua tangan sampai ke kedua siku.\n4. Mengusap sebagian dari kepala.\n5. Membasuh kedua kaki sampai ke kedua mata kaki.\n6. Tertib (berurutan) sesuai dengan susunan yang telah disebutkan.', 
 'fathul_qarib_bab2_fardhu_wudhu.mp3', 2);

-- ---------------------------------------------------
-- DATA INSERTS: KITAB 3 (Ta'lim Muta'allim)
-- ---------------------------------------------------
INSERT INTO `kitab` (`id`, `judul_kitab`, `judul_arab`, `pengarang`, `kategori`, `deskripsi`) VALUES
(3, 'Ta'lim Muta'allim', 'تَعْلِيمُ الْمُتَعَلِّمِ طَرِيقَ التَّعَلُّمِ', 'Syekh Burhanuddin Az-Zarnuji', 'Akhlaq & Adab Ilmu', 'Kitab panduan utama akhlaq dan etika penuntut ilmu di pesantren. Membahas niat belajar, cara memilih guru, memuliakan ilmu dan ustadz, serta resep kesuksesan ilmu bernilai barokah.');

INSERT INTO `bab_kitab` (`id`, `kitab_id`, `judul_bab`, `matan_arab`, `terjemah_indo`, `file_audio`, `urutan`) VALUES
(6, 3, 'Fasal 1: Hakikat Ilmu, Fiqih, dan Keutamaannya',
 'قَالَ رَسُولُ اللهِ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ: طَلَبُ الْعِلْمِ فَرِيضَةٌ عَلَى كُلِّ مُسْلِمٍ وَمُسْلِمَةٍ...',
 'Menuntut ilmu adalah kewajiban bagi setiap muslim. Dan diwajibkan menuntut Ilmul Hal.', 'taklim_bab1_hakikat_ilmu.mp3', 1);

-- ---------------------------------------------------
-- DATA INSERTS: KITAB 4 (Fathul Izar)
-- ---------------------------------------------------
INSERT INTO `kitab` (`id`, `judul_kitab`, `judul_arab`, `pengarang`, `kategori`, `deskripsi`) VALUES
(4, 'Fathul Izar', 'فَتْحُ الْإِزَارِ فِي كَشْفِ الْأَسْرَارِ', 'Syekh Aqil bin Zainal Abidin Al-Munawi', 'Fiqih Munakahat / Rumah Tangga', 'Kitab rujukan pesantren santri tingkat lanjut mengenai adab pernikahan, tata cara dan etik bersetubuh (jima'), rahasia waktu dan doa, serta pembentukan karakter keluarga sakinah.');

INSERT INTO `bab_kitab` (`id`, `kitab_id`, `judul_bab`, `matan_arab`, `terjemah_indo`, `file_audio`, `urutan`) VALUES
(7, 4, 'Fasal 1: Adab & Ketentuan Bersetubuh (Nikah/Jima')',
 'الْفَصْلُ الأَوَّلُ فِي الآدَابِ وَالْكَيْفِيَّاتِ: اعْلَمْ أَنَّ لِلْجِمَاعِ آدَابًا وَكَيْفِيَّاتٍ...',
 'Fasal Pertama mengenai Adab dan Tata Cara Bersetubuh (jima' suami istri) dalam syariat Islam.', 'fathul_izar_bab1_adab_jima.mp3', 1);
