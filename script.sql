USE [ASADA]
GO
ALTER TABLE [dbo].[Previstas] DROP CONSTRAINT [FK_Previstas_Tarifas]
GO
ALTER TABLE [dbo].[Previstas] DROP CONSTRAINT [FK_Previstas_Sectores]
GO
ALTER TABLE [dbo].[Previstas] DROP CONSTRAINT [FK_Previstas_Abonados]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 07/12/2017 20:46:49 ******/
DROP TABLE [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[Tarifas]    Script Date: 07/12/2017 20:46:49 ******/
DROP TABLE [dbo].[Tarifas]
GO
/****** Object:  Table [dbo].[Sectores]    Script Date: 07/12/2017 20:46:49 ******/
DROP TABLE [dbo].[Sectores]
GO
/****** Object:  Table [dbo].[Previstas]    Script Date: 07/12/2017 20:46:49 ******/
DROP TABLE [dbo].[Previstas]
GO
/****** Object:  Table [dbo].[Abonados]    Script Date: 07/12/2017 20:46:49 ******/
DROP TABLE [dbo].[Abonados]
GO
/****** Object:  User [UACA]    Script Date: 07/12/2017 20:46:49 ******/
DROP USER [UACA]
GO
USE [master]
GO
/****** Object:  Database [ASADA]    Script Date: 07/12/2017 20:46:49 ******/
DROP DATABASE [ASADA]
GO
/****** Object:  Database [ASADA]    Script Date: 07/12/2017 20:46:49 ******/
CREATE DATABASE [ASADA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASADA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ASADA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ASADA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ASADA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ASADA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASADA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASADA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASADA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASADA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASADA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASADA] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASADA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASADA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASADA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASADA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASADA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASADA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASADA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASADA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASADA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASADA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ASADA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASADA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASADA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASADA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASADA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASADA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASADA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASADA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ASADA] SET  MULTI_USER 
GO
ALTER DATABASE [ASADA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASADA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASADA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASADA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ASADA] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ASADA]
GO
/****** Object:  User [UACA]    Script Date: 07/12/2017 20:46:49 ******/
CREATE USER [UACA] FOR LOGIN [UACA] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [UACA]
GO
/****** Object:  Table [dbo].[Abonados]    Script Date: 07/12/2017 20:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abonados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[PrimerApellido] [nvarchar](50) NOT NULL,
	[SegundoApellido] [nvarchar](50) NOT NULL,
	[Cedula] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](50) NOT NULL,
	[Celular] [nvarchar](50) NULL,
	[Direccion] [nvarchar](225) NOT NULL,
	[Correo] [nvarchar](100) NULL,
	[NumeroAbonado] [nvarchar](100) NOT NULL,
	[Afiliado] [bit] NOT NULL,
 CONSTRAINT [PK_Abonados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Previstas]    Script Date: 07/12/2017 20:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Previstas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdAbonado] [int] NOT NULL,
	[IdTarifa] [int] NOT NULL,
	[IdSector] [int] NOT NULL,
	[Direccion] [nvarchar](225) NOT NULL,
	[FolioReal] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Previstas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sectores]    Script Date: 07/12/2017 20:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sectores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sectores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tarifas]    Script Date: 07/12/2017 20:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarifas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Precio] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_Tarifa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 07/12/2017 20:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Clave] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Abonados] ON 

INSERT [dbo].[Abonados] ([Id], [Nombre], [PrimerApellido], [SegundoApellido], [Cedula], [Telefono], [Celular], [Direccion], [Correo], [NumeroAbonado], [Afiliado]) VALUES (51, N'Maria', N'Angeles', N'Jarquin', N'34545466', N'9384043', N'67475757', N'Guapiles, guacimo.', N'mariaj@gmail.com', N'32423', 1)
INSERT [dbo].[Abonados] ([Id], [Nombre], [PrimerApellido], [SegundoApellido], [Cedula], [Telefono], [Celular], [Direccion], [Correo], [NumeroAbonado], [Afiliado]) VALUES (2050, N'Ana', N'Angeles', N'Torres', N'4-343-353', N'210-67-90', N'89904343', N'Victoria', N'maria@gmail.com', N'45465', 0)
INSERT [dbo].[Abonados] ([Id], [Nombre], [PrimerApellido], [SegundoApellido], [Cedula], [Telefono], [Celular], [Direccion], [Correo], [NumeroAbonado], [Afiliado]) VALUES (2051, N'Luis', N'Ramirez', N'Villalobos', N'3-3434-677', N'55454655', N'323432', N'Puerto viejo', N'luis12@gmail.com', N'55566', 0)
INSERT [dbo].[Abonados] ([Id], [Nombre], [PrimerApellido], [SegundoApellido], [Cedula], [Telefono], [Celular], [Direccion], [Correo], [NumeroAbonado], [Afiliado]) VALUES (3050, N'Kenneth', N'Bolivar', N'Castro', N'1-232-328', N'2710-56-90', N'97-88-00-12', N'Cariari', N'kbolivar@gmail.com', N'90233', 0)
SET IDENTITY_INSERT [dbo].[Abonados] OFF
SET IDENTITY_INSERT [dbo].[Previstas] ON 

INSERT [dbo].[Previstas] ([Id], [IdAbonado], [IdTarifa], [IdSector], [Direccion], [FolioReal]) VALUES (1031, 51, 40, 40, N'3434', N'23434')
INSERT [dbo].[Previstas] ([Id], [IdAbonado], [IdTarifa], [IdSector], [Direccion], [FolioReal]) VALUES (3026, 3050, 40, 40, N'rgdv', N'545')
INSERT [dbo].[Previstas] ([Id], [IdAbonado], [IdTarifa], [IdSector], [Direccion], [FolioReal]) VALUES (3027, 51, 2040, 43, N'454545', N'455454')
INSERT [dbo].[Previstas] ([Id], [IdAbonado], [IdTarifa], [IdSector], [Direccion], [FolioReal]) VALUES (3028, 51, 2040, 43, N'5544', N'8888')
INSERT [dbo].[Previstas] ([Id], [IdAbonado], [IdTarifa], [IdSector], [Direccion], [FolioReal]) VALUES (3029, 2050, 40, 42, N't7gyhujki9lop;-[''=]', N'445455')
INSERT [dbo].[Previstas] ([Id], [IdAbonado], [IdTarifa], [IdSector], [Direccion], [FolioReal]) VALUES (3030, 51, 40, 42, N'8uuj9iko0', N'6o;p''[]')
INSERT [dbo].[Previstas] ([Id], [IdAbonado], [IdTarifa], [IdSector], [Direccion], [FolioReal]) VALUES (3031, 51, 40, 42, N'fvgybhunjimko,l', N'hyujkilo;')
SET IDENTITY_INSERT [dbo].[Previstas] OFF
SET IDENTITY_INSERT [dbo].[Sectores] ON 

INSERT [dbo].[Sectores] ([Id], [Descripcion]) VALUES (40, N'Cubujuqui')
INSERT [dbo].[Sectores] ([Id], [Descripcion]) VALUES (41, N'Rambla')
INSERT [dbo].[Sectores] ([Id], [Descripcion]) VALUES (42, N'Horquetas')
INSERT [dbo].[Sectores] ([Id], [Descripcion]) VALUES (43, N'Victoria')
INSERT [dbo].[Sectores] ([Id], [Descripcion]) VALUES (2040, N'finca 10')
SET IDENTITY_INSERT [dbo].[Sectores] OFF
SET IDENTITY_INSERT [dbo].[Tarifas] ON 

INSERT [dbo].[Tarifas] ([Id], [Descripcion], [Precio]) VALUES (40, N'Comercial', CAST(5000.00 AS Numeric(18, 2)))
INSERT [dbo].[Tarifas] ([Id], [Descripcion], [Precio]) VALUES (1040, N'Industrial', CAST(7000.00 AS Numeric(18, 2)))
INSERT [dbo].[Tarifas] ([Id], [Descripcion], [Precio]) VALUES (2040, N'Residencial', CAST(3000.00 AS Numeric(18, 2)))
INSERT [dbo].[Tarifas] ([Id], [Descripcion], [Precio]) VALUES (2041, N'Gubernamental', CAST(10000.00 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[Tarifas] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Nombre], [Clave]) VALUES (1, N'kbolivar', N'e201994dca9320fc94336603b1cfc970')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Clave]) VALUES (17, N'oandres', N'e201994dca9320fc94336603b1cfc970')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Previstas]  WITH CHECK ADD  CONSTRAINT [FK_Previstas_Abonados] FOREIGN KEY([IdAbonado])
REFERENCES [dbo].[Abonados] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Previstas] CHECK CONSTRAINT [FK_Previstas_Abonados]
GO
ALTER TABLE [dbo].[Previstas]  WITH CHECK ADD  CONSTRAINT [FK_Previstas_Sectores] FOREIGN KEY([IdSector])
REFERENCES [dbo].[Sectores] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Previstas] CHECK CONSTRAINT [FK_Previstas_Sectores]
GO
ALTER TABLE [dbo].[Previstas]  WITH CHECK ADD  CONSTRAINT [FK_Previstas_Tarifas] FOREIGN KEY([IdTarifa])
REFERENCES [dbo].[Tarifas] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Previstas] CHECK CONSTRAINT [FK_Previstas_Tarifas]
GO
USE [master]
GO
ALTER DATABASE [ASADA] SET  READ_WRITE 
GO
