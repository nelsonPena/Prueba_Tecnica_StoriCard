# iOS Clean Architecture with VIPER and Unit Testing

## Descripción

Este proyecto es una aplicación iOS que implementa la **Arquitectura Limpia** y utiliza el patrón **VIPER** para la presentación. La solución también incluye **pruebas unitarias** para garantizar la calidad y el funcionamiento correcto del código. 

### Arquitectura

La arquitectura del proyecto está basada en los principios de la **Arquitectura Limpia** y utiliza el patrón **VIPER** para la capa de presentación. La aplicación está organizada en los siguientes componentes:

- **Entities**: Modelos de datos que representan la información que la aplicación maneja.
- **Use Cases**: Contienen la lógica de negocio y coordinan el flujo de datos entre los componentes.
- **Interfaces**: Definen los protocolos para la comunicación entre componentes.
- **Data**: Implementaciones concretas de los repositorios y servicios que interactúan con la fuente de datos.

### Arquitectura VIPER

**VIPER** es una arquitectura para la capa de presentación que divide las responsabilidades en cinco componentes:

1. **View**: Presenta la información y maneja las interacciones del usuario.
2. **Interactor**: Contiene la lógica de negocio y obtiene datos.
3. **Presenter**: Formatea los datos del Interactor para la Vista.
4. **Entity**: Modela los datos utilizados por el Interactor.
5. **Router**: Maneja la navegación entre pantallas.
