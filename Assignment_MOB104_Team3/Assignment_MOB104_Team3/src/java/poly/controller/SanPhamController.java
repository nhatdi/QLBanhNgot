/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import poly.entity.CuaHang;
import poly.entity.SanPham;

/**
 *
 * @author Vủ Bằng
 */
@Transactional
@Controller
@RequestMapping("sanpham")
public class SanPhamController {

    @Autowired
    SessionFactory fc;

    @Autowired
    ServletContext context;

    @ModelAttribute("dssp")
    public List<SanPham> danhsachSP() {
        Session s = fc.getCurrentSession();
        String sql = "FROM SanPham";
        Query q = s.createQuery(sql);
        List<SanPham> l = q.list();
        return l;
    }

    @ModelAttribute("dsch")
    public List<CuaHang> danhsachCH() {
        Session s = fc.getCurrentSession();
        String sql = "FROM CuaHang";
        Query q = s.createQuery(sql);
        List<CuaHang> l = q.list();
        return l;
    }

    @RequestMapping("SanPham")
    public String form(ModelMap m,
            @ModelAttribute("dssp") List<SanPham> dssp) {
        m.addAttribute("sp", new SanPham());
        m.addAttribute("dssp", dssp);

        return "sanpham/SanPham";
    }

    @RequestMapping("execute")
    public String execute(ModelMap m,
            @ModelAttribute("sp") SanPham sp,
            @RequestParam(value = "hinh", required = false) MultipartFile photo,
            @RequestParam(value = "insert", required = false) String insert,
            @RequestParam(value = "edit", required = false) String edit) {

        Session s = fc.openSession();
        Transaction t = s.beginTransaction();
         try {
            String fileName = photo.getOriginalFilename();
                String photoPath = context.getRealPath("/image/product/" + fileName);
                photo.transferTo(new File(photoPath));
                sp.setHinhAnh(fileName);
               
        } catch (Exception e) {
        }
        try {
            if (insert != null) {
                s.save(sp);
                m.addAttribute("mess", "Thêm thành công!");
            }
            if (edit != null) {
                s.update(sp);
              
            }
            t.commit();
        } catch (Exception e) {
            t.rollback();
            m.addAttribute("mess", "Thất bại!");
        } finally {
            s.close();
        }
        m.addAttribute("dssp", danhsachSP());
        return "redirect:/sanpham/SanPham.htm";
    }

    @RequestMapping("edit/{maSP}")
    public String edit(ModelMap m,
            @PathVariable("maSP") String maSP,
            @ModelAttribute("dssp") List<SanPham> dssp) {
        Session s = fc.getCurrentSession();
        SanPham sp = (SanPham) s.get(SanPham.class, maSP);
        m.addAttribute("sp", sp);
        m.addAttribute("dssp", dssp);
        return "redirect:/sanpham/SanPham.htm";
    }

    @RequestMapping("delete/{maSP}")
    public String delete(ModelMap m,
            @PathVariable("maSP") String maSP) {

        Session s = fc.openSession();
        Transaction t = s.beginTransaction();
        SanPham sp = (SanPham) s.get(SanPham.class, maSP);
        try {
            s.delete(sp);
            t.commit();
            m.addAttribute("mess", "Xóa thành công!");
        } catch (Exception e) {
            t.rollback();
             m.addAttribute("mess", "Xóa thất bại!");
        } finally {
            s.close();
        }
        m.addAttribute("sp", new SanPham());
        m.addAttribute("dssp", danhsachSP());
        return "redirect:/sanpham/SanPham.htm";
    }
}
