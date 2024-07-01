-- NAMA	: Nur azizah
-- NIM	: 22241047
-- MODUL 5
-- menggunakan database
use undikma_mart;


-- JOIN 
-- tampilkan nama pelanggan beserta qty belanjanya 
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM ms_pelanggan_dqlab AS mp JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan;

-- JOIN tanpa filter = cross join 
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM ms_pelanggan_dqlab AS mp JOIN tr_penjualan_dqlab AS tp
ON true;

-- INNER JOIN
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM ms_pelanggan_dqlab AS mp INNER JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan;

-- LEFT OUTER JOIN
SELECT tp.kode_pelanggan, nama_pelanggan,qty
FROM tr_penjualan_dqlab AS tp LEFT OUTER JOIN ms_pelanggan_dqlab AS mp
ON mp.kode_pelanggan = tp.kode_pelanggan;

-- RIGHT OUTER JOIN 
SELECT tp.kode_pelanggan, nama_pelanggan,qty
FROM tr_penjualan_dqlab AS tp RIGHT OUTER JOIN ms_pelanggan_dqlab AS mp
ON mp.kode_pelanggan = tp.kode_pelanggan;

-- LEFT OUTER JOIN 3 tabel
-- tampilkan nama pelanggan, kategori produk yang dibeli, nama produk dan qty belanjanya 
SELECT mp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM tr_penjualan_dqlab AS tp 
LEFT OUTER JOIN ms_pelanggan_dqlab AS mp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk
ORDER BY qty DESC;


-- GROUPING dan FUNGSI AGREGASI pada JOIN 
-- tampilkan katagori produk, nama prduk, dan jumlah qty yang dikelompokkan berdasarkan katagori dan nama kelompok 
SELECT mpd.kategori_produk, mpd.nama_produk, sum(tp.qty) AS jumlah_qty_terjual
FROM ms_produk_dqlab AS mpd
LEFT OUTER JOIN tr_penjualan_dqlab AS tp
ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.kategori_produk, mpd.nama_produk
HAVING sum(tp.qty) IS NULL
ORDER BY sum(tp.qty) DESC;

-- LATIHAN MANDIRI
-- NO 1
SELECT mp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM tr_penjualan_dqlab AS tp 
INNER JOIN ms_pelanggan_dqlab AS mp
ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk;

-- NO 2
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk , mpd.nama_produk , tp.qty
FROM ms_pelanggan_dqlab AS mp 
LEFT JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk
WHERE tp.qty IS NOT NULL;

-- NO 3 
SELECT mpd.kategori_produk, SUM(tp.qty) AS total_qty
FROM ms_pelanggan_dqlab AS mp
INNER JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk_dqlab AS mpd
ON tp.kode_produk = mpd.kode_produk
GROUP BY mpd.kategori_produk
ORDER BY total_qty DESC;



-- NO 4
SELECT mp1.kode_produk AS kode_produk_1, 
mp1.nama_produk AS nama_produk_1, 
mp2.kode_produk AS kode_produk_2, 
mp2.nama_produk AS nama_produk_2,
mp1.kategori_produk
FROM ms_produk_dqlab AS mp1
JOIN ms_produk_dqlab AS mp2
ON mp1.kategori_produk = mp2.kategori_produk
AND mp1.kode_produk != mp2.kode_produk;