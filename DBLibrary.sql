USE [master]
GO
/****** Object:  Database [Library]    Script Date: 21.09.2023 8:45:50 ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Library_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Library] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Library] SET QUERY_STORE = OFF
GO
USE [Library]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 21.09.2023 8:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[id_author] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[NameAftor] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[id_author] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 21.09.2023 8:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[id_book] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Kolvo] [int] NULL,
	[Year] [int] NULL,
	[id_publishing] [int] NULL,
	[id_author] [int] NULL,
	[id_Genre] [int] NULL,
	[id_Categories] [int] NULL,
	[id_Format] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[id_book] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 21.09.2023 8:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id_Categories] [int] IDENTITY(1,1) NOT NULL,
	[NameCat] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id_Categories] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citys]    Script Date: 21.09.2023 8:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citys](
	[id_citys] [int] IDENTITY(1,1) NOT NULL,
	[NameCity] [nvarchar](50) NULL,
 CONSTRAINT [PK_Citys] PRIMARY KEY CLUSTERED 
(
	[id_citys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Format]    Script Date: 21.09.2023 8:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Format](
	[id_Format] [int] IDENTITY(1,1) NOT NULL,
	[NameFor] [nvarchar](50) NULL,
 CONSTRAINT [PK_Format] PRIMARY KEY CLUSTERED 
(
	[id_Format] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 21.09.2023 8:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[id_Genre] [int] IDENTITY(1,1) NOT NULL,
	[NameGe] [nvarchar](50) NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[id_Genre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishing]    Script Date: 21.09.2023 8:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishing](
	[id_publishing] [int] IDENTITY(1,1) NOT NULL,
	[NamePub] [nvarchar](50) NULL,
	[id_citys] [int] NULL,
 CONSTRAINT [PK_Publishing] PRIMARY KEY CLUSTERED 
(
	[id_publishing] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (1, N'Колпаков', N'Дмитрий', N'Андреевич', N'/Resusrs/q.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (2, N'Парамонова', N'Варвара', N'Михайловна', N'/Resusrs/w.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (3, N'Лукина', N'Арина', N'Павловна', N'/Resusrs/e.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (4, N'Артемова', N'Яна', N'Дмитриевна', N'/Resusrs/r.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (5, N'Смирнова', N'Ксения', N'Дмитриевна', N'/Resusrs/t.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (6, N'Медведев', N'Руслан', N'Игоревич', N'/Resusrs/y.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (7, N'Королев', N'Дмитрий', N'Данилович', N'/Resusrs/u.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (8, N'Смирнова', N'Маргарита', N'Данииловна', N'/Resusrs/i.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (9, N'Мальцев', N'Максим', N'Антонович', N'/Resusrs/o.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (10, N'Медведев', N'Артём', N'Юрьевич', N'/Resusrs/p.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (11, N'Демидова', N'Яна', N'Руслановна', N'/Resusrs/a.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (12, N'Гаврилов', N'Владимир', N'Романович', N'/Resusrs/s.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (13, N'Шестакова', N'Елизавета', N'Ильинична', N'/Resusrs/d.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (14, N'Щукина', N'Алёна', N'Дмитриевна', N'/Resusrs/f.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (15, N'Киселева', N'Агата', N'Максимовна', N'/Resusrs/g.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (16, N'Сидорова', N'Валерия', N'Ильинична', N'/Resusrs/h.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (17, N'Попова', N'Мила', N'Фёдоровна', N'/Resusrs/j.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (18, N'Егорова', N'Анна', N'Евгеньевна', N'/Resusrs/k.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (19, N'Курочкин', N'Адам', N'Романович', N'/Resusrs/l.png')
INSERT [dbo].[Author] ([id_author], [Surname], [NameAftor], [Patronymic], [Image]) VALUES (20, N'Березина', N'Дарья', N'Александровна', N'/Resusrs/z.png')
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (1, N'Попутный ветер', 45, 2004, 1, 1, 1, 1, 2)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (2, N'Выход есть всегда', 234, 2000, 2, 2, 2, 2, 2)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (3, N'Зачарованные мысли', 12, 2000, 3, 3, 3, 3, 3)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (4, N'Фрагменты прошлого в настоящем', 56, 2010, 4, 4, 4, 4, 4)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (5, N'Золотая пуля', 67, 2020, 5, 5, 5, 5, 5)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (6, N'Забери меня', 34, 2017, 6, 6, 6, 1, 1)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (7, N'Космический сон', 234, 2016, 7, 7, 7, 2, 2)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (8, N'Сладкий поцелуй', 65, 2015, 8, 8, 8, 3, 3)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (9, N'Сон зимы', 657, 2014, 9, 9, 9, 4, 4)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (10, N'Сломанная комната', 234, 2013, 10, 10, 10, 5, 5)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (11, N'Звездный шаг', 123, 2012, 11, 11, 11, 1, 1)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (12, N'Дотянуться до тебя', 45, 2011, 1, 12, 12, 2, 2)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (13, N'Зависимые', 234, 2010, 2, 13, 13, 3, 3)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (14, N'Свержение королевы морей', 1234, 2009, 3, 14, 14, 4, 4)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (15, N'Тёмные грёзы', 123, 2008, 4, 15, 15, 5, 5)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (16, N'Пароль от твоего сердца', 435, 2007, 5, 16, 16, 1, 1)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (17, N'Мертвый защитник', 657, 2006, 6, 17, 17, 2, 2)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (18, N'Один лишь миг', 534, 2005, 7, 18, 1, 3, 3)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (19, N'Прстальные взгляды', 346, 2004, 8, 19, 2, 4, 4)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (20, N'На краю обрыва', 135, 2003, 9, 20, 3, 5, 5)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (21, N'Дорога из лунного камня', 425, 2002, 10, 1, 4, 1, 1)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (22, N'Тайная дверь', 14, 2001, 11, 2, 5, 2, 2)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (23, N'Шёпот цветов', 563, 2000, 1, 3, 6, 3, 3)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (24, N'Любопытство бога мудрости', 656, 2010, 2, 4, 7, 4, 4)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (25, N'Смех из под земли', 256, 2011, 3, 5, 8, 5, 5)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (26, N'Холодный кофе', 267, 2012, 4, 6, 9, 1, 1)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (27, N'Сладкая вишня', 136, 2013, 5, 7, 10, 2, 2)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (28, N'Уйти красиво', 547, 2014, 6, 8, 11, 3, 3)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (29, N'Глаза как твои', 35, 2015, 7, 9, 12, 4, 4)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (30, N'Завтра начнётся Апокалипсис', 68, 2016, 8, 10, 13, 5, 5)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (1032, N'fyrty', 5, 555, 4, 3, 3, 4, 4)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (1033, N'tyrty', 56, 555, 2, 3, 4, 4, 3)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (1034, N'fghfg', 7, 7888, 3, 3, 3, 3, 3)
INSERT [dbo].[Books] ([id_book], [Name], [Kolvo], [Year], [id_publishing], [id_author], [id_Genre], [id_Categories], [id_Format]) VALUES (1035, N'u89789', 5, 6666, 7, 7, 6, 4, 5)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id_Categories], [NameCat]) VALUES (1, N'0+')
INSERT [dbo].[Categories] ([id_Categories], [NameCat]) VALUES (2, N'6+')
INSERT [dbo].[Categories] ([id_Categories], [NameCat]) VALUES (3, N'12+')
INSERT [dbo].[Categories] ([id_Categories], [NameCat]) VALUES (4, N'16+')
INSERT [dbo].[Categories] ([id_Categories], [NameCat]) VALUES (5, N'18+')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Citys] ON 

INSERT [dbo].[Citys] ([id_citys], [NameCity]) VALUES (1, N'Хеброн')
INSERT [dbo].[Citys] ([id_citys], [NameCity]) VALUES (2, N'Леон')
INSERT [dbo].[Citys] ([id_citys], [NameCity]) VALUES (3, N'Суффолк')
INSERT [dbo].[Citys] ([id_citys], [NameCity]) VALUES (4, N'Такома')
INSERT [dbo].[Citys] ([id_citys], [NameCity]) VALUES (5, N'Вэйнань')
INSERT [dbo].[Citys] ([id_citys], [NameCity]) VALUES (6, N'Файсалабад')
INSERT [dbo].[Citys] ([id_citys], [NameCity]) VALUES (7, N'Лубны')
INSERT [dbo].[Citys] ([id_citys], [NameCity]) VALUES (8, N'Бавку')
INSERT [dbo].[Citys] ([id_citys], [NameCity]) VALUES (9, N'Джамканди')
INSERT [dbo].[Citys] ([id_citys], [NameCity]) VALUES (10, N'Мичуринск
')
INSERT [dbo].[Citys] ([id_citys], [NameCity]) VALUES (11, N'Симада')
SET IDENTITY_INSERT [dbo].[Citys] OFF
GO
SET IDENTITY_INSERT [dbo].[Format] ON 

INSERT [dbo].[Format] ([id_Format], [NameFor]) VALUES (1, N'Сверхкрупные')
INSERT [dbo].[Format] ([id_Format], [NameFor]) VALUES (2, N'Крупные')
INSERT [dbo].[Format] ([id_Format], [NameFor]) VALUES (3, N'Средние')
INSERT [dbo].[Format] ([id_Format], [NameFor]) VALUES (4, N'Малые')
INSERT [dbo].[Format] ([id_Format], [NameFor]) VALUES (5, N'Сверхмалые')
SET IDENTITY_INSERT [dbo].[Format] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (1, N'Биография')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (2, N'Боевик')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (3, N'Детектив')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (4, N'Древневосточная')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (5, N'Эпиграмма')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (6, N'Реализм')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (7, N'Мифы')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (8, N'Повесть')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (9, N'Поэзия')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (10, N'Поэма')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (11, N'Приключения')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (12, N'Рассказ')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (13, N'Роман')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (14, N'Комедия')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (15, N'Трагедия')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (16, N'Триллер')
INSERT [dbo].[Genre] ([id_Genre], [NameGe]) VALUES (17, N'Ужасы')
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[Publishing] ON 

INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (1, N'Владос', 3)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (2, N'АСТ', 2)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (3, N'URSS', 3)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (4, N'ГРАНД', 4)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (5, N'Интеллект', 5)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (6, N'ИНФРА', 6)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (7, N'ОНИКС', 7)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (8, N'Питер', 8)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (9, N'КноРус', 9)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (10, N'Академия', 10)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (11, N'Айрис', 11)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (12, N'Мир', 1)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (13, N'Вече', 2)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (14, N'Дрофа', 3)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (15, N'Лань', 4)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (17, N'Омега', 5)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (18, N'Просвещение', 6)
INSERT [dbo].[Publishing] ([id_publishing], [NamePub], [id_citys]) VALUES (20, N'Герой', 1)
SET IDENTITY_INSERT [dbo].[Publishing] OFF
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Author] FOREIGN KEY([id_author])
REFERENCES [dbo].[Author] ([id_author])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Author]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories] FOREIGN KEY([id_Categories])
REFERENCES [dbo].[Categories] ([id_Categories])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Format] FOREIGN KEY([id_Format])
REFERENCES [dbo].[Format] ([id_Format])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Format]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Genre] FOREIGN KEY([id_Genre])
REFERENCES [dbo].[Genre] ([id_Genre])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Genre]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publishing] FOREIGN KEY([id_publishing])
REFERENCES [dbo].[Publishing] ([id_publishing])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publishing]
GO
ALTER TABLE [dbo].[Publishing]  WITH CHECK ADD  CONSTRAINT [FK_Publishing_Citys] FOREIGN KEY([id_citys])
REFERENCES [dbo].[Citys] ([id_citys])
GO
ALTER TABLE [dbo].[Publishing] CHECK CONSTRAINT [FK_Publishing_Citys]
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
