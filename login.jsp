<%@page import="java.sql.*"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb", "root", "mani");
        stmt = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
        stmt.setString(1, username);
        stmt.setString(2, password);
        rs = stmt.executeQuery();
        
        if (rs.next()) {
            // Login successful, redirect to home page or dashboard
            session.setAttribute("username", username);
            response.sendRedirect("home.jsp");
        } else {
            // Login failed, show error message
            out.println("<script>alert('Invalid username or password');</script>");
            out.println("<script>window.location.href='index.html';</script>");
        }
    } catch (ClassNotFoundException | SQLException ex) {
        ex.printStackTrace();
        out.println("<script>alert('Something went wrong. Please try again.');</script>");
        out.println("<script>window.location.href='index.html';</script>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
            } 
        catch (SQLException ex) {
            ex.printStackTrace();
            }
}
%>
