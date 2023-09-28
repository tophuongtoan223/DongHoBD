USE [Project_LTW]
GO
/****** Object:  Table [dbo].[ADMINNHO]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMINNHO](
	[ID] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Email] [nchar](50) NULL,
	[Password] [nchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[Quyen] [int] NULL,
	[SoDienThoai] [nchar](10) NULL,
 CONSTRAINT [PK_ADMINNHO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[MaHD] [int] NOT NULL,
	[NgayDat] [datetime] NULL,
	[TinhTrangDonHang] [nvarchar](50) NULL,
	[MaDongHo] [varchar](50) NOT NULL,
	[TenDongHo] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [nchar](10) NULL,
	[MaKH] [int] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaDongHo] ASC,
	[TenDongHo] ASC,
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETDONHANG]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONHANG](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaDongHo] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CHITIETDONHANG_1] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaDongHo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DangKi]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangKi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nchar](50) NULL,
	[Password] [nchar](50) NULL,
	[Diachi] [nvarchar](50) NULL,
	[Ngaysinh] [datetime] NULL,
	[Sodienthoai] [varchar](10) NULL,
	[Taikhoan] [nvarchar](50) NULL,
 CONSTRAINT [PK_DangKi_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DkiKhachHang]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DkiKhachHang](
	[HoTen] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [varchar](50) NULL,
	[NgaySinh] [smalldatetime] NULL,
	[QuocTich] [nvarchar](50) NULL,
	[MaKH] [int] NOT NULL,
 CONSTRAINT [PK_DkiKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[DaThanhToan] [bit] NULL,
	[TinhTrangGiaoHang] [int] NULL,
	[NgayDat] [smalldatetime] NULL,
	[NgayGiao] [smalldatetime] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DONDATHANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DongHo]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DongHo](
	[MaDongHo] [int] IDENTITY(1,1) NOT NULL,
	[TenDongHo] [nvarchar](50) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[NgaySanXuat] [datetime] NULL,
	[GiamGia] [decimal](18, 0) NULL,
	[SoLuong] [int] NULL,
	[NgayCapNhat] [datetime] NULL,
	[AnhBia] [varchar](50) NULL,
	[MaLoai] [int] NULL,
	[MoTa] [nvarchar](500) NULL,
	[SoLuongBan] [int] NULL,
 CONSTRAINT [PK_DongHo_1] PRIMARY KEY CLUSTERED 
(
	[MaDongHo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DongHoRoLex]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DongHoRoLex](
	[MaDongHo] [varchar](50) NOT NULL,
	[TenDongHo] [nvarchar](50) NULL,
	[GiaBan] [int] NULL,
	[NgaySanXuat] [datetime] NULL,
	[NgayNhapKho] [datetime] NULL,
	[SoLuong] [nchar](10) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[AnhBia] [varchar](50) NULL,
 CONSTRAINT [PK_DongHoRoLex] PRIMARY KEY CLUSTERED 
(
	[MaDongHo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gioithieusanpham]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gioithieusanpham](
	[MaBaiViet] [int] NOT NULL,
	[TenDongHo] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](50) NULL,
	[image] [image] NULL,
 CONSTRAINT [PK_Gioithieusanpham_1] PRIMARY KEY CLUSTERED 
(
	[TenDongHo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHangLogin]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHangLogin](
	[UserName] [nvarchar](50) NULL,
	[Password] [varchar](50) NULL,
	[ConfirmPassword] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[PhoneNumber] [varchar](11) NULL,
	[Address] [nvarchar](50) NULL,
	[Birthday] [smalldatetime] NULL,
	[Nationality] [nvarchar](50) NULL,
	[MaKH] [int] NOT NULL,
	[TaiKhoan] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHangLogin] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHangs]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHangs](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Gender] [int] NULL,
	[Type] [int] NULL,
	[ImageURL] [image] NULL,
 CONSTRAINT [PK_KhachHangs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanLoai]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanLoai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[DisplayOrder] [int] NULL,
 CONSTRAINT [PK_PhanLoai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Quyen] [int] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoDienThoai] [decimal](18, 0) NULL,
	[Email] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhToanSP]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhToanSP](
	[MaDongHo] [varchar](50) NOT NULL,
	[TenDongHo] [nvarchar](50) NOT NULL,
	[SanPham] [nvarchar](50) NOT NULL,
	[Quantity] [int] NULL,
	[Price] [int] NULL,
	[Total] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThanhToanSP] PRIMARY KEY CLUSTERED 
(
	[MaDongHo] ASC,
	[TenDongHo] ASC,
	[SanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinhTrangHang]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrangHang](
	[MaDongHo] [varchar](50) NOT NULL,
	[TenDongHo] [nvarchar](50) NOT NULL,
	[NgayGiao] [datetime] NULL,
	[TinhTrangGiaoHang] [nvarchar](50) NULL,
	[MaHD] [int] NOT NULL,
	[SoLuong] [nchar](10) NULL,
	[ThanhTien] [nchar](10) NULL,
	[MaKH] [int] NOT NULL,
	[NgayDat] [datetime] NULL,
	[DaThanhToan] [nvarchar](50) NULL,
 CONSTRAINT [PK_TinhTrangHang_1] PRIMARY KEY CLUSTERED 
(
	[TenDongHo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 9/28/2023 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTin] [int] NOT NULL,
	[TieuDe] [nvarchar](50) NULL,
	[NoiDung] [nvarchar](150) NULL,
	[NguoiDang] [nvarchar](50) NULL,
	[NgayDang] [smalldatetime] NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[MaTin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ADMINNHO] ([ID], [UserName], [Email], [Password], [DiaChi], [NgaySinh], [Quyen], [SoDienThoai]) VALUES (1, N'TPT', N'0929212341                                        ', N'tontoncute                                        ', N'123456', CAST(N'1900-01-02T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[ADMINNHO] ([ID], [UserName], [Email], [Password], [DiaChi], [NgaySinh], [Quyen], [SoDienThoai]) VALUES (2, N'NHP', N'0929212345                                        ', N'phucphuccute                                      ', N'123456', CAST(N'1900-01-02T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[CHITIETDONHANG] ON 
GO
INSERT [dbo].[CHITIETDONHANG] ([MaHD], [MaDongHo], [SoLuong], [ThanhTien]) VALUES (1, 1818589258, 1, CAST(5000000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONHANG] ([MaHD], [MaDongHo], [SoLuong], [ThanhTien]) VALUES (2, 1818589264, 1, CAST(7500000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONHANG] ([MaHD], [MaDongHo], [SoLuong], [ThanhTien]) VALUES (3, 1818589264, 1, CAST(7500000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONHANG] ([MaHD], [MaDongHo], [SoLuong], [ThanhTien]) VALUES (1002, 1818589265, 2, CAST(15000000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONHANG] ([MaHD], [MaDongHo], [SoLuong], [ThanhTien]) VALUES (1003, 1818589249, 1, CAST(5000000000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[CHITIETDONHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[DangKi] ON 
GO
INSERT [dbo].[DangKi] ([ID], [UserName], [Email], [Password], [Diachi], [Ngaysinh], [Sodienthoai], [Taikhoan]) VALUES (1, N'LEH', N'toantito223@gmail.com                             ', N'1111                                              ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DangKi] ([ID], [UserName], [Email], [Password], [Diachi], [Ngaysinh], [Sodienthoai], [Taikhoan]) VALUES (2, N'NHP', N'hongphuc@gmail.com                                ', N'123                                               ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DangKi] ([ID], [UserName], [Email], [Password], [Diachi], [Ngaysinh], [Sodienthoai], [Taikhoan]) VALUES (3, N'TPT', N'toantito223@gmail.com                             ', N'123                                               ', NULL, NULL, NULL, N'Tô Phương Toàn')
GO
SET IDENTITY_INSERT [dbo].[DangKi] OFF
GO
INSERT [dbo].[DkiKhachHang] ([HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh], [QuocTich], [MaKH]) VALUES (N'Tô Phương Toàn', N'tonton', N'123', N'tonton@gmail.com', N'Bình Dương', N'0123456', CAST(N'2002-05-14T00:00:00' AS SmallDateTime), NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (0, 0, 1, CAST(N'2022-11-22T22:36:00' AS SmallDateTime), CAST(N'2002-02-11T00:00:00' AS SmallDateTime), 3)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (1, 0, 1, CAST(N'2022-11-22T22:43:00' AS SmallDateTime), CAST(N'2002-02-11T00:00:00' AS SmallDateTime), 3)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (2, 0, 2, CAST(N'2022-11-22T22:47:00' AS SmallDateTime), CAST(N'2020-02-11T00:00:00' AS SmallDateTime), 3)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (3, 0, 1, CAST(N'2022-11-22T23:08:00' AS SmallDateTime), CAST(N'2022-02-11T00:00:00' AS SmallDateTime), 3)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (4, 0, 1, CAST(N'2022-11-22T23:11:00' AS SmallDateTime), CAST(N'2012-02-11T00:00:00' AS SmallDateTime), 3)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (1002, 0, 1, CAST(N'2023-06-30T10:19:00' AS SmallDateTime), CAST(N'2023-06-14T00:00:00' AS SmallDateTime), 3)
GO
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[DongHo] ON 
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1280267313, N'G-Sock GM-2100SS-1A', CAST(900000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-14T00:00:00.000' AS DateTime), N'/img/Samsung/GM-2100SS-1A.jpg', 1, N'Sản Phẩm : Tốt , Chất Lượng Cao , Phù Hợp Cho Các Bạn Trẻ Năng Động , Tự Tin Khoe Cá Tính ', 500)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1280267314, N'G-Sock GA-720-SC-3A', CAST(950000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-14T00:00:00.000' AS DateTime), N'/img/Samsung/GA-700SC-3A-333x400.jpg', 1, N'Sản Phẩm : Tốt , Chất Lượng Cao , Phù Hợp Cho Các Bạn Trẻ Năng Động , Tự Tin Khoe Cá Tính ', 400)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1330398552, N'G-Sock GA-B001G', CAST(950000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-14T00:00:00.000' AS DateTime), N'/img/Samsung/GA-B001-4A-333x400.jpg', 1, N'Sản Phẩm : Tốt , Chất Lượng Cao , Phù Hợp Cho Các Bạn Trẻ Năng Động , Tự Tin Khoe Cá Tính ', 455)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1412510003, N'G-Sock GA-B001G', CAST(950000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-14T00:00:00.000' AS DateTime), N'/img/Samsung/GA-B001G-1A-333x400.jpg', 1, N'Sản Phẩm : Tốt , Chất Lượng Cao , Phù Hợp Cho Các Bạn Trẻ Năng Động , Tự Tin Khoe Cá Tính ', 433)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589233, N'G-Sock GA-B001G-2A', CAST(750000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-14T00:00:00.000' AS DateTime), N'/img/Samsung/GA-B001G-2A-333x400.jpg', 1, N'Sản Phẩm : Tốt , Chất Lượng Cao , Phù Hợp Cho Các Bạn Trẻ Năng Động , Tự Tin Khoe Cá Tính ', 218)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589234, N'Casio 23MTP-E350BL', CAST(500000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-14T00:00:00.000' AS DateTime), N'/img/Samsung/Casio23MTP-E350BL-1BV-333x400.jpg', 2, N'Sản Phẩm : Tốt , Chất Lượng Cao , Phù Hợp Cho Các Bạn Trẻ Năng Động , Tự Tin Khoe Cá Tính ', 586)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589241, N'Casio 2MTP-E350B', CAST(500000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T07:33:01.293' AS DateTime), N'/img/Samsung/Casio2MTP-E350B-1BV-333x400.jpg', 2, N'Sản Phẩm : Tốt , Thời Thượng , Cá Tính', 700)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589242, N'Casio 3MTP-VD03B', CAST(500000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T07:38:09.440' AS DateTime), N'/img/Samsung/Casio3MTP-VD03B-1A-333x400.jpg', 2, N'Sản Phẩm : Tốt , Thời Thượng , Cá Tính', 800)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589243, N'Casio 44MTP-VD03B', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T07:40:54.263' AS DateTime), N'/img/Samsung/Casio44MTP-VD03B-7A-333x400.jpg', 2, N'Sản Phẩm : Tốt , Thời Thượng , Cá Tính', 789)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589244, N'Casio MTP-VD03B-7A', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T07:42:52.517' AS DateTime), N'/img/Samsung/CasioMTP-E350B-1BV-333x400.jpg', 2, N'Sản Phẩm : Tốt , Thời Thượng , Cá Tính', 987)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589247, N'Samsung Galaxy Watch5', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:22:55.607' AS DateTime), N'/img/Samsung/samsung-galaxy-watch-5.jpg', 3, N'Sản Phẩm : Tốt , Trẻ Trung , Hiện Đại', 213)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589248, N'Samsung Galaxy Watch6', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:25:10.827' AS DateTime), N'/img/Samsung/samsung-galaxy-watch-55.jpg', 3, N'Sản Phẩm : Tốt , Trẻ Trung , Hiện Đại', 456)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589249, N'Samsung Galaxy Watch4', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:26:01.317' AS DateTime), N'/img/Samsung/samsunggalaxywatch4.jpg', 3, N'Sản Phẩm : Tốt , Trẻ Trung , Hiện Đại', 879)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589250, N'Samsung Galaxy Watch5 LTE', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:26:52.540' AS DateTime), N'/img/Samsung/samsunggalaxywatch5prolte.jpg', 3, N'Sản Phẩm : Tốt , Trẻ Trung , Hiện Đại', 258)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589251, N'Samsung Galaxy Watch15 LTE', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:30:09.070' AS DateTime), N'/img/Samsung/samsung.jpg', 3, N'Sản Phẩm : Tốt , Trẻ Trung , Hiện Đại', 369)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589252, N'Apple Watch S7 GPE', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:33:56.560' AS DateTime), N'/img/Tao/applewatchs7GPS.jpeg', 4, N'Sản Phẩm : Tốt , Đẳng Cấp , Hiện Đại', 147)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589253, N'Apple Watch S8', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:36:27.637' AS DateTime), N'/img/Tao/applewatchs8.jpeg', 4, N'Sản Phẩm : Tốt , Đẳng Cấp , Hiện Đại', 159)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589254, N'Apple Watch SE GPS', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:36:44.133' AS DateTime), N'/img/Tao/applewatchseGPS.jpeg', 4, N'Sản Phẩm : Tốt , Đẳng Cấp , Hiện Đại', 357)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589255, N'Apple Watch Ultra LTE', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:37:27.783' AS DateTime), N'/img/Tao/applewatchultraLTE.jpeg', 4, N'Sản Phẩm : Tốt , Đẳng Cấp , Hiện Đại', 655)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589256, N'Apple Watch Ultra Aplies', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:38:43.940' AS DateTime), N'/img/Tao/applewatchultraalpines.jpg', 4, N'Sản Phẩm : Tốt , Đẳng Cấp , Hiện Đại', 625)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589257, N'RoLex Serie1', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:41:41.553' AS DateTime), N'/img/rolex/2rolex.jpg', 5, N'Sản Phẩm : Tốt , Qúy Phái, Lịch Lãm', 893)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589258, N'Rolex Serie2', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:42:15.553' AS DateTime), N'/img/rolex/3rolex.jpg', 5, N'Sản Phẩm : Tốt , Qúy Phái, Lịch Lãm', 332)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589259, N'Rolex Serie3', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:42:43.500' AS DateTime), N'/img/rolex/6rolex.jpg', 5, N'Sản Phẩm : Tốt , Qúy Phái, Lịch Lãm', 126)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589260, N'Rolex Serie4', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:43:20.853' AS DateTime), N'/img/rolex/7rolex.jpg', 5, N'Sản Phẩm : Tốt , Qúy Phái, Lịch Lãm', 699)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589261, N'Rolex Serie5', CAST(5000000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:43:57.007' AS DateTime), N'/img/rolex/9rolex.jpg', 5, N'Sản Phẩm : Tốt , Qúy Phái, Lịch Lãm', 493)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589262, N'HubLot BigBang 401', CAST(7500000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:45:58.267' AS DateTime), N'/img/hublot/401.jpg', 6, N'Sản Phẩm : Tốt , Lịch Lãm , Thời Thượng', 269)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589263, N'HubLot BigBang 411', CAST(7500000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:46:34.027' AS DateTime), N'/img/hublot/411.jpg', 6, N'Sản Phẩm : Tốt , Lịch Lãm , Thời Thượng', 369)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589264, N'HubLot BigBang 411 Pink', CAST(7500000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:47:06.130' AS DateTime), N'/img/hublot/441Pink.jpg', 6, N'Sản Phẩm : Tốt , Lịch Lãm , Thời Thượng', 235)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589265, N'Hublot BigBang 719', CAST(7500000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:48:04.610' AS DateTime), N'/img/hublot/719.jpg', 6, N'Sản Phẩm : Tốt , Lịch Lãm , Thời Thượng', 147)
GO
INSERT [dbo].[DongHo] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [GiamGia], [SoLuong], [NgayCapNhat], [AnhBia], [MaLoai], [MoTa], [SoLuongBan]) VALUES (1818589266, N'Hublot BigBang Unico Red', CAST(7500000000 AS Decimal(18, 0)), CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1000, CAST(N'2022-10-31T23:48:38.760' AS DateTime), N'/img/hublot/Red411.jpg', 6, N'Sản Phẩm : Tốt , Lịch Lãm , Thời Thượng', 555)
GO
SET IDENTITY_INSERT [dbo].[DongHo] OFF
GO
INSERT [dbo].[DongHoRoLex] ([MaDongHo], [TenDongHo], [GiaBan], [NgaySanXuat], [NgayNhapKho], [SoLuong], [GioiTinh], [AnhBia]) VALUES (N'RoLex', N'RoLexBigBang', 500000000, CAST(N'2022-10-05T00:00:00.000' AS DateTime), CAST(N'2022-10-07T00:00:00.000' AS DateTime), N'100       ', N'Nam', N'/img/rolex/Dong-ho-Rolex-Day-Date-II.jpg')
GO
SET IDENTITY_INSERT [dbo].[PhanLoai] ON 
GO
INSERT [dbo].[PhanLoai] ([MaLoai], [TenLoai], [DisplayOrder]) VALUES (1, N'G-Sock', 1)
GO
INSERT [dbo].[PhanLoai] ([MaLoai], [TenLoai], [DisplayOrder]) VALUES (2, N'Casio', 2)
GO
INSERT [dbo].[PhanLoai] ([MaLoai], [TenLoai], [DisplayOrder]) VALUES (3, N'SamSung', 3)
GO
INSERT [dbo].[PhanLoai] ([MaLoai], [TenLoai], [DisplayOrder]) VALUES (4, N'Apple Watch', 4)
GO
INSERT [dbo].[PhanLoai] ([MaLoai], [TenLoai], [DisplayOrder]) VALUES (5, N'Rolex', 5)
GO
INSERT [dbo].[PhanLoai] ([MaLoai], [TenLoai], [DisplayOrder]) VALUES (6, N'HubLot', 6)
GO
SET IDENTITY_INSERT [dbo].[PhanLoai] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 
GO
INSERT [dbo].[TaiKhoan] ([ID], [TenDangNhap], [MatKhau], [Quyen], [DiaChi], [SoDienThoai], [Email]) VALUES (1, N'TPT', N'tonton', 1, N'Bình Dương', CAST(123456789 AS Decimal(18, 0)), N'toantito223@gmail.com')
GO
INSERT [dbo].[TaiKhoan] ([ID], [TenDangNhap], [MatKhau], [Quyen], [DiaChi], [SoDienThoai], [Email]) VALUES (2, N'NHP', N'phucphuc', 1, N'Bình Dương', CAST(987654321 AS Decimal(18, 0)), N'phuc@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
ALTER TABLE [dbo].[DongHo] ADD  CONSTRAINT [DF_DongHo_SoLuong]  DEFAULT ((0)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[DongHo] ADD  CONSTRAINT [DF_DongHo_NgayCapNhat]  DEFAULT (getdate()) FOR [NgayCapNhat]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DangKi_DonDatHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DONDATHANG] ([MaDonHang])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DangKi_DonDatHang]
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD  CONSTRAINT [FK_DongHo_PhanLoai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[PhanLoai] ([MaLoai])
GO
ALTER TABLE [dbo].[DongHo] CHECK CONSTRAINT [FK_DongHo_PhanLoai]
GO
ALTER TABLE [dbo].[TinhTrangHang]  WITH CHECK ADD  CONSTRAINT [FK_TinhTrangHang_Gioithieusanpham] FOREIGN KEY([TenDongHo])
REFERENCES [dbo].[Gioithieusanpham] ([TenDongHo])
GO
ALTER TABLE [dbo].[TinhTrangHang] CHECK CONSTRAINT [FK_TinhTrangHang_Gioithieusanpham]
GO
