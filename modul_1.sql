-- Nama : Nur azizah
-- Nim : 22241047
-- Modul 1

-- Menggunakan database undika_mart
use undikma_mart;

-- mengambil 1 data nama_produk dari tabel ms_produk_dplap
SELECT nama_produk FROM ms_produk_dqlab;

-- mengambil lebih dari satu kolom
SELECT nama_produk, harga FROM ms_produk_dqlab;

-- mengambil seluruh kolom tabel
SELECT * FROM ms_produk_dqlab;

-- LATIHAN
-- 1. Mengambil kolom kode_produk, nama_produk dari tabel ms_produk_dqlab
SELECT kode_produk, nama produk FROM ms_produk;
-- 2. mengambil seluruh kolom dari tabel tr_penjualan
SELECT * FROM tr_penjualan_dqlab;

-- ALIAS & PREFIX
-- CONTOH PREFIX
SELECT me_produk_dqlab.nama_produk FROM ms_produk_dqlab;

SELECT undikma_mart.ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;

-- CONTOH ALIAS di dalam kolom
SELECT nama_produk as np FROM ms_produk_dqlab;
SELECT nama_produk np FROM ms_produk_ dqlab;

-- contoh ALIAS di dalam tabel
SELECT nama_produk FROM ms_produk_dqlab as mpl;

-- Contoh penggunaan ALIAS di PREFIX
SELECT mpl.nama_produk FROM produk_dq as mpl;

-- MEMBUAT CASE 1
SELECT nama_pelanggan, alamat FROM ms_pelanggan_dqlab;

-- Membuat CASE 2
SELECT nama_produk, harga FROM ms_produk_dqlab;