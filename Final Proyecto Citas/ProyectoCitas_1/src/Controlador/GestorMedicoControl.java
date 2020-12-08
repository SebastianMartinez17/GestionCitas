package Controlador;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.LinkedList;
import javax.swing.table.DefaultTableModel;
public class GestorMedicoControl implements ActionListener {
Modelo.GestorMedico MedicoModelo;
Vista.ConsMedicoInternalFrame consultarMedicoVista;
public GestorMedicoControl(Vista.ConsMedicoInternalFrame consultarMedicoVista)
{
this.consultarMedicoVista=consultarMedicoVista;

MedicoModelo=new Modelo.GestorMedico();
}
public void actionPerformed(ActionEvent e){

DefaultTableModel tmodelo;
String valor=consultarMedicoVista.txt_valor.getText();
int parametro=0;
if(consultarMedicoVista.rdb_Identificacion.isSelected()){
parametro=1;
}
if(consultarMedicoVista.rdb_nombres.isSelected()){
parametro=2;
}
if(consultarMedicoVista.rdb_apellidos.isSelected()){
parametro=3;
}
if(consultarMedicoVista.rdb_genero.isSelected()){
parametro=4;
}
LinkedList<Modelo.Medico> Medico=MedicoModelo.getMedicobyParametro(parametro, valor);
String registro[]=new String[5];
String []Titulos = {"Identificacion","Nombre","Apellidos","Fecha Nacimiento","Genero"};
tmodelo=new DefaultTableModel();
tmodelo.setColumnIdentifiers(Titulos);
for(Modelo.Medico p:Medico){
registro[0]=p.getMeIdentificacion();
registro[1]=p.getMeNombre();
registro[2]=p.getMeApellido();
registro[3]=p.getMefechaNacimiento();
registro[4]=p.getMeGenero();
tmodelo.addRow(registro);
}
consultarMedicoVista.tbl_datos.setModel(tmodelo);
}
}
    
