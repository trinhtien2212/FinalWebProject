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
        handleParameter(request,response);
        request.setAttribute("type_page","coupon_code");
        request.setAttribute("page_menu","discount");
        request.setAttribute("title","Mã giảm giá");
//        request.setAttribute("coupon_code_data", Coupon_Con_DB.loadAllCouponCode());
        request.getRequestDispatcher("user_page/coupon-code.jsp").forward(request,response);


    }
    private void handleParameter(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        byte cat_id = 0;
        byte sortedprice_id=0;
        byte date_id=0;
        String sql="select * from coupon_code";
        String url ="";
        String sqlCondition="";

        //cat_id handle
        if(request.getParameter("cat_id")!=null){
            cat_id=Byte.parseByte(request.getParameter("cat_id"));
            url+="&cat_id="+cat_id;
            if(cat_id==1){
               url="http://localhost:8080/thegioicaycanh.vn/shopping";
            }

        }

        if(request.getParameter("date_id") !=null){
            date_id=Byte.parseByte(request.getParameter("date_id"));
            url +="&date_id="+date_id;
            System.out.println(url);
            if(date_id==1){
                sqlCondition=sqlCondition.isEmpty()?"  DATEDIFF (CURRENT_DATE, date_end) =1":" where "+sqlCondition+"  DATEDIFF (CURRENT_DATE, date_end) 1";
                System.out.println(sqlCondition);

            }
            else if(date_id==2){
                sqlCondition=sqlCondition.isEmpty()?"  DATEDIFF (CURRENT_DATE, date_end) >=1":" where "+sqlCondition+"having DATEDIFF (CURRENT_DATE, date_end) >=1";
            }
            else if(date_id==3){
                sqlCondition=sqlCondition.isEmpty()?"  DATEDIFF (CURRENT_DATE, date_end) >=7":" where "+sqlCondition+"DATEDIFF (CURRENT_DATE, date_end) >=7 ";
            }
            else if(date_id==4){
                sqlCondition=sqlCondition.isEmpty()?" DATEDIFF (CURRENT_DATE, date_end) >=14":" where "+sqlCondition+"DATEDIFF (CURRENT_DATE, date_end) >=14";
            }
            else{
                sqlCondition=sqlCondition.isEmpty()?"  DATEDIFF (CURRENT_DATE, date_end) >=30":" where "+sqlCondition+"and DATEDIFF (CURRENT_DATE, date_end) >=30 ";
            }
        }
        //sortd for price
        if(request.getParameter("sortedprice_id") !=null) {
           sortedprice_id=Byte.parseByte(request.getParameter("sortedprice_id"));
            url +="&sortedprice_id="+sortedprice_id;
            System.out.println(url);
            if(sortedprice_id ==1 ){
                sqlCondition =sqlCondition.isEmpty()?" order by percent desc":" where "+sqlCondition+" order by percent desc";
            }else{
                sqlCondition =sqlCondition.isEmpty()?" order by percent asc":" where "+sqlCondition+" order by percent asc";
            }
            } else{
            sqlCondition =sqlCondition.isEmpty()?"":" where "+sqlCondition;

            }


        //Load discount thoa dieu kien
        System.out.println(sql+sqlCondition);
        List<CouponCode> dataCouponCode = Coupon_Con_DB.loadCouponCodeFormSql(sql+sqlCondition);
        request.setAttribute("coupon_code_data",dataCouponCode);
        request.setAttribute("url",url);
        System.out.println(url);
        request.setAttribute("sort_id",sortedprice_id);
        request.setAttribute("cat_id",cat_id);
        request.setAttribute("sortedprice_id",sortedprice_id);
        request.setAttribute("date_id",date_id);

}
}
