/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.controller;

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
import poly.entity.CuaHang;
import poly.entity.SanPham;


/**
 *
 * @author Asus
 */
@Transactional
@Controller
@RequestMapping("/cuahang/")
public class CuahangController {
@Autowired
    SessionFactory fc;
    
    @Autowired
    ServletContext context;
      @ModelAttribute("dsch")
    public List<CuaHang> danhsachCH(){
        Session s = fc.getCurrentSession();
        String sql = "FROM CuaHang";
        Query q = s.createQuery(sql);
        List<CuaHang> l = q.list();
        return l;
    }
    
    @ModelAttribute("dssp")
    public List<SanPham> danhsachSP(){
        Session s = fc.getCurrentSession();
        String sql = "FROM SanPham";
        Query q = s.createQuery(sql);
        List<SanPham> l =q.list();
        return l;
    }
  
    @RequestMapping("Cuahang")
    public String form(ModelMap m,
            @ModelAttribute("dsch") List<CuaHang> dsch) {
        m.addAttribute("ch", new CuaHang());
        m.addAttribute("dsch", dsch);
        return "cuahang/Cuahang";
    }
    @RequestMapping("execute")
    public String execute(ModelMap m,
            @ModelAttribute("ch") CuaHang ch,
            @RequestParam(value = "insert", required = false) String insert,
            @RequestParam(value = "edit", required = false) String edit) {

        Session s = fc.openSession();
        Transaction t = s.beginTransaction();
        try {
            if (insert != null) {
                s.save(ch);
                 m.addAttribute("mess","Thêm thành công");
            }
            if (edit != null) {
                s.update(ch);
            }
            t.commit();
        } catch (Exception e) {
            t.rollback();
            m.addAttribute("mess", e.toString());
        } finally {
            s.close();
        }
        m.addAttribute("dsch", danhsachCH());
        return "cuahang/Cuahang";
    }

     @RequestMapping("edit/{maCH}")
    public String edit(ModelMap m,
            @PathVariable("maCH") String maCH,
            @ModelAttribute("dsch") List<CuaHang> dsch) {
        Session s = fc.getCurrentSession();
        CuaHang ch = (CuaHang) s.get(CuaHang.class, maCH);
        m.addAttribute("ch", ch);
        m.addAttribute("dsch", dsch);
        return "cuahang/Cuahang";
    }

    @RequestMapping("delete/{maCH}")
    public String delete(ModelMap m,
            @PathVariable("maCH") String maCH) {

        Session s = fc.openSession();
        Transaction t = s.beginTransaction();
        CuaHang ch = (CuaHang) s.get(CuaHang.class, maCH);

        try {
            s.delete(ch);
            t.commit();
        } catch (Exception e) {
            t.rollback();
            m.addAttribute("mess", e.toString());
        } finally {
            s.close();
        }
        m.addAttribute("ch", new CuaHang());
        m.addAttribute("dsch", danhsachCH());
        return "cuahang/Cuahang";
    }

}
