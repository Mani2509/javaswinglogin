<%@page import="java.sql.*"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");
    
    if (!password.equals(confirmPassword)) {
        // Passwords don't match, show error message
        out.println("<script>alert('Passwords don\\'t match');</script>");
        out.println("<script>window.location.href='registration.html';</script>");
        return;
    }
    
    Connection conn = null;
    PreparedStatement stmt = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb", "root", "mani");
        stmt = conn.prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)");
        stmt.setString(1, username);
        stmt.setString(2, password);
        int rows = stmt.executeUpdate();
        
        if (rows > 0) {
            // Registration successful, redirect to login page
            out.println("<script>alert('Registration successful');</script>");
            out.println("<script>window.location.href='login.html';</script>");
        } else {
            // Registration failed, show error message
            out.println("<script>alert('Registration failed');</script>");
            out.println("<script>window.location.href='registration.html';</script>");
        }
    } catch (ClassNotFoundException | SQLException ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>