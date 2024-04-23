/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 * Categoria
 * @author maria- sofia
 */
public class Categoria {
    /**
     * Atributos
     */
    
    int id; 
    String categoria; 
    
    /**
     * Constructores
     */
    public Categoria() {
    }

    public Categoria(int id, String categoria) {
        this.id = id;
        this.categoria = categoria;
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

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
    
}
