USE [master]
GO
/****** Object:  Database [SQL_BanhNgot]    Script Date: 08/12/2020 19:56:12 ******/
CREATE DATABASE [SQL_BanhNgot] ON  PRIMARY 
( NAME = N'SQL_BanhNgot', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\SQL_BanhNgot.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SQL_BanhNgot_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\SQL_BanhNgot_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SQL_BanhNgot] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQL_BanhNgot].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SQL_BanhNgot] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET ARITHABORT OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SQL_BanhNgot] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SQL_BanhNgot] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SQL_BanhNgot] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET  DISABLE_BROKER
GO
ALTER DATABASE [SQL_BanhNgot] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SQL_BanhNgot] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SQL_BanhNgot] SET  READ_WRITE
GO
ALTER DATABASE [SQL_BanhNgot] SET RECOVERY FULL
GO
ALTER DATABASE [SQL_BanhNgot] SET  MULTI_USER
GO
ALTER DATABASE [SQL_BanhNgot] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SQL_BanhNgot] SET DB_CHAINING OFF
GO
USE [SQL_BanhNgot]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 08/12/2020 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[maDG] [int] IDENTITY(1,1) NOT NULL,
	[maSP] [nvarchar](50) NULL,
	[danhGia] [nvarchar](50) NULL,
	[ngayDG] [date] NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_DanhGia1] PRIMARY KEY CLUSTERED 
