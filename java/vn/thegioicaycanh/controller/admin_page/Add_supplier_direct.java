package vn.thegioicaycanh.controller.admin_page;

import org.apache.commons.fileupload.FileItem;
import vn.thegioicaycanh.model.blog.Blog;
import vn.thegioicaycanh.model.blog.Blog_Con_DB;
import vn.thegioicaycanh.model.supplier.Load_Supplier;
import vn.thegioicaycanh.model.supplier.Supplier;
import vn.thegioicaycanh.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@WebServlet(urlPatterns = "/admin_page/add-supplier")
public class Add_supplier_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page","supplier");
        String type = request.getParameter("type");
        if(type !=null) {
            if (type.equalsIgnoreCase("enterAdd")) {
                request.setAttribute("type", "add");
                request.setAttribute("title", "Thêm nhà cung cấp");
                request.getRequestDispatcher("add-supplier.jsp").forward(request, response);
                return;
            }
        }
        if(type.equalsIgnoreCase("add")){
            request.setAttribute("type","add");
            request.setAttribute("title","Thêm nhà cung cấp");
            String logo= request.getParameter("logo");
            String name=request.getParameter("name");
            String address=request.getParameter("address");
            int phone=Integer.parseInt(request.getParameter("phone"));
            String email=request.getParameter("email");
            boolean isInsert = Load_Supplier.insertSupplier(logo,name,address,phone,email);
            if(isInsert)
                request.getRequestDispatcher("add-supplier.jsp").forward(request,response);
    }else if(type.equalsIgnoreCase("edit")){
            request.setAttribute("type","edit");
            request.setAttribute("title","Chỉnh sửa nhà cung cấp");
            System.out.println("co vao edit");
            String logo= request.getParameter("logo");
            String name=request.getParameter("name");
            String address=request.getParameter("address");
            int phone=Integer.parseInt(request.getParameter("phone"));
            String email=request.getParameter("email");
            HttpSession session = request.getSession();
            int id=(int)session.getAttribute("user_id");
            System.out.println(id);
            boolean isUpdate = Load_Supplier.updateSupplier(id,logo,name,address,phone,email);
            Supplier su = Load_Supplier.loadSupplier(id);
            request.setAttribute("supplier",su);
            request.getRequestDispatcher("add-supplier.jsp.jsp").forward(request,response);

        }

}}
