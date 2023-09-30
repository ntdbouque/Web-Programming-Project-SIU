CREATE DATABASE PROJECTWEB
USE PROJECTWEB
    
CREATE TABLE Sach (
    MaSach INT PRIMARY KEY,
    DonGiaNhap DECIMAL(10, 2),
    TacGia VARCHAR(100),
    NhaXuatBan VARCHAR(100),
    DonGiaBan DECIMAL(10, 2),
    SoLuong INT,
    MaTheLoai INT,
    AnhBia VARCHAR(100),
    TenSach VARCHAR(100),
    FOREIGN KEY (MaTheLoai) REFERENCES TheLoai(MaTheLoai)
);

CREATE TABLE KhachHang (
    MaKhachHang INT PRIMARY KEY,
    TenKhachHang VARCHAR(100),
    SoDienThoai VARCHAR(20),
    Email VARCHAR(100),
    DiaChi VARCHAR(200)
);

CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY,
    TenNhanVien VARCHAR(100),
    Email VARCHAR(100),
    NgaySinh DATE,
    MaSach INT,
    ChucVu VARCHAR(100),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
);

CREATE TABLE TheLoai (
    MaTheLoai INT PRIMARY KEY,
    TenTheLoai VARCHAR(100)
);

CREATE TABLE HoaDonBan (
    MaHoaDonBan INT PRIMARY KEY,
    MaKhachHang INT,
    MaNhanVien INT,
    NgayBan DATE,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);

CREATE TABLE ChiTietHoaDonBan (
    SoLuongBan INT,
    MaSach INT,
    MaHoaDonBan INT,
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach),
    FOREIGN KEY (MaHoaDonBan) REFERENCES HoaDonBan(MaHoaDonBan)
);

CREATE TABLE HoaDonNhap (
    MaHoaDonNhap INT PRIMARY KEY,
    MaNhanVien INT,
    NgayNhap DATE,
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);

CREATE TABLE ChiTietHoaDonNhap (
    MaHoaDonNhap INT,
    MaSach INT,
    SoLuongNhap INT,
    FOREIGN KEY (MaHoaDonNhap) REFERENCES HoaDonNhap(MaHoaDonNhap),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
);

CREATE TABLE Kho (
    MaNhanVien INT,
    MaSach INT,
    SoLuongConLai INT,
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
);