(
	[maDG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DanhGia] ON
INSERT [dbo].[DanhGia] ([maDG], [maSP], [danhGia], [ngayDG], [email]) VALUES (1, N'SP001', N'a', CAST(0x63410B00 AS Date), N'a@gmail.com')
INSERT [dbo].[DanhGia] ([maDG], [maSP], [danhGia], [ngayDG], [email]) VALUES (5, N'SP0010', N'Tốt', NULL, N'divhnpc00103@fpt.edu.vn')
INSERT [dbo].[DanhGia] ([maDG], [maSP], [danhGia], [ngayDG], [email]) VALUES (40, N'SP0015', N'verry goode', NULL, N'vhndts111@gmail.com')
INSERT [dbo].[DanhGia] ([maDG], [maSP], [danhGia], [ngayDG], [email]) VALUES (56, N'SP0011', N'tốt', NULL, N'vhndts111@gmail.com')
SET IDENTITY_INSERT [dbo].[DanhGia] OFF
/****** Object:  Table [dbo].[CuaHang]    Script Date: 08/12/2020 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuaHang](
	[maCH] [nvarchar](50) NOT NULL,
	[tenCH] [nvarchar](50) NULL,
	[diaChi] [nvarchar](50) NULL,
	[tinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_CuaHang] PRIMARY KEY CLUSTERED 
(
	[maCH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CuaHang] ([maCH], [tenCH], [diaChi], [tinhTrang]) VALUES (N'CH001', N'Tiệm Bánh Thu', N'37C Võ Văn Tần', N'Còn hàng')
INSERT [dbo].[CuaHang] ([maCH], [tenCH], [diaChi], [tinhTrang]) VALUES (N'CH002', N'Tiệm Bánh tháng 12', N'80 Lý Tự Trọng', N'Hết hàng')
INSERT [dbo].[CuaHang] ([maCH], [tenCH], [diaChi], [tinhTrang]) VALUES (N'CH003', N'Tiêm Bánh Mì Sài Gòn', N'158 Mậu Thân', N'Còn hàng')
INSERT [dbo].[CuaHang] ([maCH], [tenCH], [diaChi], [tinhTrang]) VALUES (N'CH004', N'Tiệm bánh mì đức phát', N'27 Nguyễn Trãi', N'Hết hàng')
/****** Object:  Table [dbo].[NhomND]    Script Date: 08/12/2020 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomND](
	[maND] [nvarchar](50) NOT NULL,
	[tenND] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhomND] PRIMARY KEY CLUSTERED 
(
	[maND] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[NhomND] ([maND], [tenND]) VALUES (N'ND001', N'Admin')
INSERT [dbo].[NhomND] ([maND], [tenND]) VALUES (N'ND002', N'Giám đốc')
/****** Object:  Table [dbo].[SanPham]    Script Date: 08/12/2020 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSP] [nvarchar](50) NOT NULL,
	[maCH] [nvarchar](50) NULL,
	[tenSP] [nvarchar](50) NULL,
	[donGia] [float] NULL,
	[soLuong] [int] NULL,
	[hinhAnh] [nvarchar](50) NULL,
	[diaChi] [nvarchar](50) NULL,
	[NSX] [date] NULL,
	[HSD] [date] NULL,
	[bangTin] [nvarchar](200) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[maSP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP001', N'CH001', N'Bánh kem', 120, 100, N'ban kem socola trai cay.jpg', N'37C Võ Văn Tần', CAST(0x56410B00 AS Date), CAST(0x5A410B00 AS Date), N'Bánh kem là một loại bánh được làm từ các nguyên liệu cơ bản bao gồm kem, đường, bột mì, trứng.')
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP0010', N'CH003', N'Bánh Su Kem', 50, 100, N'Chesse-Cake-2.jpeg', N'37C Võ Văn Tần', CAST(0x5C410B00 AS Date), CAST(0x61410B00 AS Date), N'Bánh su kem là món bánh được nhiều người ưa thích bởi vẻ ngoài nhỏ xinh, hương vị thơm ngon, béo ngậy và ngọt mát.')
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP0011', N'CH003', N'Macaron', 30, 100, N'Pavlova.jpg', N'158 Mậu Thân', CAST(0x5D410B00 AS Date), CAST(0x62410B00 AS Date), N'Đây là một loại bánh ngọt của Pháp, bánh được làm từ lòng trắng trứng, đường bột, đường cát, bột hạnh nhân và một ít phẩm màu tự nhiên.')
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP0012', N'CH003', N'Le Castella', 50, 40, N'leCastella', N'27 Nguyễn Trãi', CAST(0x5E410B00 AS Date), CAST(0x63410B00 AS Date), N'Bánh Le Castella là một loại bánh dạng sponge cake – bánh bông xốp mềm')
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP0013', N'CH004', N'Bánh Kem', 50, 140, N'banhkem', N'80 Lý Tự Trọng', CAST(0x5F410B00 AS Date), CAST(0x65410B00 AS Date), N'Bánh kem là một loại bánh được làm từ các nguyên liệu cơ bản bao gồm kem, đường, bột mì, trứng.')
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP0014', N'CH004', N'Bánh Su Kem', 20, 50, N'banhsukem', N'27 Nguyễn Trãi', CAST(0x60410B00 AS Date), CAST(0x66410B00 AS Date), N'Bánh su kem là món bánh được nhiều người ưa thích bởi vẻ ngoài nhỏ xinh, hương vị thơm ngon, béo ngậy và ngọt mát.')
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP0015', N'CH004', N'Bánh Su Kem', 20, 50, N'banhsukem', N'27 Nguyễn Trãi', CAST(0x60410B00 AS Date), CAST(0x66410B00 AS Date), N'Bánh su kem là món bánh được nhiều người ưa thích bởi vẻ ngoài nhỏ xinh, hương vị thơm ngon, béo ngậy và ngọt mát.')
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP0016', N'CH001', N'A', 3, 3, N'ban kem socola trai cay.jpg', NULL, CAST(0x6C410B00 AS Date), CAST(0x6C410B00 AS Date), NULL)
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP002', N'CH001', N'Bánh su kem', 20, 30, N'banhsukem', N'27 Nguyễn Trãi', CAST(0x56410B00 AS Date), CAST(0x59410B00 AS Date), N'Bánh su kem là món bánh được nhiều người ưa thích bởi vẻ ngoài nhỏ xinh, hương vị thơm ngon, béo ngậy và ngọt mát.')
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP003', N'CH001', N'Macaron', 20, 20, N'macaron', N'158 Mậu Thân', CAST(0x56410B00 AS Date), CAST(0x5A410B00 AS Date), N'Đây là một loại bánh ngọt của Pháp, bánh được làm từ lòng trắng trứng, đường bột, đường cát, bột hạnh nhân và một ít phẩm màu tự nhiên.')
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP004', N'CH001', N'Le Castella', 120, 50, N'leCastella', N'80 Lý Tự Trọng', CAST(0x57410B00 AS Date), CAST(0x5B410B00 AS Date), N'Bánh Le Castella là một loại bánh dạng sponge cake – bánh bông xốp mềm')
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP005', N'CH002', N'Bánh kem', 20, 50, N'banhkem', N'80 Lý Tự Trọng', CAST(0x56410B00 AS Date), CAST(0x5C410B00 AS Date), N'Bánh kem là một loại bánh được làm từ các nguyên liệu cơ bản bao gồm kem, đường, bột mì, trứng.')
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP006', N'CH002', N'Bánh su kem', 20, 50, N'banhsukem', N'27 Nguyễn Trãi', CAST(0x57410B00 AS Date), CAST(0x63410B00 AS Date), N'Bánh su kem là món bánh được nhiều người ưa thích bởi vẻ ngoài nhỏ xinh, hương vị thơm ngon, béo ngậy và ngọt mát.')
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP007', N'CH002', N'Macaron', 35, 50, N'macaron', N'37C Võ Văn Tần', CAST(0x59410B00 AS Date), CAST(0x62410B00 AS Date), N'Đây là một loại bánh ngọt của Pháp, bánh được làm từ lòng trắng trứng, đường bột, đường cát, bột hạnh nhân và một ít phẩm màu tự nhiên.')
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP008', N'CH002', N'Le Castella', 45, 50, N'leCastella', N'80 Lý Tự Trọng', CAST(0x5A410B00 AS Date), CAST(0x61410B00 AS Date), N'Bánh Le Castella là một loại bánh dạng sponge cake – bánh bông xốp mềm')
INSERT [dbo].[SanPham] ([maSP], [maCH], [tenSP], [donGia], [soLuong], [hinhAnh], [diaChi], [NSX], [HSD], [bangTin]) VALUES (N'SP009', N'CH003', N'Bánh Kem', 50, 150, N'banhkem', N'158 Mậu Thân', CAST(0x5B410B00 AS Date), CAST(0x63410B00 AS Date), N'Bánh kem là một loại bánh được làm từ các nguyên liệu cơ bản bao gồm kem, đường, bột mì, trứng.')
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 08/12/2020 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[maND] [nvarchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[NguoiDung] ([username], [password], [maND]) VALUES (N'Admin', N'admin', N'ND001')
INSERT [dbo].[NguoiDung] ([username], [password], [maND]) VALUES (N'Giamdoc', N'giamdoc', N'ND002')
/****** Object:  ForeignKey [FK_SanPham_CuaHang]    Script Date: 08/12/2020 19:56:13 ******/
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_CuaHang] FOREIGN KEY([maCH])
REFERENCES [dbo].[CuaHang] ([maCH])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_CuaHang]
GO
/****** Object:  ForeignKey [FK_NguoiDung_NhomND]    Script Date: 08/12/2020 19:56:13 ******/
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_NhomND] FOREIGN KEY([maND])
REFERENCES [dbo].[NhomND] ([maND])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_NhomND]
GO
