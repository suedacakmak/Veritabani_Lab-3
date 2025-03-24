USE SirketVeritabani

SELECT c.ad, c.soyad, c.maas
FROM calisan c
INNER JOIN birim b ON c.calisan_birim_id = b.birim_id
WHERE b.birim_ad IN ('Yazýlým', 'Donaným')