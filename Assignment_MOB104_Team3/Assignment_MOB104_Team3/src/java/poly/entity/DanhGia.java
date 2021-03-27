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
import javax.persistence.GeneratedValue;
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
@Table(name = "DanhGia")
public class DanhGia {

    @Id
    @GeneratedValue
    private Integer maDG;
    private String danhGia;
    private String email;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date ngayDG;

    @ManyToOne
    @JoinColumn(name = "maSP")
    private SanPham sanpham;

    public DanhGia(Integer maDG, String danhGia, String email, Date ngayDG, SanPham sanpham) {
        this.maDG = maDG;
        this.danhGia = danhGia;
        this.email = email;
        this.ngayDG = ngayDG;
        this.sanpham = sanpham;
    }

    public DanhGia() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getMaDG() {
        return maDG;
    }

    public void setMaDG(Integer maDG) {
        this.maDG = maDG;
    }

    public String getDanhGia() {
        return danhGia;
    }

    public void setDanhGia(String danhGia) {
        this.danhGia = danhGia;
    }

    public Date getNgayDG() {
        return ngayDG;
    }

    public void setNgayDG(Date ngayDG) {
        this.ngayDG = ngayDG;
    }

    public SanPham getSanpham() {
        return sanpham;
    }

    public void setSanpham(SanPham sanpham) {
        this.sanpham = sanpham;
    }

}
