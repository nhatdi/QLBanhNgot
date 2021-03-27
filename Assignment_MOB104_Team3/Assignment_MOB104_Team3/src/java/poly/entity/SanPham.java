/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.entity;

import java.util.Collection;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "SanPham")
public class SanPham {

    @Id
    private String maSP;
    private String tenSP;
    private String donGia;
    private String soLuong;
    private String hinhAnh;
    private String diaChi;
    private String bangTin;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date NSX;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date HSD;

    @OneToMany(mappedBy = "sanpham", fetch = FetchType.EAGER)
    private Collection<DanhGia> danhgia;

    @ManyToOne
    @JoinColumn(name = "maCH")
    private CuaHang cuahang;

    public SanPham(String maSP, String tenSP, String donGia, String soLuong, String hinhAnh, String diaChi, String bangTin, Date NSX, Date HSD, Collection<DanhGia> danhgia, CuaHang cuahang) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.donGia = donGia;
        this.soLuong = soLuong;
        this.hinhAnh = hinhAnh;
        this.diaChi = diaChi;
        this.bangTin = bangTin;
        this.NSX = NSX;
        this.HSD = HSD;
        this.danhgia = danhgia;
        this.cuahang = cuahang;
    }

    public SanPham() {
    }

    public Collection<DanhGia> getDanhgia() {
        return danhgia;
    }

    public void setDanhgia(Collection<DanhGia> danhgia) {
        this.danhgia = danhgia;
    }

    public CuaHang getCuahang() {
        return cuahang;
    }

    public void setCuahang(CuaHang cuahang) {
        this.cuahang = cuahang;
    }

    public String getMaSP() {
        return maSP;
    }

    public void setMaSP(String maSP) {
        this.maSP = maSP;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public String getDonGia() {
        return donGia;
    }

    public void setDonGia(String donGia) {
        this.donGia = donGia;
    }

    public String getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(String soLuong) {
        this.soLuong = soLuong;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getBangTin() {
        return bangTin;
    }

    public void setBangTin(String bangTin) {
        this.bangTin = bangTin;
    }

    public Date getNSX() {
        return NSX;
    }

    public void setNSX(Date NSX) {
        this.NSX = NSX;
    }

    public Date getHSD() {
        return HSD;
    }

    public void setHSD(Date HSD) {
        this.HSD = HSD;
    }

}
