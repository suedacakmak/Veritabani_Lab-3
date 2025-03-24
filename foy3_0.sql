CREATE DATABASE SirketVeritabani
GO

USE SirketVeritabani
GO

CREATE TABLE birim (
    birim_id INT PRIMARY KEY,
    birim_ad CHAR(25) NOT NULL
)
GO

CREATE TABLE calisan (
    calisan_id INT PRIMARY KEY,
    ad CHAR(25) NULL,
    soyad CHAR(25) NULL,
    maas INT NULL,
    katilmaTarihi DATETIME NULL,
    calisan_birim_id INT NOT NULL,
    FOREIGN KEY (calisan_birim_id) REFERENCES birim(birim_id)
)
GO

CREATE TABLE unvan (
    unvan_calisan_id INT PRIMARY KEY,
    unvan_calisan CHAR(25) NULL,
    unvan_tarih DATETIME NULL,
    FOREIGN KEY (unvan_calisan_id) REFERENCES calisan(calisan_id)
)
GO

CREATE TABLE ikramiye (
    ikramiye_calisan_id INT NOT NULL,
    ikramiye_ucret INT NULL,
    ikramiye_tarih DATETIME NULL,
    FOREIGN KEY (ikramiye_calisan_id) REFERENCES calisan(calisan_id)
)
GO

INSERT INTO birim (birim_id, birim_ad) 
VALUES 
(1, 'Yazılım'),
(2, 'Donanım'),
(3, 'Güvenlik');
GO

INSERT INTO calisan (calisan_id, ad, soyad, maas, katilmaTarihi, calisan_birim_id) 
VALUES 
(1, 'İsmail', 'İşeri', 100000, '2014-02-20 00:00:00.000', 1),
(2, 'Hami', 'Satılmış', 80000, '2014-06-11 00:00:00.000', 1),
(3, 'Durmuş', 'Şahin', 300000, '2014-02-20 00:00:00.000', 2),
(4, 'Kağan', 'Yazar', 500000, '2014-02-20 00:00:00.000', 3),
(5, 'Meryem', 'Soysaldı', 500000, '2014-06-11 00:00:00.000', 3),
(6, 'Duygu', 'Akşehir', 200000, '2014-06-11 00:00:00.000', 2),
(7, 'Kübra', 'Seyhan', 75000, '2014-01-20 00:00:00.000', 1),
(8, 'Gülcan', 'Yıldız', 90000, '2014-04-11 00:00:00.000', 3);
GO

INSERT INTO unvan (unvan_calisan_id, unvan_calisan, unvan_tarih)
VALUES 
(1, 'Yönetici', '2016-02-20 00:00:00.000'),
(2, 'Personel', '2016-06-11 00:00:00.000'),
(8, 'Personel', '2016-06-11 00:00:00.000'),
(5, 'Müdür', '2016-06-11 00:00:00.000'),
(4, 'Yönetici Yardımcısı', '2016-06-11 00:00:00.000'),
(7, 'Personel', '2016-06-11 00:00:00.000'),
(6, 'Takım Lideri', '2016-06-11 00:00:00.000'),
(3, 'Takım Lideri', '2016-06-11 00:00:00.000');
GO

INSERT INTO ikramiye (ikramiye_calisan_id, ikramiye_ucret, ikramiye_tarih)
VALUES 
(1, 5000, '2016-02-20 00:00:00.000'),
(2, 3000, '2016-06-11 00:00:00.000'),
(3, 4000, '2016-02-20 00:00:00.000'),
(1, 4500, '2016-02-20 00:00:00.000'),
(2, 3500, '2016-06-11 00:00:00.000');
GO