USE [master]
GO
/****** Object:  Database [TP09]    Script Date: 3/11/2022 09:04:00 ******/
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
/****** Object:  User [alumno]    Script Date: 3/11/2022 09:04:00 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Estadio]    Script Date: 3/11/2022 09:04:00 ******/
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
/****** Object:  Table [dbo].[Jugador]    Script Date: 3/11/2022 09:04:00 ******/
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
/****** Object:  Table [dbo].[Pais]    Script Date: 3/11/2022 09:04:00 ******/
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
/****** Object:  Table [dbo].[Partidos]    Script Date: 3/11/2022 09:04:00 ******/
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

INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (5, 1, N'Saad', N'Al-sheeb', 1, CAST(N'1990-02-19T00:00:00.000' AS DateTime), N'Portero', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (6, 1, N'Tarek', N'Salman', 5, CAST(N'1997-12-05T00:00:00.000' AS DateTime), N'Defensor', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (7, 1, N'Pedro', N'Miguel', 2, CAST(N'1990-08-06T00:00:00.000' AS DateTime), N'Defensor', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (9, 1, N'Abdulaziz', N'Hatem', 6, CAST(N'1990-10-28T00:00:00.000' AS DateTime), N'Mediocentro', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (10, 1, N'Mohammed', N'Waad', 4, CAST(N'1999-09-18T00:00:00.000' AS DateTime), N'Mediocentro', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (11, 1, N'Almoez', N'Ali', 19, CAST(N'1996-08-19T00:00:00.000' AS DateTime), N'Delantero', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (12, 1, N'Mohammed', N'Muntari', 9, CAST(N'1993-12-20T00:00:00.000' AS DateTime), N'Delantero', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (15, 2, N'Hernán', N'Galíndez
', 1, CAST(N'1987-03-30T00:00:00.000' AS DateTime), N'Portero', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (16, 2, N'Piero', N'Hincapié
', 3, CAST(N'2002-01-09T00:00:00.000' AS DateTime), N'Defensor', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (18, 2, N'William', N'Pacho', 24, CAST(N'2001-10-16T00:00:00.000' AS DateTime), N'Defensor', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (19, 2, N'Alan', N'Franco', 21, CAST(N'1998-08-21T00:00:00.000' AS DateTime), N'Mediocentro', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (20, 2, N'Romario', N'Ibarra', 10, CAST(N'1994-09-24T00:00:00.000' AS DateTime), N'Mediocentro', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (21, 2, N'Michael', N'Estrada', 11, CAST(N'1996-04-07T00:00:00.000' AS DateTime), N'Delantero', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (22, 2, N'Djorkaeff', N'Reasco', 9, CAST(N'1999-01-18T00:00:00.000' AS DateTime), N'Delantero', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (23, 3, N'Seny', N'Dieng
', 1, CAST(N'1994-11-23T00:00:00.000' AS DateTime), N'Portero', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (24, 3, N'Moussa', N'Niakhaté', 19, CAST(N'1996-03-08T00:00:00.000' AS DateTime), N'Defensor', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (25, 3, N'Formose', N'Mendy
', 2, CAST(N'2001-01-02T00:00:00.000' AS DateTime), N'Defensor', 0, NULL, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [Nombre], [Apellido], [NumeroCamiseta], [FechaNacimiento], [PosicionDeJuego], [Repetida], [imagenJugador], [Pegadas]) VALUES (26, 3, N'Pape Matar', N'Sarr
', 17, CAST(N'2002-09-14T00:00:00.000' AS DateTime), N'Mediocentro', 0, NULL, 0)
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
