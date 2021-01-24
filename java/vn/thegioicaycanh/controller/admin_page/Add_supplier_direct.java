package vn.thegioicaycanh.controller.admin_page;

import org.apache.commons.fileupload.FileItem;
import vn.thegioicaycanh.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@WebServlet(urlPatterns = "/admin_page/add_supplier")
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


    }
}
