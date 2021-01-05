package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.coupon_code.CouponCode;
import vn.thegioicaycanh.model.coupon_code.Coupon_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/coupon_code")
public class Coupon_code_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleParameter(request);
        request.setAttribute("page_menu","discount");
        request.setAttribute("title","Mã giảm giá");
        request.setAttribute("coupon_code_data", Coupon_Con_DB.loadAllCouponCode());
        request.getRequestDispatcher("user_page/coupon-code.jsp").forward(request,response);

    }
    private void handleParameter(HttpServletRequest request){
        byte cat_id = 0;
        byte sortedprice_id=0;
        byte sorteddate_id=0;
        String sql="select * from coupon_code";
        String url ="";
        String sqlCondition="";
        if(request.getParameter("sortedprice_id") !=null) {
           sortedprice_id=Byte.parseByte(request.getParameter("sortedprice_id"));
            url +="&sortedprice_id="+sortedprice_id;
            if(sortedprice_id ==1 ){
                sqlCondition =sqlCondition.isEmpty()?" order by percent desc":" where "+sqlCondition+" order by percent desc";
            }else{
                sqlCondition =sqlCondition.isEmpty()?" order by percent asc":" where "+sqlCondition+" order by percent asc";
            }
      } else{
            sqlCondition =sqlCondition.isEmpty()?"":" where "+sqlCondition;
        }
        //Load discount thoa dieu kien
        List<CouponCode> dataCouponCode = Coupon_Con_DB.loadCouponCodeFormSql(sql+sqlCondition);
        request.setAttribute("coupon_code_data",dataCouponCode);

        request.setAttribute("url",url);
        request.setAttribute("sort_id",sortedprice_id);
        request.setAttribute("cat_id",cat_id);
        request.setAttribute("sortedprice_id",sortedprice_id);
        request.setAttribute("sorteddate_id",sorteddate_id);

}
}
