# the_bloc_app

Esta aplicación es un ejemplo didáctico que muestra cómo implementar **Clean Architecture** junto con **BLoC** en Flutter.

## Arquitectura

El proyecto se divide en tres capas:

- **Data:**  
  - **Data Sources:** Simulan la obtención de datos (por ejemplo, almacenamiento local o remoto).
  - **Models & Mappers:** Se encargan de transformar datos entre la capa de datos y el dominio.
  - **Repositories Implementation:** Implementan los contratos definidos en la capa de dominio.

- **Domain:**  
  - **Entities:** Representan los modelos centrales de la aplicación.
  - **Repository Contracts:** Definen las operaciones disponibles sin conocer la implementación.
  - **Use Cases:** Casos de uso que encapsulan la lógica de negocio.

- **Presentation:**  
  - **BLoC:** Gestiona la lógica de presentación y la comunicación entre la UI y los casos de uso.
  - **Widgets/Páginas:** Solo contienen código de presentación y delegan la lógica de negocio al BLoC.

![Diagrama de Arquitectura](https://via.placeholder.com/600x400?text=Diagrama+de+Arquitectura)

## Flujo de Datos

1. **UI:** El usuario interactúa con la interfaz (p. ej., presiona un botón).
2. **BLoC:** Se emite un evento que desencadena la lógica correspondiente.
3. **Use Case:** El BLoC invoca el caso de uso para ejecutar la lógica de negocio.
4. **Repository:** El caso de uso utiliza el repositorio para acceder a los datos.
5. **Data Source:** El repositorio obtiene o modifica los datos a través de la fuente de datos.
6. **Respuesta:** La respuesta se propaga hacia atrás, actualizando el estado en el BLoC y, finalmente, la UI.

## Inyección de Dependencias

Se utiliza **get_it** para la inyección de dependencias, lo que facilita la escalabilidad y testeo de la aplicación.

## Pruebas

Se incluyen pruebas unitarias para:

- **BLoC:** Verificar las transiciones de estado.
- **Use Cases:** Validar la lógica de negocio.
- **Repositories:** Comprobar la integración con la capa de datos.

## Dependencias

- **flutter_bloc:** Manejo del estado con BLoC.
- **equatable:** Simplifica la comparación de estados y eventos.
- **get_it:** Inyección de dependencias.
- **bloc_test:** Utilizado para pruebas del BLoC.
- **mockito:** Para crear mocks en pruebas.

## Cómo Ejecutar

1. Instala las dependencias:
   ```bash
   flutter pub get

