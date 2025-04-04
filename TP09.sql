USE [master]
GO
/****** Object:  Database [TP09]    Script Date: 22/11/2022 12:20:39 ******/
CREATE DATABASE [TP09]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP09', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP09.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP09_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP09_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TP09] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP09].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP09] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP09] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP09] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP09] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP09] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP09] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP09] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP09] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP09] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP09] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP09] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP09] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP09] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP09] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP09] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP09] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP09] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP09] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP09] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP09] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP09] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP09] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP09] SET RECOVERY FULL 
GO
ALTER DATABASE [TP09] SET  MULTI_USER 
GO
ALTER DATABASE [TP09] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP09] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP09] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP09] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP09] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP09', N'ON'
GO
ALTER DATABASE [TP09] SET QUERY_STORE = OFF
GO
USE [TP09]
GO
/****** Object:  User [alumno]    Script Date: 22/11/2022 12:20:39 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Estadio]    Script Date: 22/11/2022 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estadio](
	[IdEstadio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[capacidad] [int] NOT NULL,
	[m2] [int] NOT NULL,
	[FotoEstadio] [varchar](50) NULL,
 CONSTRAINT [PK_Estadio] PRIMARY KEY CLUSTERED 
(
	[IdEstadio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jugador]    Script Date: 22/11/2022 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugador](
	[IdJugador] [int] IDENTITY(1,1) NOT NULL,
	[IdPais] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[NumeroCamiseta] [int] NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[PosicionDeJuego] [varchar](50) NOT NULL,
	[Repetida] [bit] NOT NULL,
	[imagenJugador] [varchar](150) NULL,
	[Pegadas] [bit] NOT NULL,
 CONSTRAINT [PK_Jugador] PRIMARY KEY CLUSTERED 
(
	[IdJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 22/11/2022 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[abreviación] [varchar](50) NOT NULL,
	[bandera] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partidos]    Script Date: 22/11/2022 12:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partidos](
	[idPartido] [int] IDENTITY(1,1) NOT NULL,
	[IdEstadio] [int] NOT NULL,
	[IdPais1] [int] NOT NULL,
	[fechaJugar] [datetime] NOT NULL,
	[IdPais2] [int] NOT NULL,
 CONSTRAINT [PK_Partidos] PRIMARY KEY CLUSTERED 
(
	[idPartido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Jugador] ON 

INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (5, 1, N'Saad', N'Al-sheeb', 1, CAST(N'1990-02-19T00:00:00.000' AS DateTime), N'Portero', 1, N'https://www.euro-soccer-cards.com/99220-home_default/saad-al-sheeb-qatar-qat3-wc-qatar-2022.jpg', 1)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (6, 1, N'Tarek', N'Salman', 5, CAST(N'1997-12-05T00:00:00.000' AS DateTime), N'Defensor', 0, N'https://figuritasqatar.com.ar/wp-content/uploads/tarek-salman-231x300.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (7, 1, N'Pedro', N'Miguel', 2, CAST(N'1990-08-06T00:00:00.000' AS DateTime), N'Defensor', 0, N'https://www.euro-soccer-cards.com/99227-home_default/pedro-miguel-qatar-qat10-wc-qatar-2022.jpg', 1)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (9, 1, N'Abdulaziz', N'Hatem', 6, CAST(N'1990-10-28T00:00:00.000' AS DateTime), N'Mediocentro', 0, N'https://www.euro-soccer-cards.com/99230/abdulaziz-hatem-qatar-qat13-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (10, 1, N'Musaab', N'Khidir', 13, CAST(N'1993-09-26T00:00:00.000' AS DateTime), N'Mediocentro', 0, N'https://figuritasqatar.com.ar/wp-content/uploads/musaab-khidir.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (11, 1, N'Almoez', N'Ali', 19, CAST(N'1996-08-19T00:00:00.000' AS DateTime), N'Delantero', 1, N'https://http2.mlstatic.com/D_NQ_NP_977512-MLA52399573170_112022-V.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (12, 1, N'Mohammed', N'Muntari', 9, CAST(N'1993-12-20T00:00:00.000' AS DateTime), N'Delantero', 1, N'https://cdn.shopify.com/s/files/1/0561/4639/5336/products/IMG_2466_b21a1d19-950f-48ff-801f-f45ff73adc94.jpg?v=1663092818', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (15, 2, N'Hernán', N'Galíndez
', 1, CAST(N'1987-03-30T00:00:00.000' AS DateTime), N'Portero', 1, N'https://http2.mlstatic.com/D_NQ_NP_821437-MLA52142581759_102022-V.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (16, 2, N'Piero', N'Hincapié
', 3, CAST(N'2002-01-09T00:00:00.000' AS DateTime), N'Defensor', 1, N'https://http2.mlstatic.com/D_NQ_NP_829753-MLA52106797817_102022-V.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (18, 2, N'Angelo', N'Preciado', 24, CAST(N'2001-10-16T00:00:00.000' AS DateTime), N'Defensor', 0, N'https://figuritasqatar.com.ar/wp-content/uploads/angelo-preciado.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (19, 2, N'Moises', N'Caicedo', 21, CAST(N'1998-08-21T00:00:00.000' AS DateTime), N'Mediocentro', 0, N'https://figuritasqatar.com.ar/wp-content/uploads/moises-caicedo.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (20, 2, N'Alan', N'Franco', 10, CAST(N'1994-09-24T00:00:00.000' AS DateTime), N'Mediocentro', 1, N'https://figuritasqatar.com.ar/wp-content/uploads/alan-franco.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (21, 2, N'Michael', N'Estrada', 11, CAST(N'1996-04-07T00:00:00.000' AS DateTime), N'Delantero', 1, N'https://www.euro-soccer-cards.com/99253/michael-estrada-ecuador-ecu16-wc-qatar-2022.jpg', 1)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (22, 2, N'Angel', N'Mena', 9, CAST(N'1999-01-18T00:00:00.000' AS DateTime), N'Delantero', 0, N'https://figuritasqatar.com.ar/wp-content/uploads/angel-mena.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (23, 3, N'Edouard', N'Mendy', 1, CAST(N'1994-11-23T00:00:00.000' AS DateTime), N'Portero', 0, N'https://figuritasqatar.com.ar/wp-content/uploads/edouard-mendy.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (24, 3, N'Ibrahima', N'Mbaye', 19, CAST(N'1996-03-08T00:00:00.000' AS DateTime), N'Defensor', 1, N'https://figuritasqatar.com.ar/wp-content/uploads/ibrahima-mbaye.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (25, 3, N'Formose', N'Mendy
', 2, CAST(N'2001-01-02T00:00:00.000' AS DateTime), N'Defensor', 0, N'https://http2.mlstatic.com/D_NQ_NP_675383-MLA52339689314_112022-V.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (26, 3, N'Pape', N'Gueye', 17, CAST(N'2002-09-14T00:00:00.000' AS DateTime), N'Mediocentro', 0, N'https://figuritasqatar.com.ar/wp-content/uploads/pape-gueye.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (29, 3, N'Idrissa', N'Gueye
', 5, CAST(N'1989-09-26T00:00:00.000' AS DateTime), N'Mediocentro', 0, N'https://cdn.shopify.com/s/files/1/0561/4639/5336/products/IMG_1833.jpg?v=1662317818', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (30, 3, N'Bamba', N'Dieng', 20, CAST(N'2000-03-23T00:00:00.000' AS DateTime), N'Delantero', 0, N'https://i.pinimg.com/736x/7f/e0/d6/7fe0d66fd06bb8ed6e897b4201a32922.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (31, 3, N'Sadio', N'Mane', 15, CAST(N'2001-06-20T00:00:00.000' AS DateTime), N'Delantero', 0, N'https://figuritasqatar.com.ar/wp-content/uploads/sadio-mane.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (36, 4, N'Justin', N'Bijlow', 44, CAST(N'1994-04-07T00:00:00.000' AS DateTime), N'Portero', 1, N'https://figuritasqatar.com.ar/wp-content/uploads/justin-bijlow.png', 1)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (37, 4, N'Matthijs', N'de Ligt', 3, CAST(N'1999-08-12T00:00:00.000' AS DateTime), N'Defensor', 1, N'https://cdn.shopify.com/s/files/1/0561/4639/5336/products/IMG_1846.jpg?v=1662319151', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (39, 4, N'Virgil', N'van Dijk', 4, CAST(N'1991-07-08T00:00:00.000' AS DateTime), N'Defensor', 0, N'https://http2.mlstatic.com/D_NQ_NP_725343-MLA52025673641_102022-V.jpg', 1)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (40, 4, N'Frenkie', N'de Jong', 21, CAST(N'1997-05-12T00:00:00.000' AS DateTime), N'Mediocentro', 1, N'https://www.euro-soccer-cards.com/99288-home_default/frenkie-de-jong-netherlands-ned11-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (43, 4, N'Davy', N'Klaassen', 14, CAST(N'1993-02-21T00:00:00.000' AS DateTime), N'Mediocentro', 0, N'https://www.euro-soccer-cards.com/99290-home_default/davy-klaassen-netherlands-ned13-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (44, 4, N'Memphis', N'Depay', 10, CAST(N'1994-02-13T00:00:00.000' AS DateTime), N'Delantero', 0, N'https://www.euro-soccer-cards.com/99295-home_default/memphis-depay-netherlands-ned18-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (45, 4, N'Steven', N'Bergwinj', 19, CAST(N'1992-08-07T00:00:00.000' AS DateTime), N'Delantero', 0, N'https://figuritasqatar.com.ar/wp-content/uploads/steven-bergwijn.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (46, 5, N'Aaron', N'Ramsdale', 23, CAST(N'1998-05-14T00:00:00.000' AS DateTime), N'Portero', 0, N'https://www.euro-soccer-cards.com/99301-home_default/aaron-ramsdale-england-eng4-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (47, 5, N'John', N'Stones', 21, CAST(N'1997-10-08T00:00:00.000' AS DateTime), N'Defensor', 0, N'https://figuritasqatar.com.ar/wp-content/uploads/john-stones.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (49, 5, N'Trent', N'Alexander-Arnold', 18, CAST(N'1998-10-07T00:00:00.000' AS DateTime), N'Defensor', 0, N'https://www.euro-soccer-cards.com/99302-home_default/trent-alexander-arnold-england-eng5-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (50, 5, N'Phil', N'Foden', 20, CAST(N'2000-05-28T00:00:00.000' AS DateTime), N'Mediocentro', 1, N'https://www.euro-soccer-cards.com/99314-home_default/phil-foden-england-eng17-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (53, 5, N'Jude', N'Bellingham', 22, CAST(N'2003-06-29T00:00:00.000' AS DateTime), N'Mediocentro', 0, N'https://www.euro-soccer-cards.com/99308-home_default/jude-bellingham-england-eng11-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (54, 5, N'Harry', N'Kane', 9, CAST(N'1993-07-28T00:00:00.000' AS DateTime), N'Delantero', 0, N'https://figuritasqatar.com.ar/wp-content/uploads/harry-kane.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (56, 5, N'Raheem', N'Sterling', 10, CAST(N'1994-12-08T00:00:00.000' AS DateTime), N'Delantero', 0, N'https://www.euro-soccer-cards.com/99317-home_default/raheem-sterling-england-eng20-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (57, 6, N'Amir', N'Abedzadeh', 22, CAST(N'1993-04-26T00:00:00.000' AS DateTime), N'Portero', 0, N'https://figuritasqatar.com.ar/wp-content/uploads/amir-abedzadeh.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (58, 6, N'Majid', N'Hosseini', 19, CAST(N'1996-06-20T00:00:00.000' AS DateTime), N'Defensor', 1, N'https://www.euro-soccer-cards.com/99323-home_default/majid-hosseini-iran-irn6-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (59, 6, N'Hossein', N'Kanaani', 13, CAST(N'1994-03-23T00:00:00.000' AS DateTime), N'Defensor', 1, N'https://www.euro-soccer-cards.com/99324-home_default/hossein-kanaani-iran-irn7-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (60, 6, N'Saman', N'Ghoddos', 14, CAST(N'1993-09-06T00:00:00.000' AS DateTime), N'Mediocentro', 0, N'https://www.euro-soccer-cards.com/99336-home_default/saman-ghoddos-iran-irn19-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (62, 6, N'Ahmad', N'Nourollahi', 21, CAST(N'1993-02-01T00:00:00.000' AS DateTime), N'Mediocentro', 0, N'https://www.euro-soccer-cards.com/99333-home_default/ahmad-nourollahi-iran-irn16-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (63, 6, N'Mehdi', N'Taremi', 9, CAST(N'1992-07-18T00:00:00.000' AS DateTime), N'Delantero', 0, N'https://www.euro-soccer-cards.com/99337-home_default/mehdi-taremi-iran-irn20-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (64, 6, N'Sardar', N'Azmoun', 20, CAST(N'1995-01-01T00:00:00.000' AS DateTime), N'Delantero', 0, N'https://www.euro-soccer-cards.com/99335-home_default/sardar-azmoun-iran-irn18-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (65, 7, N'Matt', N'Turner', 1, CAST(N'1994-06-24T00:00:00.000' AS DateTime), N'Portero', 0, N'https://www.euro-soccer-cards.com/99340-home_default/matt-turner-united-states-usa3-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (66, 7, N'Chris', N'Richards', 20, CAST(N'1997-12-31T00:00:00.000' AS DateTime), N'Defensor', 0, N'https://figuritasqatar.com.ar/wp-content/uploads/chris-richards.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (67, 7, N'Antonee', N'Robinson', 5, CAST(N'1997-08-08T00:00:00.000' AS DateTime), N'Defensor', 0, N'https://www.euro-soccer-cards.com/99345-home_default/antonee-robinson-united-states-usa8-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (68, 7, N'Brenden', N'Aaronson', 11, CAST(N'2000-10-22T00:00:00.000' AS DateTime), N'Mediocentro', 1, N'https://www.euro-soccer-cards.com/99348-home_default/brenden-aaronson-united-states-usa11-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (69, 7, N'Giovanni', N'Reyna', 7, CAST(N'2002-11-13T00:00:00.000' AS DateTime), N'Mediocentro', 0, N'https://www.euro-soccer-cards.com/99356-home_default/giovanni-reyna-united-states-usa19-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (71, 7, N'Christian', N'Pulisic', 10, CAST(N'1998-09-18T00:00:00.000' AS DateTime), N'Delantero', 0, N'https://www.euro-soccer-cards.com/99355-home_default/christian-pulisic-united-states-usa18-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (72, 7, N'Timothy', N'Weah', 24, CAST(N'2000-02-20T00:00:00.000' AS DateTime), N'Delantero', 0, N'https://figuritasqatar.com.ar/wp-content/uploads/timothy-weah.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (73, 8, N'Danny', N'Ward', 12, CAST(N'1993-06-22T00:00:00.000' AS DateTime), N'Portero', 0, N'https://www.euro-soccer-cards.com/99360-home_default/danny-ward-wales-wal3-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (74, 8, N'Ben', N'Davies', 4, CAST(N'1993-04-24T00:00:00.000' AS DateTime), N'Defensor', 0, N'https://www.euro-soccer-cards.com/99363-home_default/ben-davies-wales-wal6-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (75, 8, N'Neco', N'Williams', 3, CAST(N'2001-04-13T00:00:00.000' AS DateTime), N'Defensor', 0, N'https://www.euro-soccer-cards.com/99368-home_default/neco-williams-wales-wal11-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (76, 8, N'Harry', N'Wilson', 25, CAST(N'2002-04-27T00:00:00.000' AS DateTime), N'Mediocentro', 1, N'https://figuritasqatar.com.ar/wp-content/uploads/harry-wilson.png', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (77, 8, N'Aaron', N'Ramsey', 10, CAST(N'1990-12-26T00:00:00.000' AS DateTime), N'Mediocentro', 0, N'https://www.euro-soccer-cards.com/99371-home_default/aaron-ramsey-wales-wal14-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (78, 8, N'Brennan', N'Johnson', 9, CAST(N'2001-05-23T00:00:00.000' AS DateTime), N'Delantero', 1, N'https://www.euro-soccer-cards.com/99376-home_default/brennan-johnson-wales-wal19-wc-qatar-2022.jpg', 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (79, 8, N'Harry', N'Wilson', 8, CAST(N'1997-03-22T00:00:00.000' AS DateTime), N'Delantero', 1, N'https://www.euro-soccer-cards.com/99373-home_default/harry-wilson-wales-wal16-wc-qatar-2022.jpg', 0)
SET IDENTITY_INSERT [dbo].[Jugador] OFF
GO
SET IDENTITY_INSERT [dbo].[Pais] ON 

INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (1, N'Qatar', N'QAT', N'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Qatar.svg/1920px-Flag_of_Qatar.svg.png')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (2, N'Ecuador', N'ECU', N'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Flag_of_Ecuador.svg/1920px-Flag_of_Ecuador.svg.png')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (3, N'Senegal', N'SEN', N'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Flag_of_Senegal.svg/1920px-Flag_of_Senegal.svg.png')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (4, N'Paises Bajos', N'NED', N'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/1920px-Flag_of_the_Netherlands.svg.png')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (5, N'Inglaterra', N'ENG', N'https://upload.wikimedia.org/wikipedia/commons/b/be/Flag_of_England.svg')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (6, N'Iran', N'IRN', N'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Flag_of_Iran.svg/1920px-Flag_of_Iran.svg.png')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (7, N'Estados Unidos', N'USA', N'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/1920px-Flag_of_the_United_States.svg.png')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (8, N'Gales', N'WAL', N'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Flag_of_Wales.svg/1920px-Flag_of_Wales.svg.png')
SET IDENTITY_INSERT [dbo].[Pais] OFF
GO
ALTER TABLE [dbo].[Jugador]  WITH CHECK ADD  CONSTRAINT [FK_Jugador_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Jugador] CHECK CONSTRAINT [FK_Jugador_Pais]
GO
ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_Estadio] FOREIGN KEY([IdEstadio])
REFERENCES [dbo].[Estadio] ([IdEstadio])
GO
ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_Estadio]
GO
ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_Pais] FOREIGN KEY([IdPais1])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_Pais]
GO
ALTER TABLE [dbo].[Partidos]  WITH CHECK ADD  CONSTRAINT [FK_Partidos_Pais1] FOREIGN KEY([IdPais2])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Partidos] CHECK CONSTRAINT [FK_Partidos_Pais1]
GO
USE [master]
GO
ALTER DATABASE [TP09] SET  READ_WRITE 
GO
