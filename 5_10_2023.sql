CREATE DATABASE WEB_VER3

USE WEB_VER3
Drop table KhachHang;
CREATE TABLE Sach(
    MaSach VARCHAR(10) PRIMARY KEY,
    DonGiaNhap DECIMAL(10, 2),
    TacGia NVARCHAR(100),
    NhaXuatBan NVARCHAR(100),
    DonGiaBan DECIMAL(10, 2),
    TonDauThang INT,
	TonCuoiThang INT,
	PhatSinh INT,
    MaTheLoai VARCHAR(20),
    TenSach NVARCHAR(100),
    FOREIGN KEY (MaTheLoai) REFERENCES TheLoai(MaTheLoai),
);

CREATE TABLE KhachHang (
    MaKhachHang VARCHAR(10) PRIMARY KEY,
    TenKhachHang NVARCHAR(100),
    SoDienThoai VARCHAR(20),
    Email VARCHAR(100),
    DiaChi NVARCHAR(200),
	NoDauThang int,
	PhatSinh int,
	NoCuoiThang int,

);

CREATE TABLE NhanVien (
    MaNhanVien VARCHAR PRIMARY KEY,
    TenNhanVien NVARCHAR(100),
    Email VARCHAR(100),
    NgaySinh DATE,
    MaSach VARCHAR(10),
    ChucVu NVARCHAR(100),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach),
	FOREIGN KEY (AccName) REFERENCES Account(AccName)
);

CREATE TABLE TheLoai (
    MaTheLoai VARCHAR PRIMARY KEY,
    TenTheLoai NVARCHAR(100)
);

CREATE TABLE HoaDonBan (
    MaHoaDonBan VARCHAR(10) PRIMARY KEY,
    MaKhachHang VARCHAR(10),
    MaNhanVien VARCHAR(10),
    NgayBan DATE,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);

CREATE TABLE ChiTietHoaDonBan(
    SoLuongBan INT,
    MaSach VARCHAR(10),
    MaHoaDonBan VARCHAR(10),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach),
    FOREIGN KEY (MaHoaDonBan) REFERENCES HoaDonBan(MaHoaDonBan)
);

CREATE TABLE HoaDonNhap (
    MaHoaDonNhap VARCHAR(10) PRIMARY KEY,
    MaNhanVien VARCHAR(10),
    NgayNhap DATE,
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);

CREATE TABLE ChiTietHoaDonNhap (
    MaHoaDonNhap VARCHAR(10) ,
    MaSach VARCHAR(10),
    SoLuongNhap INT,
    FOREIGN KEY (MaHoaDonNhap) REFERENCES HoaDonNhap(MaHoaDonNhap),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
);

CREATE TABLE Kho (
    MaNhanVien VARCHAR(10),
    MaSach VARCHAR(10),
    SoLuongConLai INT,
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
);
ALTER TABLE Account
ADD UNIQUE (AccName);
Create table Account(
	AccName NVARCHAR(100) PRIMARY KEY,
	AccrRole VARCHAR(10),
	AccPass VARCHAR(32),
);
drop table Account;

CREATE TABLE Admin(
	AdId VARCHAR(10),
	AdName VARCHAR(100),
	FOREIGN KEY (AccName) REFERENCES Account(AccName),
);

