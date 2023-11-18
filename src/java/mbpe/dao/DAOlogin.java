/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package mbpe.dao;

public interface DAOlogin {

    boolean VerificarUser(String username, String contraseña); //Verificar username y contraseña

    void RegistrarUser(String correo, String username, String contraseña); //Insertar usuario contraseña y correo
}
