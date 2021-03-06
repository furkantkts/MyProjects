USE [master]
GO
/****** Object:  Database [Eczane]    Script Date: 11.12.2019 13:45:51 ******/
CREATE DATABASE [Eczane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Eczane', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Eczane.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Eczane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Eczane_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Eczane] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Eczane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Eczane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Eczane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Eczane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Eczane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Eczane] SET ARITHABORT OFF 
GO
ALTER DATABASE [Eczane] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Eczane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Eczane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Eczane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Eczane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Eczane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Eczane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Eczane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Eczane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Eczane] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Eczane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Eczane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Eczane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Eczane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Eczane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Eczane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Eczane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Eczane] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Eczane] SET  MULTI_USER 
GO
ALTER DATABASE [Eczane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Eczane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Eczane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Eczane] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Eczane] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Eczane] SET QUERY_STORE = OFF
GO
USE [Eczane]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Eczane]
GO
/****** Object:  Table [dbo].[AdresHasta]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdresHasta](
	[ADRESID] [int] IDENTITY(1,1) NOT NULL,
	[ADRESSEHİR] [nvarchar](50) NOT NULL,
	[ADRESILCE] [nvarchar](50) NOT NULL,
	[ADRESDETAY] [ntext] NOT NULL,
 CONSTRAINT [PK_AdresHasta] PRIMARY KEY CLUSTERED 
(
	[ADRESID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdresHastane]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdresHastane](
	[AdresID] [int] IDENTITY(1,1) NOT NULL,
	[IlceID] [int] NOT NULL,
	[Detaylar] [ntext] NULL,
 CONSTRAINT [PK_Adres] PRIMARY KEY CLUSTERED 
(
	[AdresID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bölüm]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bölüm](
	[BolumID] [int] IDENTITY(1,1) NOT NULL,
	[BolumIsmi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DoktorBolum] PRIMARY KEY CLUSTERED 
(
	[BolumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doktor]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktor](
	[DoktorID] [int] IDENTITY(1,1) NOT NULL,
	[DoktorAdi] [nvarchar](50) NOT NULL,
	[DoktorSoyadi] [nvarchar](50) NOT NULL,
	[DoktorUnvan] [nvarchar](50) NOT NULL,
	[DoktorYas] [smallint] NULL,
	[BolumID] [int] NOT NULL,
	[DoktorKullaniciAdi] [nvarchar](50) NULL,
	[DoktorSifre] [bigint] NULL,
 CONSTRAINT [PK_Doktor] PRIMARY KEY CLUSTERED 
(
	[DoktorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hasta]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hasta](
	[HastaID] [int] IDENTITY(1,1) NOT NULL,
	[HastaAdi] [nvarchar](50) NOT NULL,
	[HastaSoyadi] [nvarchar](50) NOT NULL,
	[HastaYas] [smallint] NULL,
	[HastaCinsiyet] [bit] NULL,
	[HastaSifre] [int] NOT NULL,
	[HastaKullaniciAdi] [nvarchar](50) NULL,
	[ADRESID] [int] NULL,
 CONSTRAINT [PK_Hasta] PRIMARY KEY CLUSTERED 
(
	[HastaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hasta_Doktor]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hasta_Doktor](
	[HastaID] [int] NOT NULL,
	[DoktorID] [int] NOT NULL,
 CONSTRAINT [PK_Hasta_Doktor] PRIMARY KEY CLUSTERED 
(
	[HastaID] ASC,
	[DoktorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hasta_Hastalik]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hasta_Hastalik](
	[HastaID] [int] NOT NULL,
	[HastalikID] [int] NOT NULL,
 CONSTRAINT [PK_Hasta_Hastalik] PRIMARY KEY CLUSTERED 
(
	[HastaID] ASC,
	[HastalikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastalik]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastalik](
	[HastalikID] [int] IDENTITY(1,1) NOT NULL,
	[HastalikIsmi] [nvarchar](50) NOT NULL,
	[BolumID] [int] NOT NULL,
 CONSTRAINT [PK_Hastalik] PRIMARY KEY CLUSTERED 
(
	[HastalikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastane]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastane](
	[HastaneID] [int] IDENTITY(1,1) NOT NULL,
	[HastaneAdi] [nvarchar](50) NOT NULL,
	[HastaneTur] [nvarchar](50) NOT NULL,
	[OzelMi] [bit] NOT NULL,
	[AdresID] [int] NOT NULL,
 CONSTRAINT [PK_Hastane] PRIMARY KEY CLUSTERED 
(
	[HastaneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastane_Bölüm]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastane_Bölüm](
	[HastaneID] [int] NOT NULL,
	[BolumID] [int] NOT NULL,
 CONSTRAINT [PK_Hastane_Bölüm] PRIMARY KEY CLUSTERED 
(
	[HastaneID] ASC,
	[BolumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastane_Doktor]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastane_Doktor](
	[HastaneID] [int] NOT NULL,
	[DoktorID] [int] NOT NULL,
 CONSTRAINT [PK_Hastane_Doktor] PRIMARY KEY CLUSTERED 
(
	[HastaneID] ASC,
	[DoktorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ilac]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ilac](
	[IlacID] [int] IDENTITY(1,1) NOT NULL,
	[IlacIsmi] [nvarchar](50) NOT NULL,
	[IlacFiyat] [smallint] NULL,
	[HastalikID] [int] NOT NULL,
	[IlacStok] [int] NULL,
 CONSTRAINT [PK_Ilac] PRIMARY KEY CLUSTERED 
(
	[IlacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ilce]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ilce](
	[IlceID] [int] IDENTITY(1,1) NOT NULL,
	[SehirID] [int] NOT NULL,
	[IlceIsmi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ilce] PRIMARY KEY CLUSTERED 
(
	[IlceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Randevu]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Randevu](
	[RandevuID] [int] IDENTITY(1,1) NOT NULL,
	[HastaID] [int] NOT NULL,
	[DoktorID] [int] NOT NULL,
	[HastaneID] [int] NOT NULL,
	[BolumID] [int] NOT NULL,
	[HastalikID] [int] NULL,
 CONSTRAINT [PK_Randevu] PRIMARY KEY CLUSTERED 
(
	[RandevuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sehir]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sehir](
	[SehirID] [int] IDENTITY(1,1) NOT NULL,
	[SehirIsmi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sehir] PRIMARY KEY CLUSTERED 
(
	[SehirID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparis]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparis](
	[SiparisID] [int] IDENTITY(1,1) NOT NULL,
	[HastaID] [int] NOT NULL,
	[IlacID] [int] NOT NULL,
 CONSTRAINT [PK_Siparis] PRIMARY KEY CLUSTERED 
(
	[SiparisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdresHasta] ON 

INSERT [dbo].[AdresHasta] ([ADRESID], [ADRESSEHİR], [ADRESILCE], [ADRESDETAY]) VALUES (1, N'İstanbul', N'Gaziosmanpaşa', N'310 Sokak No:3 Daire:4')
INSERT [dbo].[AdresHasta] ([ADRESID], [ADRESSEHİR], [ADRESILCE], [ADRESDETAY]) VALUES (2, N'İzmir', N'Konak', N'2 Sokak No:19 Daire:1')
INSERT [dbo].[AdresHasta] ([ADRESID], [ADRESSEHİR], [ADRESILCE], [ADRESDETAY]) VALUES (7, N'Samsun', N'Havza', N'299. Sokak No:3 Daire:4')
INSERT [dbo].[AdresHasta] ([ADRESID], [ADRESSEHİR], [ADRESILCE], [ADRESDETAY]) VALUES (8, N'Mersin', N'Toroslar', N'40. Sokak No:5 Daire:7')
INSERT [dbo].[AdresHasta] ([ADRESID], [ADRESSEHİR], [ADRESILCE], [ADRESDETAY]) VALUES (9, N'Ankara', N'Mamak', N'250. Sokak No:47 Daire:1')
INSERT [dbo].[AdresHasta] ([ADRESID], [ADRESSEHİR], [ADRESILCE], [ADRESDETAY]) VALUES (19, N'Istanbul', N'Maltepe', N'100.Sokak No:3 Daire:4')
SET IDENTITY_INSERT [dbo].[AdresHasta] OFF
SET IDENTITY_INSERT [dbo].[AdresHastane] ON 

INSERT [dbo].[AdresHastane] ([AdresID], [IlceID], [Detaylar]) VALUES (3, 3, N'Silahtarağa Cd. No:57,Eyüp Merkez')
INSERT [dbo].[AdresHastane] ([AdresID], [IlceID], [Detaylar]) VALUES (4, 4, N'Kazım Karabekir Paşa, Bahçeköy Cd. No:64')
INSERT [dbo].[AdresHastane] ([AdresID], [IlceID], [Detaylar]) VALUES (6, 6, N'Halaskargazi Cd')
INSERT [dbo].[AdresHastane] ([AdresID], [IlceID], [Detaylar]) VALUES (7, 7, N'Arnavutköy Merkez, Eski Edirne Cd. No:3')
INSERT [dbo].[AdresHastane] ([AdresID], [IlceID], [Detaylar]) VALUES (10, 10, N'Barbaros, Veysi Paşa Sk. No:14')
SET IDENTITY_INSERT [dbo].[AdresHastane] OFF
SET IDENTITY_INSERT [dbo].[Bölüm] ON 

INSERT [dbo].[Bölüm] ([BolumID], [BolumIsmi]) VALUES (1, N'Nöroloji')
INSERT [dbo].[Bölüm] ([BolumID], [BolumIsmi]) VALUES (2, N'Üroloji')
INSERT [dbo].[Bölüm] ([BolumID], [BolumIsmi]) VALUES (3, N'Dahiliye')
INSERT [dbo].[Bölüm] ([BolumID], [BolumIsmi]) VALUES (4, N'Göz ')
INSERT [dbo].[Bölüm] ([BolumID], [BolumIsmi]) VALUES (5, N'Çocuk Psikiyatri')
INSERT [dbo].[Bölüm] ([BolumID], [BolumIsmi]) VALUES (6, N'KBB')
INSERT [dbo].[Bölüm] ([BolumID], [BolumIsmi]) VALUES (7, N'Diş')
INSERT [dbo].[Bölüm] ([BolumID], [BolumIsmi]) VALUES (8, N'Genel Cerrahi')
INSERT [dbo].[Bölüm] ([BolumID], [BolumIsmi]) VALUES (9, N'Ortopedi')
INSERT [dbo].[Bölüm] ([BolumID], [BolumIsmi]) VALUES (10, N'Göğüs Hastalıları')
INSERT [dbo].[Bölüm] ([BolumID], [BolumIsmi]) VALUES (11, N'Kardiyoloji')
INSERT [dbo].[Bölüm] ([BolumID], [BolumIsmi]) VALUES (12, N'Dermotoloji')
INSERT [dbo].[Bölüm] ([BolumID], [BolumIsmi]) VALUES (13, N'Ergin Psikiyatri')
SET IDENTITY_INSERT [dbo].[Bölüm] OFF
SET IDENTITY_INSERT [dbo].[Doktor] ON 

INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (1, N'Celal ', N'Çeken', N'Profesör', 47, 1, N'celalceken', 1111111111)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (2, N'Sinan ', N'İlyas', N'Doçent', 40, 2, N'sinanilyas', 2222222222)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (3, N'Cemil', N'Öz', N'Profesör', 50, 3, N'cemiloz', 3333333333)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (4, N'M. Fatih', N'Adak', N'Yar.Doçent', 30, 4, N'mfatihadak', 4444444444)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (5, N'Nilüfer', N'Yurtay', N'Doktor', 38, 5, N'niluferyurtay', 5555555555)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (6, N'Yüksel', N'Yurtay', N'Operatör', 42, 6, N'yukselyurtay', 6666666666)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (7, N'Murat', N'İskifiyeli', N'Stajyer', 27, 7, N'muratiskifiyeli', 7777777777)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (8, N'Ali', N'Gülbağ', N'Doktor', 35, 8, N'aligulbag', 8888888888)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (9, N'Gülizar', N'Çit', N'Doktor', 33, 9, N'gulizarcit', 9999999999)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (10, N'Seçkin', N'Arı', N'Profesör', 43, 10, N'seckinari', 1010101010)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (11, N'Kayhan', N'Ayar', N'Profesör', 29, 11, N'kayhanayar', 1212121212)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (12, N'Can', N'Yüzkollar', N'Doktor', 28, 12, N'canyuzkollar', 1313131313)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (13, N'İbrahim', N'Özçelik', N'Doçent', 49, 9, N'ibrahimozcelik', 1414141414)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (14, N'Cüneyt', N'Bayılmış', N'Doktor', 34, 4, N'cuneytbayilmis', 1515151515)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (15, N'Ümit', N'Kocabıçak', N'Profesör', 51, 6, N'umitkocabicak', 1616161616)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (16, N'Nejat', N'Yumuşak', N'Doktor', 42, 3, N'nejatyumusak', 1717171717)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (17, N'Ali', N'Turan', N'Operator', 40, 1, N'alituran', 1818181818)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (18, N'Yusuf', N'Yazıcı', N'Ordinaryus', 65, 2, N'yusufyazici', 1919191919)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (19, N'Emre', N'Akbaba', N'Doçent', 44, 7, N'emreakbaba', 2020202020)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (20, N'Abdülkadir', N'Ömür', N'Doktor', 28, 5, N'abdulkadiromur', 2121212121)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (21, N'Burak', N'Yılmaz', N'Yar.Doçent', 35, 10, N'burakyilmaz', 2323232323)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (22, N'Merih', N'Demiral', N'Profesör', 59, 11, N'merihdemiral', 2424242424)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (23, N'Mert', N'Günok', N'Doktor', 30, 12, N'mertgunok', 2525252525)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (24, N'Emre', N'Çolak', N'Operatör', 24, 8, N'emrecolak', 2626262626)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (25, N'Cenk', N'Tosun', N'Doktor', 31, 3, N'cenktosun', 2727272727)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (26, N'Cengiz', N'Ünder', N'Doçent', 36, 5, N'cengizunder', 2828282828)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (27, N'Dorukhan', N'Toköz', N'Yar.Doçent', 33, 10, N'dorukhantokoz', 2929292929)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (28, N'Çağlar', N'Söyüncü', N'Profesör', 67, 2, N'caglarsoyuncu', 3030303030)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (29, N'Zeki', N'Çelik', N'Stajyer', 23, 1, N'zekicelik', 3131313131)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (30, N'Emre', N'Aşık', N'Doktor', 28, 3, N'emreasik', 3232323232)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (31, N'Tanju', N'Çolak', N'Doktor', 36, 4, N'tanjucolak', 3434343434)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (32, N'Nihat', N'Kahveci', N'Doçent', 40, 6, N'nihatkahveci', 3535353535)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (33, N'Rüştü', N'Reçber', N'Profesör', 62, 9, N'rusturecber', 3636363636)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (34, N'Servet', N'Çetin', N'Yar.Doçent', 46, 7, N'servetcetin', 3737373737)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (35, N'Arda', N'Turan', N'Stajyer', 24, 11, N'ardaturan', 3838383838)
INSERT [dbo].[Doktor] ([DoktorID], [DoktorAdi], [DoktorSoyadi], [DoktorUnvan], [DoktorYas], [BolumID], [DoktorKullaniciAdi], [DoktorSifre]) VALUES (36, N'Selçuk', N'İnan', N'Doktor', 30, 12, N'selcukinan', 3939393939)
SET IDENTITY_INSERT [dbo].[Doktor] OFF
SET IDENTITY_INSERT [dbo].[Hasta] ON 

INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [HastaYas], [HastaCinsiyet], [HastaSifre], [HastaKullaniciAdi], [ADRESID]) VALUES (1, N'Furkan', N'Tektaş', 19, 1, 181210049, N'furkantektas', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [HastaYas], [HastaCinsiyet], [HastaSifre], [HastaKullaniciAdi], [ADRESID]) VALUES (4, N'Salih', N'Sahin', 20, 1, 181210050, N'salihsahin', 2)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [HastaYas], [HastaCinsiyet], [HastaSifre], [HastaKullaniciAdi], [ADRESID]) VALUES (7, N'Enes', N'Silkin', 22, 1, 181210388, N'enessilkin', 7)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [HastaYas], [HastaCinsiyet], [HastaSifre], [HastaKullaniciAdi], [ADRESID]) VALUES (8, N'Dogukan', N'Dursun', 19, 1, 181210109, N'dogukandursun', 8)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [HastaYas], [HastaCinsiyet], [HastaSifre], [HastaKullaniciAdi], [ADRESID]) VALUES (9, N'Umut', N'Simsek', 19, 1, 181210064, N'umutsimsek', 9)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [HastaYas], [HastaCinsiyet], [HastaSifre], [HastaKullaniciAdi], [ADRESID]) VALUES (10, N'Görkem', N'Kahyaoglu', 19, 1, 181210059, N'gorkemkahyaoglu', 19)
SET IDENTITY_INSERT [dbo].[Hasta] OFF
INSERT [dbo].[Hasta_Doktor] ([HastaID], [DoktorID]) VALUES (1, 1)
INSERT [dbo].[Hasta_Hastalik] ([HastaID], [HastalikID]) VALUES (1, 4)
SET IDENTITY_INSERT [dbo].[Hastalik] ON 

INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (1, N'Astım', 10)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (2, N'Bronşit', 10)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (3, N'Nezle', 6)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (4, N'Grip', 6)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (5, N'Miyopi', 4)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (6, N'Hipermetropi', 4)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (7, N'Astigmatlık', 4)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (8, N'Felç', 1)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (9, N'Burkulma', 9)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (10, N'Kırık', 9)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (11, N'Paranoya', 13)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (12, N'Çürük', 7)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (13, N'Alzheimer', 1)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (14, N'Prostat', 2)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (15, N'Gastrid', 3)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (16, N'Ülser', 3)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (17, N'Yüksek Tansiyon', 11)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (18, N'Düşük Tansiyon', 11)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (19, N'Parkinson', 1)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (20, N'Fıtık', 9)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (21, N'Kurdeşen', 12)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (22, N'Sivilce', 12)
INSERT [dbo].[Hastalik] ([HastalikID], [HastalikIsmi], [BolumID]) VALUES (23, N'İdrar Kaçırma', 2)
SET IDENTITY_INSERT [dbo].[Hastalik] OFF
SET IDENTITY_INSERT [dbo].[Hastane] ON 

INSERT [dbo].[Hastane] ([HastaneID], [HastaneAdi], [HastaneTur], [OzelMi], [AdresID]) VALUES (6, N'Eyüp', N'Devlet', 0, 3)
INSERT [dbo].[Hastane] ([HastaneID], [HastaneAdi], [HastaneTur], [OzelMi], [AdresID]) VALUES (8, N'Sarıyer', N'Eğitim-Araştırma', 0, 4)
INSERT [dbo].[Hastane] ([HastaneID], [HastaneAdi], [HastaneTur], [OzelMi], [AdresID]) VALUES (12, N'Şişli', N'Eğitim-Araştırma', 0, 6)
INSERT [dbo].[Hastane] ([HastaneID], [HastaneAdi], [HastaneTur], [OzelMi], [AdresID]) VALUES (13, N'Arnavutköy', N'Devlet', 0, 7)
INSERT [dbo].[Hastane] ([HastaneID], [HastaneAdi], [HastaneTur], [OzelMi], [AdresID]) VALUES (16, N'Üsküdar', N'Devlet', 0, 10)
SET IDENTITY_INSERT [dbo].[Hastane] OFF
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (6, 1)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (6, 2)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (6, 3)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (6, 4)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (6, 5)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (6, 6)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (6, 7)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (6, 8)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (6, 9)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (6, 10)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (6, 11)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (6, 12)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (6, 13)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (8, 1)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (8, 2)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (8, 3)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (8, 4)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (8, 5)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (8, 6)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (8, 7)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (8, 8)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (8, 9)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (8, 10)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (8, 11)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (8, 12)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (8, 13)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (12, 1)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (12, 2)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (12, 3)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (12, 4)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (12, 5)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (12, 6)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (12, 7)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (12, 8)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (12, 9)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (12, 10)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (12, 11)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (12, 12)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (12, 13)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (13, 1)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (13, 2)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (13, 3)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (13, 4)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (13, 5)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (13, 6)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (13, 7)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (13, 8)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (13, 9)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (13, 10)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (13, 11)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (13, 12)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (13, 13)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (16, 1)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (16, 2)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (16, 3)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (16, 4)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (16, 5)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (16, 6)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (16, 7)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (16, 8)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (16, 9)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (16, 10)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (16, 11)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (16, 12)
INSERT [dbo].[Hastane_Bölüm] ([HastaneID], [BolumID]) VALUES (16, 13)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (6, 1)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (6, 2)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (6, 3)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (6, 4)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (6, 5)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (6, 6)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (6, 7)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (6, 14)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (6, 30)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (6, 31)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (6, 32)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (6, 33)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (6, 34)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (6, 35)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (8, 4)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (8, 8)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (8, 11)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (8, 12)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (8, 14)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (8, 15)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (8, 16)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (8, 17)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (8, 25)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (8, 26)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (8, 27)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (8, 28)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (8, 29)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (12, 1)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (12, 6)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (12, 14)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (12, 15)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (12, 16)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (12, 17)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (12, 18)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (12, 19)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (12, 20)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (12, 21)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (12, 22)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (12, 23)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (12, 24)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (13, 7)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (13, 9)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (13, 10)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (13, 11)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (13, 12)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (13, 13)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (13, 14)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (13, 24)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (13, 25)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (13, 26)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (13, 27)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (13, 28)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (13, 29)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (16, 4)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (16, 5)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (16, 6)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (16, 7)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (16, 8)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (16, 9)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (16, 10)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (16, 13)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (16, 30)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (16, 31)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (16, 32)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (16, 33)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (16, 34)
INSERT [dbo].[Hastane_Doktor] ([HastaneID], [DoktorID]) VALUES (16, 35)
SET IDENTITY_INSERT [dbo].[Ilac] ON 

INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (18, N'Certian', 25, 1, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (19, N'Desferol', 30, 2, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (20, N'Exelon', 35, 3, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (21, N'Galvus', 40, 4, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (22, N'Uzak Gözlük', 20, 5, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (23, N'Yakın Gözlük', 20, 6, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (24, N'Sebivo', 50, 8, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (25, N'Rasilez', 45, 9, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (26, N'Myfortic', 28, 10, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (27, N'Lamisil', 34, 11, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (29, N'Nevanac', 18, 12, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (30, N'Rasilez', 23, 13, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (31, N'Maxidex', 42, 14, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (32, N'Sammdimun', 48, 15, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (33, N'Tafiniar', 54, 16, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (34, N'Mekinist', 60, 17, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (35, N'Lazer', 2000, 7, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (36, N'Bengay', 5, 18, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (37, N'Ciloxan', 75, 19, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (38, N'Duotrav', 65, 20, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (39, N'Exforge', 63, 21, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (40, N'Foradil', 58, 22, 100)
INSERT [dbo].[Ilac] ([IlacID], [IlacIsmi], [IlacFiyat], [HastalikID], [IlacStok]) VALUES (41, N'İlaris', 67, 23, 100)
SET IDENTITY_INSERT [dbo].[Ilac] OFF
SET IDENTITY_INSERT [dbo].[Ilce] ON 

INSERT [dbo].[Ilce] ([IlceID], [SehirID], [IlceIsmi]) VALUES (3, 1, N'Eyüp')
INSERT [dbo].[Ilce] ([IlceID], [SehirID], [IlceIsmi]) VALUES (4, 1, N'Sarıyer')
INSERT [dbo].[Ilce] ([IlceID], [SehirID], [IlceIsmi]) VALUES (6, 1, N'Şişli')
INSERT [dbo].[Ilce] ([IlceID], [SehirID], [IlceIsmi]) VALUES (7, 1, N'Arnavutköy')
INSERT [dbo].[Ilce] ([IlceID], [SehirID], [IlceIsmi]) VALUES (10, 1, N'Üsküdar')
SET IDENTITY_INSERT [dbo].[Ilce] OFF
SET IDENTITY_INSERT [dbo].[Randevu] ON 

INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [HastaneID], [BolumID], [HastalikID]) VALUES (1, 1, 15, 16, 6, 3)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [HastaneID], [BolumID], [HastalikID]) VALUES (9, 1, 4, 6, 4, 6)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [HastaneID], [BolumID], [HastalikID]) VALUES (10, 10, 29, 13, 1, 13)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [HastaneID], [BolumID], [HastalikID]) VALUES (11, 7, 29, 13, 1, 19)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [HastaneID], [BolumID], [HastalikID]) VALUES (12, 4, 32, 16, 6, 3)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [HastaneID], [BolumID], [HastalikID]) VALUES (13, 9, 3, 6, 3, 15)
SET IDENTITY_INSERT [dbo].[Randevu] OFF
SET IDENTITY_INSERT [dbo].[Sehir] ON 

INSERT [dbo].[Sehir] ([SehirID], [SehirIsmi]) VALUES (1, N'İstanbul')
SET IDENTITY_INSERT [dbo].[Sehir] OFF
SET IDENTITY_INSERT [dbo].[Siparis] ON 

INSERT [dbo].[Siparis] ([SiparisID], [HastaID], [IlacID]) VALUES (13, 4, 33)
INSERT [dbo].[Siparis] ([SiparisID], [HastaID], [IlacID]) VALUES (14, 1, 21)
INSERT [dbo].[Siparis] ([SiparisID], [HastaID], [IlacID]) VALUES (15, 4, 33)
INSERT [dbo].[Siparis] ([SiparisID], [HastaID], [IlacID]) VALUES (16, 9, 31)
INSERT [dbo].[Siparis] ([SiparisID], [HastaID], [IlacID]) VALUES (17, 4, 33)
INSERT [dbo].[Siparis] ([SiparisID], [HastaID], [IlacID]) VALUES (26, 9, 32)
SET IDENTITY_INSERT [dbo].[Siparis] OFF
ALTER TABLE [dbo].[AdresHastane]  WITH CHECK ADD  CONSTRAINT [FK_Adres_Ilce] FOREIGN KEY([IlceID])
REFERENCES [dbo].[Ilce] ([IlceID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AdresHastane] CHECK CONSTRAINT [FK_Adres_Ilce]
GO
ALTER TABLE [dbo].[Doktor]  WITH CHECK ADD  CONSTRAINT [FK_Doktor_DoktorBolum] FOREIGN KEY([BolumID])
REFERENCES [dbo].[Bölüm] ([BolumID])
GO
ALTER TABLE [dbo].[Doktor] CHECK CONSTRAINT [FK_Doktor_DoktorBolum]
GO
ALTER TABLE [dbo].[Hasta]  WITH CHECK ADD  CONSTRAINT [FK_Hasta_AdresSiparis] FOREIGN KEY([ADRESID])
REFERENCES [dbo].[AdresHasta] ([ADRESID])
GO
ALTER TABLE [dbo].[Hasta] CHECK CONSTRAINT [FK_Hasta_AdresSiparis]
GO
ALTER TABLE [dbo].[Hasta_Doktor]  WITH CHECK ADD  CONSTRAINT [FK_Hasta_Doktor_Doktor] FOREIGN KEY([DoktorID])
REFERENCES [dbo].[Doktor] ([DoktorID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hasta_Doktor] CHECK CONSTRAINT [FK_Hasta_Doktor_Doktor]
GO
ALTER TABLE [dbo].[Hasta_Doktor]  WITH CHECK ADD  CONSTRAINT [FK_Hasta_Doktor_Hasta] FOREIGN KEY([HastaID])
REFERENCES [dbo].[Hasta] ([HastaID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hasta_Doktor] CHECK CONSTRAINT [FK_Hasta_Doktor_Hasta]
GO
ALTER TABLE [dbo].[Hasta_Hastalik]  WITH CHECK ADD  CONSTRAINT [FK_Hasta_Hastalik_Hasta] FOREIGN KEY([HastaID])
REFERENCES [dbo].[Hasta] ([HastaID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hasta_Hastalik] CHECK CONSTRAINT [FK_Hasta_Hastalik_Hasta]
GO
ALTER TABLE [dbo].[Hasta_Hastalik]  WITH CHECK ADD  CONSTRAINT [FK_Hasta_Hastalik_Hastalik] FOREIGN KEY([HastalikID])
REFERENCES [dbo].[Hastalik] ([HastalikID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hasta_Hastalik] CHECK CONSTRAINT [FK_Hasta_Hastalik_Hastalik]
GO
ALTER TABLE [dbo].[Hastalik]  WITH CHECK ADD  CONSTRAINT [FK_Hastalik_DoktorBolum] FOREIGN KEY([BolumID])
REFERENCES [dbo].[Bölüm] ([BolumID])
GO
ALTER TABLE [dbo].[Hastalik] CHECK CONSTRAINT [FK_Hastalik_DoktorBolum]
GO
ALTER TABLE [dbo].[Hastane]  WITH CHECK ADD  CONSTRAINT [FK_Hastane_Adres] FOREIGN KEY([AdresID])
REFERENCES [dbo].[AdresHastane] ([AdresID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hastane] CHECK CONSTRAINT [FK_Hastane_Adres]
GO
ALTER TABLE [dbo].[Hastane_Bölüm]  WITH CHECK ADD  CONSTRAINT [FK_Hastane_Bölüm_Bölüm] FOREIGN KEY([BolumID])
REFERENCES [dbo].[Bölüm] ([BolumID])
GO
ALTER TABLE [dbo].[Hastane_Bölüm] CHECK CONSTRAINT [FK_Hastane_Bölüm_Bölüm]
GO
ALTER TABLE [dbo].[Hastane_Bölüm]  WITH CHECK ADD  CONSTRAINT [FK_Hastane_Bölüm_Hastane] FOREIGN KEY([HastaneID])
REFERENCES [dbo].[Hastane] ([HastaneID])
GO
ALTER TABLE [dbo].[Hastane_Bölüm] CHECK CONSTRAINT [FK_Hastane_Bölüm_Hastane]
GO
ALTER TABLE [dbo].[Hastane_Doktor]  WITH CHECK ADD  CONSTRAINT [FK_Hastane_Doktor_Doktor] FOREIGN KEY([DoktorID])
REFERENCES [dbo].[Doktor] ([DoktorID])
GO
ALTER TABLE [dbo].[Hastane_Doktor] CHECK CONSTRAINT [FK_Hastane_Doktor_Doktor]
GO
ALTER TABLE [dbo].[Hastane_Doktor]  WITH CHECK ADD  CONSTRAINT [FK_Hastane_Doktor_Hastane] FOREIGN KEY([HastaneID])
REFERENCES [dbo].[Hastane] ([HastaneID])
GO
ALTER TABLE [dbo].[Hastane_Doktor] CHECK CONSTRAINT [FK_Hastane_Doktor_Hastane]
GO
ALTER TABLE [dbo].[Ilac]  WITH CHECK ADD  CONSTRAINT [FK_Ilac_Hastalik] FOREIGN KEY([HastalikID])
REFERENCES [dbo].[Hastalik] ([HastalikID])
GO
ALTER TABLE [dbo].[Ilac] CHECK CONSTRAINT [FK_Ilac_Hastalik]
GO
ALTER TABLE [dbo].[Ilce]  WITH CHECK ADD  CONSTRAINT [FK_Ilce_Sehir] FOREIGN KEY([SehirID])
REFERENCES [dbo].[Sehir] ([SehirID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ilce] CHECK CONSTRAINT [FK_Ilce_Sehir]
GO
ALTER TABLE [dbo].[Randevu]  WITH CHECK ADD  CONSTRAINT [FK_Randevu_Doktor] FOREIGN KEY([DoktorID])
REFERENCES [dbo].[Doktor] ([DoktorID])
GO
ALTER TABLE [dbo].[Randevu] CHECK CONSTRAINT [FK_Randevu_Doktor]
GO
ALTER TABLE [dbo].[Randevu]  WITH CHECK ADD  CONSTRAINT [FK_Randevu_Hasta] FOREIGN KEY([HastaID])
REFERENCES [dbo].[Hasta] ([HastaID])
GO
ALTER TABLE [dbo].[Randevu] CHECK CONSTRAINT [FK_Randevu_Hasta]
GO
ALTER TABLE [dbo].[Randevu]  WITH CHECK ADD  CONSTRAINT [FK_Randevu_Hastalik] FOREIGN KEY([BolumID])
REFERENCES [dbo].[Hastalik] ([HastalikID])
GO
ALTER TABLE [dbo].[Randevu] CHECK CONSTRAINT [FK_Randevu_Hastalik]
GO
ALTER TABLE [dbo].[Randevu]  WITH CHECK ADD  CONSTRAINT [FK_Randevu_Hastalik1] FOREIGN KEY([HastalikID])
REFERENCES [dbo].[Hastalik] ([HastalikID])
GO
ALTER TABLE [dbo].[Randevu] CHECK CONSTRAINT [FK_Randevu_Hastalik1]
GO
ALTER TABLE [dbo].[Randevu]  WITH CHECK ADD  CONSTRAINT [FK_Randevu_Hastane] FOREIGN KEY([HastaneID])
REFERENCES [dbo].[Hastane] ([HastaneID])
GO
ALTER TABLE [dbo].[Randevu] CHECK CONSTRAINT [FK_Randevu_Hastane]
GO
ALTER TABLE [dbo].[Siparis]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_Hasta] FOREIGN KEY([HastaID])
REFERENCES [dbo].[Hasta] ([HastaID])
GO
ALTER TABLE [dbo].[Siparis] CHECK CONSTRAINT [FK_Siparis_Hasta]
GO
ALTER TABLE [dbo].[Siparis]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_Ilac] FOREIGN KEY([IlacID])
REFERENCES [dbo].[Ilac] ([IlacID])
GO
ALTER TABLE [dbo].[Siparis] CHECK CONSTRAINT [FK_Siparis_Ilac]
GO
/****** Object:  StoredProcedure [dbo].[DoktorGetir]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DoktorGetir]
@DoktorID int
AS
BEGIN
select *from Doktor where DoktorID=@DoktorID
END
GO
/****** Object:  StoredProcedure [dbo].[DoktorNoBul]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DoktorNoBul]
@DoktorAdi nvarchar(50)
AS
BEGIN
select DoktorID from Doktor where DoktorAdi=@DoktorAdi
END
GO
/****** Object:  StoredProcedure [dbo].[IlacFiyatAl]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[IlacFiyatAl]
@IlacIsmi nvarchar(50)
AS
BEGIN
select IlacFiyat from Ilac where IlacIsmi=@IlacIsmi
END
GO
/****** Object:  StoredProcedure [dbo].[IlacIDal]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[IlacIDal]
@IlacIsmi nvarchar(50)
AS
BEGIN
select IlacID from Ilac where IlacIsmi=@IlacIsmi
END
GO
/****** Object:  StoredProcedure [dbo].[IlacStokAl]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[IlacStokAl]
@IlacIsmi nvarchar(50)
AS
BEGIN
select IlacStok from Ilac where IlacIsmi=@IlacIsmi
END
GO
/****** Object:  StoredProcedure [dbo].[KacKayitVar]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KacKayitVar]
@HastaID int
AS
BEGIN
select COUNT(*)  from Randevu where HastaID=@HastaID  
END
GO
/****** Object:  StoredProcedure [dbo].[KayitSirala]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KayitSirala]
@DoktorID int
AS
BEGIN
select RandevuID  from Randevu where DoktorID=@DoktorID
END
GO
/****** Object:  StoredProcedure [dbo].[KayitSiralaHasta]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KayitSiralaHasta]
@HastaID int
AS
BEGIN
select RandevuID from Randevu where HastaID=@HastaID 
END
GO
/****** Object:  StoredProcedure [dbo].[RandevuEkle]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RandevuEkle]
@HastaID int,
@DoktorID int,
@HastaneID int,
@BolumID int,
@HastalikID int
AS
BEGIN
insert into Randevu values(@HastaID,@DoktorID,@HastaneID,@BolumID,@HastalikID)
END
GO
/****** Object:  StoredProcedure [dbo].[RandevuGetir]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RandevuGetir]
@DoktorID int
AS
BEGIN
select COUNT(*) from Randevu where DoktorID=@DoktorID
END
GO
/****** Object:  StoredProcedure [dbo].[RandevuSil]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RandevuSil]
@HangiKayit int
AS
BEGIN
delete from Randevu where RandevuID=@HangiKayit
END
GO
/****** Object:  StoredProcedure [dbo].[SiparisEkle]    Script Date: 11.12.2019 13:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SiparisEkle]
@HastaID int,
@IlacID int
AS
BEGIN
insert into Siparis values(@HastaID,@IlacID)
END
GO
USE [master]
GO
ALTER DATABASE [Eczane] SET  READ_WRITE 
GO
