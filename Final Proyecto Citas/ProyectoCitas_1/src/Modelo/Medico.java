/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author juan2
 */
public class Medico {
    
    public String MeIdentificacion;
    public String MeNombre;
    public String MeApellido;
    public String MefechaNacimiento;
    public String MeGenero;

    public Medico(String MeIdentificacion, String MeNombre, String MeApellido, String MefechaNacimiento, String MeGenero) {
        this.MeIdentificacion = MeIdentificacion;
        this.MeNombre = MeNombre;
        this.MeApellido = MeApellido;
        this.MefechaNacimiento = MefechaNacimiento;
        this.MeGenero = MeGenero;
    }

    public Medico() {
    }

    public String getMeIdentificacion() {
        return MeIdentificacion;
    }

    public void setMeIdentificacion(String MeIdentificacion) {
        this.MeIdentificacion = MeIdentificacion;
    }

    public String getMeNombre() {
        return MeNombre;
    }

    public void setMeNombre(String MeNombre) {
        this.MeNombre = MeNombre;
    }

    public String getMeApellido() {
        return MeApellido;
    }

    public void setMeApellido(String MeApellido) {
        this.MeApellido = MeApellido;
    }

    public String getMefechaNacimiento() {
        return MefechaNacimiento;
    }

    public void setMefechaNacimiento(String MefechaNacimiento) {
        this.MefechaNacimiento = MefechaNacimiento;
    }

    public String getMeGenero() {
        return MeGenero;
    }

    public void setMeGenero(String MeGenero) {
        this.MeGenero = MeGenero;
    }
 
    
}
