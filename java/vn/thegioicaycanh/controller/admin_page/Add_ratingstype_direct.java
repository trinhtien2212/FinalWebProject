package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.header_footer.Category;
import vn.thegioicaycanh.model.header_footer.Load_Category;
import vn.thegioicaycanh.model.rating_type.Rating_Type;
import vn.thegioicaycanh.model.rating_type.Rating_Type_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin_page/add_ratingstype")
public class Add_ratingstype_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "rating-type");
        String type = request.getParameter("type");
        if(type != null){
            if(type.equalsIgnoreCase("enterAdd")){
                request.setAttribute("type","add");
                request.setAttribute("title","Thêm loại đánh giá");
                request.getRequestDispatcher("add-ratingstype.jsp").forward(request,response);
                return;
            } else if(type.equalsIgnoreCase("enterEdit")){
                request.setAttribute("type","edit");
                request.setAttribute("title","Chỉnh sửa loại đánh giá");
                int id = Integer.parseInt(request.getParameter("id"));
                Rating_Type rating_type= Rating_Type_Con_DB.loadRating_TypeById(id);
                request.setAttribute("ratingstype", rating_type);
                request.getRequestDispatcher("add-ratingstype.jsp").forward(request, response);
                return;
            }
        }

        String name = request.getParameter("name");
        int active = request.getParameter("active")==null?0:1;

        if(type.equalsIgnoreCase("add")){
            request.setAttribute("type", "add");
            request.setAttribute("title", "Thêm danh mục");
            boolean isInsert=Rating_Type_Con_DB.insertRating_Type(name,active);
            if(isInsert){
                System.out.println("Đã thực hiện câu lệnh sql");
                request.getRequestDispatcher("add-ratingstype.jsp").forward(request, response);
            }
            request.getRequestDispatcher("add-category.jsp").forward(request,response);
        } else if(type.equalsIgnoreCase("edit")){
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("type", "edit");
            request.setAttribute("title","Chỉnh sửa loại đánh giá");
            System.out.println("da vao edit loại danh gia");
            boolean isUpdate=Rating_Type_Con_DB.updateRating_Type(id,name,active);
            Rating_Type rating_type= Rating_Type_Con_DB.loadRating_TypeById(id);
            request.setAttribute("ratingstype", rating_type);
            request.getRequestDispatcher("add-ratingstyoe.jsp").forward(request, response);
        }
    }
}
