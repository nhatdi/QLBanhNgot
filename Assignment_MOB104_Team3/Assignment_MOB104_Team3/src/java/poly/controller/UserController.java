/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import poly.entity.NguoiDung;

/**
 *
 * @author Vủ Bằng
 */
@Transactional
@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    SessionFactory factory;
    NguoiDung nguoidung;

    //Đăng nhập
    @RequestMapping("login")
    public String login(ModelMap model,
            @ModelAttribute("allNguoiDung") List<NguoiDung> nguoidungs) {
        model.addAttribute("NguoiDung", new NguoiDung());
        model.addAttribute("nguoidungs", nguoidungs);
        return "user/login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(ModelMap model, @ModelAttribute("NguoiDung") NguoiDung nguoidungs, BindingResult errors, HttpServletRequest req) {
        Session session = factory.openSession();
        if (nguoidungs.getUsername().trim().length() != 0) {
            if (nguoidungs.getPassword().trim().length() != 0) {
                NguoiDung us = (NguoiDung) session.get(NguoiDung.class, nguoidungs.getUsername());
                if (us != null) {
                    if (us.getUsername().equals(nguoidungs.getUsername()) && us.getPassword().equals(nguoidungs.getPassword())) {
                        return "redirect:/home/home.htm";
                    } else {
                        model.addAttribute("mess", "<span style=color:red>Sai tên đăng nhập hoặc mật khẩu</span>");
                    }
                } else {
                    model.addAttribute("mess", "<span style=color:red>Sai tên đăng nhập hoặc mật khẩu</span>");
                }
            } else {
                model.addAttribute("mess", "<span style=color:red>Vui lòng nhập password</span>");
            }
        } else {
            model.addAttribute("mess", "<span style=color:red>Vui lòng nhập Username</span>");
        }
        return "user/login";
    }

    @ModelAttribute("allNguoiDung")
    public List<NguoiDung> findAllNguoiDung() {
        Session session = factory.openSession();
        String hql = "FROM NguoiDung";
        Query query = session.createQuery(hql);
        List<NguoiDung> list = query.list();
        return list;
    }

    @RequestMapping("user")
    public String user(ModelMap model,
            @ModelAttribute("allNguoiDung") List<NguoiDung> nguoidungs) {
        model.addAttribute("NguoiDung", new NguoiDung());
        model.addAttribute("nguoidungs", nguoidungs);
        return "user/user";
    }

    @RequestMapping("insert")
    public String insert(ModelMap model,
            @ModelAttribute("NguoiDung") NguoiDung nguoidung,
            @ModelAttribute("allNguoiDung") List<NguoiDung> nguoidungs) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.save(nguoidung);
            t.commit();
            nguoidung.setUsername("");
            nguoidung.setPassword("");
            model.addAttribute("message", "<span style=color:green>Thêm mới thành công!</span>");
            model.addAttribute("nguoidungs", findAllNguoiDung());
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Thêm mới thất bại !");
            model.addAttribute("nguoidungs", findAllNguoiDung());
        } finally {
            session.close();
        }
        return "user/user";
    }

    @RequestMapping("edit/{username}")
    public String edit(@PathVariable("username") String username,
            ModelMap m,
            @ModelAttribute("NguoiDung") NguoiDung nguoidungs) {
        Session s = factory.openSession();
        NguoiDung users1 = (NguoiDung) s.get(NguoiDung.class, username);

        try {
            nguoidungs.setUsername(username);
            nguoidungs.setPassword(users1.getPassword());
            m.addAttribute("nguoidungs", findAllNguoiDung());
        } catch (Exception e) {
            m.addAttribute("message", e.toString());
            m.addAttribute("nguoidungs", findAllNguoiDung());
        } finally {
            s.close();
        }
        return "user/edit";
    }

    @RequestMapping("save")
    public String save(ModelMap m,
            @ModelAttribute("NguoiDung") NguoiDung nguoidung) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            s.update(nguoidung);
            t.commit();
            nguoidung.setUsername("");
            nguoidung.setPassword("");
            m.addAttribute("message", "Cập nhật thành công!");
            m.addAttribute("nguoidungs", findAllNguoiDung());
        } catch (Exception e) {
            m.addAttribute("message", "Cập nhật thất bại!");
            m.addAttribute("nguoidungs", findAllNguoiDung());
        } finally {
            s.close();
        }
        return "user/edit";
    }
    //nút delete

    @RequestMapping("delete/{username}")
    public String delete(@PathVariable("username") String username,
            ModelMap m,
            @ModelAttribute("NguoiDung") NguoiDung nguoidungs) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();

        try {
            s.delete(nguoidungs);
            t.commit();
            m.addAttribute("message", "Xóa thành công!");
            m.addAttribute("nguoidungs", findAllNguoiDung());
        } catch (Exception e) {
            m.addAttribute("message", "Xóa thất bại!");
            m.addAttribute("nguoidungs", findAllNguoiDung());
        } finally {
            s.close();
        }
        return "user/user";
    }
}
