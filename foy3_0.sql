CREATE DATABASE SirketVeritabani
COLLATE Turkish_CI_AS
GO

USE SirketVeritabani
GO

CREATE TABLE birim (
    birim_id INT PRIMARY KEY,
    birim_ad NVARCHAR(25) COLLATE Turkish_CI_AS NOT NULL
)
GO

CREATE TABLE calisan (
    calisan_id INT PRIMARY KEY,
    ad NVARCHAR(25) COLLATE Turkish_CI_AS NULL,
    soyad NVARCHAR(25) COLLATE Turkish_CI_AS NULL,
    maas INT NULL,
    katilmaTarihi DATETIME NULL,
    calisan_birim_id INT NOT NULL,
    FOREIGN KEY (calisan_birim_id) REFERENCES birim(birim_id)
)
GO

CREATE TABLE unvan (
    unvan_calisan_id INT PRIMARY KEY,
    unvan_calisan NVARCHAR(25) COLLATE Turkish_CI_AS NULL,
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
(1, N'Yaz�l�m'),
(2, N'Donan�m'),
(3, N'G�venlik');
GO

INSERT INTO calisan (calisan_id, ad, soyad, maas, katilmaTarihi, calisan_birim_id) 
VALUES 
(1, N'�smail', N'��eri', 100000, '2014-02-20 00:00:00.000', 1),
(2, N'Hami', N'Sat�lm��', 80000, '2014-06-11 00:00:00.000', 1),
(3, N'Durmu�', N'�ahin', 300000, '2014-02-20 00:00:00.000', 2),
(4, N'Ka�an', N'Yazar', 500000, '2014-02-20 00:00:00.000', 3),
(5, N'Meryem', N'Soysald�', 500000, '2014-06-11 00:00:00.000', 3),
(6, N'Duygu', N'Ak�ehir', 200000, '2014-06-11 00:00:00.000', 2),
(7, N'K�bra', N'Seyhan', 75000, '2014-01-20 00:00:00.000', 1),
(8, N'G�lcan', N'Y�ld�z', 90000, '2014-04-11 00:00:00.000', 3);
GO

INSERT INTO unvan (unvan_calisan_id, unvan_calisan, unvan_tarih)
VALUES 
(1, N'Y�netici', '2016-02-20 00:00:00.000'),
(2, N'Personel', '2016-06-11 00:00:00.000'),
(8, N'Personel', '2016-06-11 00:00:00.000'),
(5, N'M�d�r', '2016-06-11 00:00:00.000'),
(4, N'Y�netici Yard�mc�s�', '2016-06-11 00:00:00.000'),
(7, N'Personel', '2016-06-11 00:00:00.000'),
(6, N'Tak�m Lideri', '2016-06-11 00:00:00.000'),
(3, N'Tak�m Lideri', '2016-06-11 00:00:00.000');
GO

INSERT INTO ikramiye (ikramiye_calisan_id, ikramiye_ucret, ikramiye_tarih)
VALUES 
(1, 5000, '2016-02-20 00:00:00.000'),
(2, 3000, '2016-06-11 00:00:00.000'),
(3, 4000, '2016-02-20 00:00:00.000'),
(1, 4500, '2016-02-20 00:00:00.000'),
(2, 3500, '2016-06-11 00:00:00.000');
GO