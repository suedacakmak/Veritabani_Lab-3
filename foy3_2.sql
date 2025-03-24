USE SirketVeritabani

SELECT ad, soyad, maas
FROM calisan
WHERE maas = (SELECT MAX(maas) FROM calisan)