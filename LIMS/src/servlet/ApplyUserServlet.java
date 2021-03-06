package servlet;

import domain.Application;
import service.implement.UserServiceImplement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//查看申请表（旧）
@WebServlet("/applyUserServlet")
public class ApplyUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //调用UserService的方法 查询
        UserServiceImplement service = new UserServiceImplement();
        List<Application> applications = service.applyUser();

        //将list存入request域
        request.setAttribute("application", applications);

        //转发回shsq.jsp
        request.getRequestDispatcher("/shsq.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
