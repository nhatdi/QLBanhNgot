/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.entity;

import java.util.Collection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "CuaHang")
public class CuaHang {

    @Id
    private String maCH;
    private String tenCH;

    private String diaChi;
    private String tinhTrang;

    @OneToMany(mappedBy = "cuahang", fetch = FetchType.EAGER)
    private Collection<SanPham> sanpham;

    public CuaHang(String maCH, String tenCH, String diaChi, String tinhTrang, Collection<SanPham> sanpham) {
        this.maCH = maCH;
        this.tenCH = tenCH;
        this.diaChi = diaChi;
        this.tinhTrang = tinhTrang;
        this.sanpham = sanpham;
    }
    public CuaHang() {
    }

    public String getMaCH() {
        return maCH;
    }

    public void setMaCH(String maCH) {
        this.maCH = maCH;
    }

    public String getTenCH() {
        return tenCH;
    }

    public void setTenCH(String tenCH) {
        this.tenCH = tenCH;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getTinhTrang() {
        return tinhTrang;
    }

    public void setTinhTrang(String tinhTrang) {
        this.tinhTrang = tinhTrang;
    }

    public Collection<SanPham> getSanpham() {
        return sanpham;
    }

    public void setSanpham(Collection<SanPham> sanpham) {
        this.sanpham = sanpham;
    }

}
