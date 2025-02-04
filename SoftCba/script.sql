USE [master]
GO
/****** Object:  Database [SoftCba]    Script Date: 09/11/2020 2:20:23 ******/
CREATE DATABASE [SoftCba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SoftCba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SoftCba.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SoftCba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SoftCba_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SoftCba] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SoftCba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SoftCba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SoftCba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SoftCba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SoftCba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SoftCba] SET ARITHABORT OFF 
GO
ALTER DATABASE [SoftCba] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SoftCba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SoftCba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SoftCba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SoftCba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SoftCba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SoftCba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SoftCba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SoftCba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SoftCba] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SoftCba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SoftCba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SoftCba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SoftCba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SoftCba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SoftCba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SoftCba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SoftCba] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SoftCba] SET  MULTI_USER 
GO
ALTER DATABASE [SoftCba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SoftCba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SoftCba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SoftCba] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SoftCba] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SoftCba] SET QUERY_STORE = OFF
GO
USE [SoftCba]
GO
/****** Object:  User [maxi]    Script Date: 09/11/2020 2:20:24 ******/
CREATE USER [maxi] FOR LOGIN [maxi] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 09/11/2020 2:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[idAlumno] [int] IDENTITY(1,1) NOT NULL,
	[legajo] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[fechaNac] [date] NOT NULL,
	[idBarrio] [int] NOT NULL,
	[calle] [varchar](50) NOT NULL,
	[numero] [int] NOT NULL,
	[telefono] [bigint] NULL,
	[correo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Alumnos] PRIMARY KEY CLUSTERED 
(
	[idAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Barrios]    Script Date: 09/11/2020 2:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barrios](
	[idBarrio] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Barrios] PRIMARY KEY CLUSTERED 
