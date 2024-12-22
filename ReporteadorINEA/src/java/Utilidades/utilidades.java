/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilidades;

/**
 *
 * @author Karen
 */
public class utilidades {
  
    public static String formatoHoras(float horas) {
        int horasInt = (int) horas;
        int minutos = (int) ((horas - horasInt) * 60);
        int segundos = (int) (((horas - horasInt) * 60 - minutos) * 60);
        return String.format("%02d:%02d:%02d", horasInt, minutos, segundos);
    }
    
    // Método para convertir minutos a formato HH:mm
    public static String convertirHorasAMinutos(int minutos) {
        int horas = minutos / 60; // Calcula las horas
        int minRestantes = minutos % 60; // Calcula los minutos restantes

        // Devuelve en formato HH:mm
        return String.format("%02d:%02d", horas, minRestantes);
    }
}

