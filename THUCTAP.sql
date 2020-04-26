CREATE DATABASE ThucTap
GO
USE ThucTap 
GO

CREATE TABLE KHOA (
	MaKhoa char (10) NOT NULL,
	TenKhoa Nvarchar(40),

	CONSTRAINT FK_KHOA PRIMARY KEY (MaKhoa)
)
GO

CREATE TABLE HeDaoTao (
	MaHe char(4) NOT NULL,
	TenHe Nvarchar(50),
	
	CONSTRAINT FK_HeDaoTao PRIMARY KEY (MaHe)
)
GO

CREATE TABLE NienKhoa (
	MaNienKhoa Char(10) NOT NULL,
	TenNienKhoa Nvarchar(40),

	CONSTRAINT FK_KhoaHoc PRIMARY KEY (MaNienKhoa)
)
GO

CREATE TABLE NganhHoc (
	MaNganh char(10) NOT NULL,
	TenNganh Nvarchar(60),
	MaKhoa char (10) ,
	CONSTRAINT FK_NganhHoc PRIMARY KEY (MaNganh),
	CONSTRAINT FK_NGANHHOC_MAKHOA FOREIGN KEY(MaKhoa) REFERENCES Khoa(MaKhoa)
)
GO

CREATE TABLE Lop (
	MaLop char(8) NOT NULL,
	TenLop Nvarchar(50),
	MaKhoa char (10) ,
	MaHe char(4),
	MaNganh char(10),
	CONSTRAINT FK_Lop PRIMARY KEY (MaLop),
	CONSTRAINT FK_LOP_NGANHHOC FOREIGN KEY(MaNganh) REFERENCES NganhHoc(MaNganh)
)
GO

CREATE TABLE MonHoc (
	MaMonHoc char(10) NOT NULL,
	TenMonHoc Nvarchar(40),
	LyThuyet int,
	ThucHanh int,
	CONSTRAINT FK_MonHoc PRIMARY KEY (MaMonHoc)
)
GO

CREATE TABLE SinhVien (
	MaSV char(10) NOT NULL,
	HoSV Nvarchar(20),
	TenSV Nvarchar(20),
	GioiTinh bit,
	NgaySinh DATE,
	NoiSinh char(30),
	DiaChi char(40),
	MaTinh char(15),
	Quan char(20),
	MaLop char(8),
	HocBong int,
	CONSTRAINT FK_SinhVien PRIMARY KEY (MaSV),
	CONSTRAINT FK_SINHVIEN_LOP FOREIGN KEY(MaLop) REFERENCES Lop(MaLop)
)
GO

CREATE TABLE BangDiemThiHocKy (
	MaBangDiem  char(10) not null,
	MaSV char(10),
	MaMonHoc char(10),
	LanThi char(20),
	HocKy char(40),
	Diem Float,
	CONSTRAINT FK_BangDiemThiHocKy PRIMARY KEY (MaBangDiem),

	CONSTRAINT FK_BANGDIEM_SINHVIEN FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV),
	CONSTRAINT FK_BANGDIEM_MONHOC FOREIGN KEY (MaMonHoc) REFERENCES MonHoc(MaMonHoc),
)
GO

ALTER TABLE NienKhoa add MaKhoa char(10)

ALTER TABLE HeDaoTao add MaNienKhoa Char(10)

ALTER TABLE NienKhoa Add CONSTRAINT FK_NIENKHOA_KHOA FOREIGN KEY(MaKhoa) REFERENCES Khoa(MaKhoa)

ALTER TABLE HeDaoTao Add CONSTRAINT FK_HeDaoTao_NienKhoa FOREIGN KEY(MaNienKhoa) REFERENCES NienKhoa(MaNienKhoa)