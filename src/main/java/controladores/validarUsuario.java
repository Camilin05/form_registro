/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Personal
 */

@WebServlet(name = "validarUsuario", urlPatterns = {"/validarUsuario"})
public class validarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("accion") != null && request.getParameter("accion").equals("registro")) {
            procesarRegistro(request, response);
        } else {
            procesarLogin(request, response);
        }
    }
    
    private void procesarLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String user = request.getParameter("txtusuario");
        String pass = request.getParameter("txtpassword");
        
        boolean esValido = false;
        String mensaje = "";
        
        if("admin".equals(user) && "1234".equals(pass)) {
            esValido = true;
            mensaje = "Inicio de sesión exitoso";
        } else {
            mensaje = "Usuario o contraseña incorrectas";
        }
        
        request.setAttribute("esValido", esValido);
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("usuario", user);
        
        request.getRequestDispatcher("resultado.jsp").forward(request, response);            
    }
    
    private void procesarRegistro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userRegistro = request.getParameter("txtnombre");
        String email = request.getParameter("txtemail");
        String contrasenia = request.getParameter("txtcontrasenia");
        String confirm_Contra = request.getParameter("txtconfirm-contrasenia");
        
        boolean esValido = false;
        String mensaje = "";
        
        
        if (userRegistro != null && !userRegistro.isEmpty() && 
            email != null && !email.isEmpty() && 
            contrasenia != null && !contrasenia.isEmpty() && 
            confirm_Contra != null && !confirm_Contra.isEmpty() &&
            contrasenia.equals(confirm_Contra)) {
            
            esValido = true;
            mensaje = "Registro exitoso. Ya puedes iniciar sesión.";
            
            
            
        } else {
            mensaje = "Error en el registro. Verifica los datos ingresados.";
            
            if (userRegistro == null || userRegistro.isEmpty()) {
                mensaje = "El nombre no puede estar vacío.";
            } else if (email == null || email.isEmpty()) {
                mensaje = "El correo electrónico no puede estar vacío.";
            } else if (contrasenia == null || contrasenia.isEmpty()) {
                mensaje = "La contraseña no puede estar vacía.";
            } else if (confirm_Contra == null || confirm_Contra.isEmpty()) {
                mensaje = "La confirmación de contraseña no puede estar vacía.";
            } else if (!contrasenia.equals(confirm_Contra)) {
                mensaje = "Las contraseñas no coinciden.";
            }
        }
        
        request.setAttribute("esValido", esValido);
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("esRegistro", true);
        request.setAttribute("usuario", userRegistro);
        
        request.getRequestDispatcher("resultado.jsp").forward(request, response);                                              
    }
}