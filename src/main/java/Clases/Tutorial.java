/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 * Clase tutorial
 * @author maria-Sofia
 */
public class Tutorial {
    
    /**
     * Atributos
     */
    private int id;
    private String nombre;
    private int prioridad;
    private String estado;
    private String categoria;
    private String url;
    
    /**
     * Constructor
     */
    public Tutorial() {
    }

    public Tutorial(int id, String nombre, int prioridad, String estado, String categoria, String url) {
        this.id = id;
        this.nombre = nombre;
        this.prioridad = prioridad;
        this.estado = estado;
        this.categoria = categoria;
        this.url = url;
    }
    /**
     * Getter and Setter
     */
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(int prioridad) {
        this.prioridad = prioridad;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    
}
