
package Controlador;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.SimpleDateFormat;


public class MedicoControl implements ActionListener{
    
    Vista.RegMedicoInternalFrame medicoVista;
    Modelo.Medico medicoModelo;
    Modelo.GestorMedico gestorMedicoModelo;
    
    
    public MedicoControl(Vista.RegMedicoInternalFrame medicoVista){
        
        this.medicoVista=medicoVista;
        gestorMedicoModelo= new Modelo.GestorMedico();
    }
@Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(medicoVista.btnGuardar)){
         String identificacion= medicoVista.MedIdentificacion.getText();
         String nombre= medicoVista.MedNombre.getText();
         String apellidos=medicoVista.MedApellido.getText();
         SimpleDateFormat formato=new SimpleDateFormat("dd/mm/yyyy");
         String fecha_nacimiento=formato.format(medicoVista.Dtd_fecha_nacimiento.getDate());        
         String genero="";
         if(medicoVista.rdb_masculino.isSelected()){
genero="M";
}
if(medicoVista.rdb_femenino.isSelected()){
genero="F";
}
         medicoModelo=new Modelo.Medico(identificacion, nombre, apellidos,fecha_nacimiento,genero);

        gestorMedicoModelo.RegistrarMedico(medicoModelo);

        }

        if(e.getSource().equals(medicoVista.btnNuevo)){
          medicoVista.MedIdentificacion.setText("");
          medicoVista.MedNombre.setText("");
          medicoVista.MedApellido.setText("");
          medicoVista.Dtd_fecha_nacimiento.setDate(null);
          medicoVista.rdb_masculino.setSelected(true);
          medicoVista.rdb_femenino.setSelected(false);
          medicoVista.MedIdentificacion.requestFocus();
             }
        }
    
}
