package pkg1_Classe_Abstrata;

public class Quadrado extends FormaGeometrica{
    public float lado;
    @Override
    float calcularArea() {
        return lado*lado;
    }
    
}
