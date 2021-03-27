/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.controller;

import java.util.List;
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
import poly.entity.DanhGia;
import poly.entity.SanPham;
import java.util.Date;
/**
 *
 * @author DELL
 */
@Transactional
@Controller
@RequestMapping("/home/")
public class DanhgiaController {

    @Autowired
    SessionFactory factory;
    DanhGia danhgia;
    //Đăng nhập
    @RequestMapping("home")
    public String formDanhgia(ModelMap model,
            @ModelAttribute("allDanhGia") List<DanhGia> danhgias) {
        model.addAttribute("DanhGia", new DanhGia());
        model.addAttribute("danhgias", danhgias);
        return "home/home";
    }

    @RequestMapping("sanpham")
    public String formSanpham(ModelMap model,
            @ModelAttribute("sanphams") List<SanPham> sanphams) {
        model.addAttribute("SanPham", new SanPham());
        model.addAttribute("sanphams", sanphams);
        return "home/home";
    }

    @ModelAttribute("allDanhGia")
    public List<DanhGia> findAllDanhGia() {
        Session session = factory.openSession();
        String hql = "FROM DanhGia";
        Query query = session.createQuery(hql);
        List<DanhGia> list = query.list();
        return list;
    }

    @ModelAttribute("sanphams")
    public List<SanPham> findAllSanPham() {
        Session session = factory.openSession();
        String hql = "FROM SanPham";
        Query query = session.createQuery(hql);
        List<SanPham> list = query.list();
        return list;
    }

    @RequestMapping("insert")
    public String insert(ModelMap model,
                @ModelAttribute("DanhGia") DanhGia danhgia,
            @ModelAttribute("allDanhGia") List<DanhGia> danhgias) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.save(danhgia);
            t.commit();
            danhgia.setEmail("");
            danhgia.setDanhGia("");
//            model.addAttribute("message", "<span style=color:green>Cảm ơn bạn đã đóng góp ý kiến sản phẩm chúng tôi!</span>");
            model.addAttribute("danhgias", findAllDanhGia());
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Thất bại!");
            model.addAttribute("danhgias", findAllDanhGia());
        } finally {
            session.close();
        }
        return "redirect:/home/home.htm#DanhGia";
    }
     @RequestMapping("delete/{maDG}")
    public String delete(@PathVariable("maDG") String maDG,
            ModelMap m,
            @ModelAttribute("DanhGia") DanhGia danhgia) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            //delete query
            danhgia.setNgayDG(new Date());
            s.delete(danhgia);
            t.commit();
            danhgia.setEmail("");
            danhgia.setDanhGia("");
            m.addAttribute("message", "Xoá thành công !");
            m.addAttribute("danhgias", findAllDanhGia());
        } catch (Exception e) {
            t.rollback();
            m.addAttribute("message", "Xoá thất bại !");
        } finally {
            s.close();
        }
        return "home/home";
    }
}
