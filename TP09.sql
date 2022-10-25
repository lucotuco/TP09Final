USE [master]
GO
/****** Object:  Database [TP09]    Script Date: 25/10/2022 11:48:48 ******/
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
/****** Object:  User [alumno]    Script Date: 25/10/2022 11:48:48 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Estadio]    Script Date: 25/10/2022 11:48:48 ******/
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
/****** Object:  Table [dbo].[Jugador]    Script Date: 25/10/2022 11:48:48 ******/
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
	[imagenJugador] [varchar](50) NULL,
	[Pegadas] [bit] NOT NULL,
 CONSTRAINT [PK_Jugador] PRIMARY KEY CLUSTERED 
(
	[IdJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 25/10/2022 11:48:48 ******/
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
/****** Object:  Table [dbo].[Partidos]    Script Date: 25/10/2022 11:48:48 ******/
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
SET IDENTITY_INSERT [dbo].[Pais] ON 

INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (1, N'Qatar', N'QAT', N'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Qatar.svg/1920px-Flag_of_Qatar.svg.png')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (2, N'Ecuador', N'ECU', N'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Flag_of_Ecuador.svg/1920px-Flag_of_Ecuador.svg.png')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (3, N'Senegal', N'SEN', N'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Flag_of_Senegal.svg/1920px-Flag_of_Senegal.svg.png')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (4, N'Paises Bajos', N'NED', N'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/1920px-Flag_of_the_Netherlands.svg.png')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (5, N'Inglaterra', N'ENG', N'https://upload.wikimedia.org/wikipedia/commons/b/be/Flag_of_England.svg')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (6, N'Iran', N'IRN', N'https://commons.wikimedia.org/wiki/File:Flag_of_Iran.svg')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (7, N'Estados Unidos', N'USA', N'https://commons.wikimedia.org/wiki/File:Flag_of_the_United_States.svg')
INSERT [dbo].[Pais] ([IdPais], [Nombre], [abreviación], [bandera]) VALUES (8, N'Gales', N'WAL', N'https://commons.wikimedia.org/wiki/File:Flag_of_Wales.svg')
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