(
	[idBarrio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 09/11/2020 2:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[idCurso] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[duracion] [int] NOT NULL,
	[idMateria] [int] NOT NULL,
 CONSTRAINT [PK_Cursos] PRIMARY KEY CLUSTERED 
(
	[idCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Examenes]    Script Date: 09/11/2020 2:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Examenes](
	[idExamen] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[idMateria] [int] NOT NULL,
	[idTipoExamen] [int] NOT NULL,
	[idAlumno] [int] NOT NULL,
 CONSTRAINT [PK_Examenes] PRIMARY KEY CLUSTERED 
(
	[idExamen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inscripciones]    Script Date: 09/11/2020 2:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripciones](
	[idInscripcion] [int] IDENTITY(1,1) NOT NULL,
	[idCurso] [int] NOT NULL,
	[idAlumno] [int] NOT NULL,
	[descuento] [real] NOT NULL,
	[monto] [real] NOT NULL,
 CONSTRAINT [PK_InscripcionCursadas] PRIMARY KEY CLUSTERED 
(
	[idInscripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias]    Script Date: 09/11/2020 2:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias](
	[idMateria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Materias] PRIMARY KEY CLUSTERED 
(
	[idMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programas]    Script Date: 09/11/2020 2:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programas](
	[idPrograma] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[cantDescargas] [int] NOT NULL,
	[estaHabilitado] [bit] NOT NULL,
	[idAlumno] [int] NOT NULL,
	[programa] [binary](8000) NULL,
 CONSTRAINT [PK_Programas] PRIMARY KEY CLUSTERED 
(
	[idPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 09/11/2020 2:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[contrasenia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumnos] ON 

INSERT [dbo].[Alumnos] ([idAlumno], [legajo], [nombre], [apellido], [fechaNac], [idBarrio], [calle], [numero], [telefono], [correo]) VALUES (1, 111086, N'Maximiliano', N'Raza', CAST(N'1998-12-24' AS Date), 1, N'Cassaffousth', 478, 3548465644, N'maxiraza24@gmail.com')
INSERT [dbo].[Alumnos] ([idAlumno], [legajo], [nombre], [apellido], [fechaNac], [idBarrio], [calle], [numero], [telefono], [correo]) VALUES (2, 123456, N'Facundo', N'Ellauri', CAST(N'1999-04-22' AS Date), 8, N'Jose Matias Zapiola', 446, 351455667, N'facuellauri@gmail.com')
INSERT [dbo].[Alumnos] ([idAlumno], [legajo], [nombre], [apellido], [fechaNac], [idBarrio], [calle], [numero], [telefono], [correo]) VALUES (14, 111222, N'Juan', N'Varela', CAST(N'2000-06-15' AS Date), 3, N'Belgrano', 235, 3548674568, N'juansa@gmail.com')
INSERT [dbo].[Alumnos] ([idAlumno], [legajo], [nombre], [apellido], [fechaNac], [idBarrio], [calle], [numero], [telefono], [correo]) VALUES (15, 132554, N'Maria', N'Lopez', CAST(N'1995-08-09' AS Date), 5, N'Crisol', 200, 3547986754, N'mari@hotmail.com')
INSERT [dbo].[Alumnos] ([idAlumno], [legajo], [nombre], [apellido], [fechaNac], [idBarrio], [calle], [numero], [telefono], [correo]) VALUES (16, 155342, N'Sofia', N'Perez', CAST(N'2001-12-05' AS Date), 6, N'Suquia', 246, 3547569436, N'soof@Outlook.com')
INSERT [dbo].[Alumnos] ([idAlumno], [legajo], [nombre], [apellido], [fechaNac], [idBarrio], [calle], [numero], [telefono], [correo]) VALUES (17, 454241, N'Micaela', N'Rodriguez', CAST(N'1994-11-09' AS Date), 10, N'Libertador', 107, 3456870345, N'facu23@gmail.com')
INSERT [dbo].[Alumnos] ([idAlumno], [legajo], [nombre], [apellido], [fechaNac], [idBarrio], [calle], [numero], [telefono], [correo]) VALUES (18, 745643, N'Mateo', N'Di Carlo', CAST(N'2005-11-13' AS Date), 4, N'CaÃ?Â±ada', 980, 3768564534, N'tomate@gmail.com')
INSERT [dbo].[Alumnos] ([idAlumno], [legajo], [nombre], [apellido], [fechaNac], [idBarrio], [calle], [numero], [telefono], [correo]) VALUES (19, 234534, N'Jose', N'Gomez', CAST(N'1992-10-08' AS Date), 9, N'Celman', 76, 3546873546, N'losandes.93@hotmail.com')
SET IDENTITY_INSERT [dbo].[Alumnos] OFF
GO
SET IDENTITY_INSERT [dbo].[Barrios] ON 

INSERT [dbo].[Barrios] ([idBarrio], [descripcion]) VALUES (1, N'Parque Jardin')
INSERT [dbo].[Barrios] ([idBarrio], [descripcion]) VALUES (3, N'Villa Libertador')
INSERT [dbo].[Barrios] ([idBarrio], [descripcion]) VALUES (4, N'Dominador')
INSERT [dbo].[Barrios] ([idBarrio], [descripcion]) VALUES (5, N'La Boca')
INSERT [dbo].[Barrios] ([idBarrio], [descripcion]) VALUES (6, N'San Martin')
INSERT [dbo].[Barrios] ([idBarrio], [descripcion]) VALUES (7, N'Siquiman')
INSERT [dbo].[Barrios] ([idBarrio], [descripcion]) VALUES (8, N'Eden')
INSERT [dbo].[Barrios] ([idBarrio], [descripcion]) VALUES (9, N'Sarmiento')
INSERT [dbo].[Barrios] ([idBarrio], [descripcion]) VALUES (10, N'Los Andes')
SET IDENTITY_INSERT [dbo].[Barrios] OFF
GO
SET IDENTITY_INSERT [dbo].[Cursos] ON 

INSERT [dbo].[Cursos] ([idCurso], [nombre], [duracion], [idMateria]) VALUES (1, N'Robotica', 6, 1)
INSERT [dbo].[Cursos] ([idCurso], [nombre], [duracion], [idMateria]) VALUES (371, N'Mecatronica', 6, 3)
INSERT [dbo].[Cursos] ([idCurso], [nombre], [duracion], [idMateria]) VALUES (373, N'Inteligencia Artifical', 12, 5)
INSERT [dbo].[Cursos] ([idCurso], [nombre], [duracion], [idMateria]) VALUES (374, N'Logica Avanzada', 3, 4)
INSERT [dbo].[Cursos] ([idCurso], [nombre], [duracion], [idMateria]) VALUES (375, N'Asembler', 3, 3)
INSERT [dbo].[Cursos] ([idCurso], [nombre], [duracion], [idMateria]) VALUES (376, N'Java ', 12, 5)
INSERT [dbo].[Cursos] ([idCurso], [nombre], [duracion], [idMateria]) VALUES (377, N'Full-Stack', 34, 5)
INSERT [dbo].[Cursos] ([idCurso], [nombre], [duracion], [idMateria]) VALUES (378, N'Redes', 6, 7)
SET IDENTITY_INSERT [dbo].[Cursos] OFF
GO
SET IDENTITY_INSERT [dbo].[Examenes] ON 

INSERT [dbo].[Examenes] ([idExamen], [fecha], [hora], [idMateria], [idTipoExamen], [idAlumno]) VALUES (1, CAST(N'2020-12-01' AS Date), CAST(N'08:00:00' AS Time), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Examenes] OFF
GO
SET IDENTITY_INSERT [dbo].[Inscripciones] ON 

INSERT [dbo].[Inscripciones] ([idInscripcion], [idCurso], [idAlumno], [descuento], [monto]) VALUES (8, 375, 17, 1200, 6000)
INSERT [dbo].[Inscripciones] ([idInscripcion], [idCurso], [idAlumno], [descuento], [monto]) VALUES (9, 1, 18, 0, 5000)
INSERT [dbo].[Inscripciones] ([idInscripcion], [idCurso], [idAlumno], [descuento], [monto]) VALUES (10, 373, 16, 4000, 12000)
INSERT [dbo].[Inscripciones] ([idInscripcion], [idCurso], [idAlumno], [descuento], [monto]) VALUES (11, 374, 14, 0, 2500)
INSERT [dbo].[Inscripciones] ([idInscripcion], [idCurso], [idAlumno], [descuento], [monto]) VALUES (12, 376, 15, 450, 15000)
INSERT [dbo].[Inscripciones] ([idInscripcion], [idCurso], [idAlumno], [descuento], [monto]) VALUES (13, 376, 1, 6000, 12000)
INSERT [dbo].[Inscripciones] ([idInscripcion], [idCurso], [idAlumno], [descuento], [monto]) VALUES (14, 1, 2, 0, 4000)
SET IDENTITY_INSERT [dbo].[Inscripciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Materias] ON 

INSERT [dbo].[Materias] ([idMateria], [descripcion]) VALUES (1, N'Laboratorio')
INSERT [dbo].[Materias] ([idMateria], [descripcion]) VALUES (2, N'Base de Datos')
INSERT [dbo].[Materias] ([idMateria], [descripcion]) VALUES (3, N'Sistemas Operativos')
INSERT [dbo].[Materias] ([idMateria], [descripcion]) VALUES (4, N'Metodologia de Sistemas')
INSERT [dbo].[Materias] ([idMateria], [descripcion]) VALUES (5, N'Programacion')
INSERT [dbo].[Materias] ([idMateria], [descripcion]) VALUES (6, N'Electronica')
INSERT [dbo].[Materias] ([idMateria], [descripcion]) VALUES (7, N'Informatica')
INSERT [dbo].[Materias] ([idMateria], [descripcion]) VALUES (8, N'Fisica')
INSERT [dbo].[Materias] ([idMateria], [descripcion]) VALUES (9, N'Matematica')
INSERT [dbo].[Materias] ([idMateria], [descripcion]) VALUES (10, N'Ingles')
SET IDENTITY_INSERT [dbo].[Materias] OFF
GO
SET IDENTITY_INSERT [dbo].[Programas] ON 

INSERT [dbo].[Programas] ([idPrograma], [nombre], [cantDescargas], [estaHabilitado], [idAlumno], [programa]) VALUES (1, N'Compilador2.0', 50, 1, 1, NULL)
INSERT [dbo].[Programas] ([idPrograma], [nombre], [cantDescargas], [estaHabilitado], [idAlumno], [programa]) VALUES (2, N'Api BackEnd', 5, 1, 18, NULL)
INSERT [dbo].[Programas] ([idPrograma], [nombre], [cantDescargas], [estaHabilitado], [idAlumno], [programa]) VALUES (3, N'Debuguer', 11, 1, 14, NULL)
INSERT [dbo].[Programas] ([idPrograma], [nombre], [cantDescargas], [estaHabilitado], [idAlumno], [programa]) VALUES (4, N'IA_Machine', 3, 0, 15, NULL)
INSERT [dbo].[Programas] ([idPrograma], [nombre], [cantDescargas], [estaHabilitado], [idAlumno], [programa]) VALUES (5, N'NetBeansPro', 20, 1, 17, NULL)
INSERT [dbo].[Programas] ([idPrograma], [nombre], [cantDescargas], [estaHabilitado], [idAlumno], [programa]) VALUES (6, N'ABMC_Lab', 2, 0, 1, NULL)
INSERT [dbo].[Programas] ([idPrograma], [nombre], [cantDescargas], [estaHabilitado], [idAlumno], [programa]) VALUES (7, N'Transaciones', 3, 0, 17, NULL)
INSERT [dbo].[Programas] ([idPrograma], [nombre], [cantDescargas], [estaHabilitado], [idAlumno], [programa]) VALUES (8, N'AFA', 0, 0, 14, NULL)
INSERT [dbo].[Programas] ([idPrograma], [nombre], [cantDescargas], [estaHabilitado], [idAlumno], [programa]) VALUES (9, N'CBA_Covid', 4, 1, 16, NULL)
SET IDENTITY_INSERT [dbo].[Programas] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [usuario], [contrasenia]) VALUES (1, N'Maxi', N'1234')
INSERT [dbo].[Usuarios] ([idUsuario], [usuario], [contrasenia]) VALUES (2, N'Admin', N'1234')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Alumnos]  WITH CHECK ADD  CONSTRAINT [FK_Alumnos_Barrios] FOREIGN KEY([idBarrio])
REFERENCES [dbo].[Barrios] ([idBarrio])
GO
ALTER TABLE [dbo].[Alumnos] CHECK CONSTRAINT [FK_Alumnos_Barrios]
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_Materias] FOREIGN KEY([idMateria])
REFERENCES [dbo].[Materias] ([idMateria])
GO
ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Cursos_Materias]
GO
ALTER TABLE [dbo].[Examenes]  WITH CHECK ADD  CONSTRAINT [FK_Examenes_Alumnos] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumnos] ([idAlumno])
GO
ALTER TABLE [dbo].[Examenes] CHECK CONSTRAINT [FK_Examenes_Alumnos]
GO
ALTER TABLE [dbo].[Examenes]  WITH CHECK ADD  CONSTRAINT [FK_Examenes_Materias] FOREIGN KEY([idMateria])
REFERENCES [dbo].[Materias] ([idMateria])
GO
ALTER TABLE [dbo].[Examenes] CHECK CONSTRAINT [FK_Examenes_Materias]
GO
ALTER TABLE [dbo].[Inscripciones]  WITH CHECK ADD  CONSTRAINT [FK_InscripcionCursadas_Alumnos] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumnos] ([idAlumno])
GO
ALTER TABLE [dbo].[Inscripciones] CHECK CONSTRAINT [FK_InscripcionCursadas_Alumnos]
GO
ALTER TABLE [dbo].[Inscripciones]  WITH CHECK ADD  CONSTRAINT [FK_InscripcionCursadas_Cursos] FOREIGN KEY([idCurso])
REFERENCES [dbo].[Cursos] ([idCurso])
GO
ALTER TABLE [dbo].[Inscripciones] CHECK CONSTRAINT [FK_InscripcionCursadas_Cursos]
GO
ALTER TABLE [dbo].[Programas]  WITH CHECK ADD  CONSTRAINT [FK_Programas_Alumnos] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumnos] ([idAlumno])
GO
ALTER TABLE [dbo].[Programas] CHECK CONSTRAINT [FK_Programas_Alumnos]
GO
USE [master]
GO
ALTER DATABASE [SoftCba] SET  READ_WRITE 
GO
