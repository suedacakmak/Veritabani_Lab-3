USE SirketVeritabani

SELECT c.ad, c.soyad, c.maas, b.birim_ad
FROM calisan c
INNER JOIN birim b ON c.calisan_birim_id = b.birim_id
WHERE c.maas IN (
    SELECT MAX(c2.maas)
    FROM calisan c2
    WHERE c2.calisan_birim_id = c.calisan_birim_id
    GROUP BY c2.calisan_birim_id
)