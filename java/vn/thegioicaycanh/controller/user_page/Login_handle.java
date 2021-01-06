package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/handle-login")
public class Login_handle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        //xu li chuyen trang khi nguoi dung bam vao nut dang nhap
        if(request.getParameter("login") !=null){
            //neu login=user thi chuyen den trang login cua user
            if(request.getParameter("login").equalsIgnoreCase("user")){
                //set status cho trang jsp de hieu la dang o trang thai nao
                //status = 1: đang nhap
                //status = 2: Sai tai khoan
                //status =3: hien thi thong bao xac thuc quen mat khau
                request.setAttribute("status",1);
                request.getRequestDispatcher("user_page/Login.jsp").forward(request,response);
            }
            //neu login=admin thi chuyen den trang login cua admin
            else if(request.getParameter("login").equalsIgnoreCase("admin")){
                HttpSession session =request.getSession();
                if(session.getAttribute("user_id") !=null){
                    int user_id = (int)session.getAttribute("user_id");
                    User user = LoadUser.loadUserById(user_id);
                    if(user.getRole_id() == 2 || user.getRole_id() == 3){
                        request.getRequestDispatcher("admin_page/Login.jsp").forward(request,response);
                    }
                }

            }
            return;
        }
        if(request.getParameter("logout") !=null){
            if(request.getParameter("logout").equalsIgnoreCase("true")){
                if(request.getSession(false) !=null) {
                    request.getSession(false).invalidate();
                }
                request.getRequestDispatcher("home").forward(request, response);
            }
            return;
        }

        //Kiem tra xem nguoi dung da dang nhap va chua dang xuat hay khong
        //Neu dung thi xoa session do va tao sesion khac
        if(request.getSession(false) !=null){
            request.getSession(false).invalidate();
        }

        //xu li xac thuc thong tin tai khoan
        String email="";
        String pass="";
        if(request.getParameter("email")!=null){
            email=request.getParameter("email");
        }
        if(request.getParameter("pass")!=null){
            pass = request.getParameter("pass");
        }
        if(email.isEmpty() || pass.isEmpty()){
            request.setAttribute("status",2);

            request.getRequestDispatcher("user_page/Login.jsp").forward(request,response);
            return;
        }
        System.out.println(email);
        System.out.println(pass);
        User user = LoadUser.loadAUserByEmail(email);
        if(user == null){
            request.setAttribute("status",2);

            request.getRequestDispatcher("user_page/Login.jsp").forward(request,response);
            return;
        }
        long passHashCode = user.getId()*email.hashCode()*pass.hashCode();
        if(passHashCode != user.getPassword()){
            request.setAttribute("status",2);
            System.out.println("Sai mat khau");
            request.getRequestDispatcher("user_page/Login.jsp").forward(request,response);
        }else {
            HttpSession session = request.getSession();
            session.setAttribute("user_avatar",user.getAvatar());
            session.setAttribute("user_id",user.getId());
            session.setAttribute("user_name",user.getName());
            if(user.getRole_id() == 2 || user.getRole_id() ==3){
                session.setAttribute("isAdmin",true);
            }
            System.out.println("Dan chuyen den home sau khi dang nhap");
            request.getRequestDispatcher("home").forward(request,response);
        }

//        if(request.getParameter("email")!=null){
//            System.out.println(request.getParameter("email"));
//        }
//        if(request.getParameter("pass") !=null){
//            System.out.println(request.getParameter("pass"));
//        }
//        System.out.println("Da nhan phan hoi");
//        request.getRequestDispatcher("user_page/Login.jsp").forward(request,response);
    }
}
