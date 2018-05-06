1. Una de las grandes diferencias es que una entidad del modelo entidad relación
no posee comportamiento, si no más bien que solamente representa los datos.
Mientras que un objeto posee los atributos de una entidad pero también
encapsula el comportamiento de dicha entidad, especificando los mensajes a los
cuales puede responder. 

2. La igualdad de tuplas es por el valor de sus atributos, en tanto que la
igualdad planteada por el modelo orientado a objetos es a través del id.

3.

```
class Coche{ 
    int identificacion
    int matricula
    Fabricante fabricante
    int modelo
    date fecha_adquisicion
    Color color
}

class Color {
    string nombre
}
class Fabricante {
    string nombre
}

class Camion isa Coche {
    float capacidad
}

class Deportivo isa Coche {
    potencia
        req_edad_conductor

}
class Camioneta isa Coche {
    integer numero_plazas
}

TodoTerreno isa Coche {
    altura_bajos
        eje_motor set(dos_ruedas,cuatro_ruedas)
}
```

4. Considérese el esquema de la base de datos relacional orientada a objetos

    - Emp = (nombree, setof(Hijos), setof(Conocimientos))
    - Hijos = (nombre, Cumpleaños)
    - Cumpleaños = (día, mes, año)
    - Conocimientos = (tipo_conocimiento, setof(Exámenes))
    - Exámenes = (año, ciudad)

Escríbanse en SQL:1999 :

- La creación de los tipos y de la relación emp(Emp) los atributos de tipo
  setof(Hijos), setof(Conocimientos) y setof(Exámenes) tienen nombres de
  atributo ConjuntoHijos, ConjuntoConocimientos y ConjuntoExámenes

- Las siguientes consultas:

    a. Hallar los nombres de todos los empleados que tengan hijos nacidos en
       marzo.  

    b. Hallar los empleados que hicieron un examen del tipo de conocimiento 
       «escribir-a-máquina» en la ciudad «San Rafael».  

    c. Indicar todos los tipos de conocimiento de la relación emp.

    d. Mostrar la tabla Emp en 1FN
