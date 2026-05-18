package paquetito;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 * @author ArrayLabs
 */
public class insertarDatosTraerPedido {
    protected String nombreUsuario;
    protected String producto;
    protected String categoria;
    protected float precio;
    protected int idRenta;
    protected LocalDate FI;
    protected LocalDate FF;
    protected LocalTime HI;
    protected LocalTime HF;

    public int getIdRenta() {
        return idRenta;
    }

    public void setIdRenta(int idRenta) {
        this.idRenta = idRenta;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public LocalDate getFI() {
        return FI;
    }

    public void setFI(LocalDate FI) {
        this.FI = FI;
    }

    public LocalDate getFF() {
        return FF;
    }

    public void setFF(LocalDate FF) {
        this.FF = FF;
    }

    public LocalTime getHI() {
        return HI;
    }

    public void setHI(LocalTime HI) {
        this.HI = HI;
    }

    public LocalTime getHF() {
        return HF;
    }

    public void setHF(LocalTime HF) {
        this.HF = HF;
    }

    
}
