package vn.thegioicaycanh.model.blog;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Blog_Con_DB {
    public static Blog loadBlog(int id){
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select * from blog where id=?");
            pe.setInt(1,id);
            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                Blog blog = null;
                if(rs.next()) {
                    blog = getBlog(rs);
                }
                rs.close();
                pe.close();
                return blog;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static Blog getBlog(ResultSet rs){
        if(rs == null)
            return null;
        Blog blog = new Blog();
        try {
                blog.setId(rs.getInt(1));
                blog.setName(rs.getString(2));
                blog.setDescription(rs.getString(3));
                blog.setContent(rs.getString(4));
                blog.setActive(rs.getByte(5)==1? true : false);
                blog.setAvatar(rs.getString(6));
                blog.setDate_created(rs.getDate(7));
                blog.setSlug(rs.getString(8));
                blog.setAdmin_id(rs.getInt(9));
                blog.setNumOfRead(rs.getInt(10));
                return blog;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
       return  null;

    }
    public static List<Blog> mostReadBlogs(int num){
        List<Blog>blogList =new ArrayList<vn.thegioicaycanh.model.blog.Blog>();
        try {
            PreparedStatement pe = DBCPDataSource.getConnection().prepareStatement("select  * from blog order by numOfRead desc limit ?");
            pe.setInt(1,num);
            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                while(rs.next()){
                    blogList.add(getBlog(rs));
                }
                rs.close();
            }
            pe.close();
            return blogList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static List<Blog>loadNewBlogs(int num){
        List<Blog>blogList =new ArrayList<Blog>();
        try {
            PreparedStatement pe = DBCPDataSource.getConnection().prepareStatement("select  * from blog order by date_created desc limit ?");
            pe.setInt(1,num);

            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                while(rs.next()){
                    blogList.add(getBlog(rs));
                }
                rs.close();
            }
            pe.close();
            return blogList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static List<Blog>loadRandomBlog(int num){
        List<Blog>blogList =new ArrayList<Blog>();
        try {
            PreparedStatement pe = DBCPDataSource.getConnection().prepareStatement(" select * from blog order by Rand() limit ?");
            pe.setInt(1,num);

            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                while(rs.next()){
                    blogList.add(getBlog(rs));
                }
                rs.close();
            }
            pe.close();
            return blogList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static List<Blog> loadLimitBlog(int pageNum,int limit){
        List<Blog>blogList =new ArrayList<Blog>();
        try {
            PreparedStatement pe = DBCPDataSource.getConnection().prepareStatement(" select * from blog limit ?,?");
            pe.setInt(1,limit*(pageNum-1)+1);
            pe.setInt(2,pageNum*limit);

            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                while(rs.next()){
                    blogList.add(getBlog(rs));
                }
                rs.close();
            }
            pe.close();
            return blogList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
//        List<Blog>list = loadRandomBlog(3);
        List<Blog> list=loadLimitBlog(1,5);
//        List<Blog> list=loadRandomBlog(3);
        System.out.println(list);
    }

}
