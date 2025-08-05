package pkg1_Classe_Abstrata;

public class Triangulo extends FormaGeometrica {
    public float base;
    public float altura;

    @Override
    float calcularArea() {
        return (base*altura)/2;
    }
    
}
