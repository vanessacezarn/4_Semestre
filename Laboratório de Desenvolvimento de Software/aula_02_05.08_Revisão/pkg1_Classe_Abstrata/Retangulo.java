
package pkg1_Classe_Abstrata;

public class Retangulo extends FormaGeometrica {
    public float base;
    public float altura;

    @Override
    float calcularArea() {
        return base*altura;
    }
    
}
