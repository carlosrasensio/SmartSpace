# SmartSpace

SmartSpace es una aplicación iOS desarrollada con SwiftUI que permite a los usuarios explorar, gestionar y destacar espacios (como oficinas, salas, o ubicaciones) con información detallada y visualizaciones. La app ofrece funcionalidades para filtrar, buscar y marcar espacios como destacados, con una experiencia fluida y moderna.

---

## Índice

- [Descripción General](#descripción-general)
- [Arquitectura y Tecnologías](#arquitectura-y-tecnologías)
- [Características Principales](#características-principales)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Flujo de Navegación](#flujo-de-navegación)
- [Gestión de Datos y Persistencia](#gestión-de-datos-y-persistencia)
- [Diseño UX/UI](#diseño-ux-ui)
- [Componentes Clave](#componentes-clave)
- [Mejoras Futuras](#mejoras-futuras)
- [Cómo Ejecutar el Proyecto](#cómo-ejecutar-el-proyecto)

---

## Descripción General

SmartSpace permite a los usuarios navegar entre diferentes espacios, visualizar detalles específicos, y gestionar una serie de espacios destacados. La aplicación está diseñada para ofrecer una experiencia intuitiva con soporte para búsquedas, filtros y visualización en mapa.

---

## Arquitectura y Tecnologías

- **SwiftUI:** Framework principal para la construcción de la interfaz de usuario declarativa.
- **SwiftData:** Para la gestión y persistencia de datos locales, incluyendo la funcionalidad de espacios destacados.
- **MVVM (Model-View-ViewModel):** Patrón arquitectónico para separar la lógica de negocio de la UI.
- **@Observable y @Query:** Para la reactividad y sincronización automática de datos.
- **NavigationStack y TabView:** Para la navegación estructurada y pestañas principales.

---

## Características Principales

- **Listado de espacios:** Visualización de todos los espacios disponibles o solo los destacados.
- **Búsqueda y filtrado:** Permite buscar espacios por nombre y filtrar por categoría.
- **Detalle de espacio:** Información detallada con variables de sensores y descripción.
- **Gestión de destacados:** Marcar o desmarcar espacios como favoritos con persistencia local.
- **Toast notifications:** Mensajes temporales que confirman acciones de marcado/desmarcado.
- **Vista en mapa:** Visualización geográfica de los espacios (implementación básica).

---

## Estructura del Proyecto

- **Views:**
  - `SpaceMainView`: Vista principal con pestañas (Colección, Mapa, Destacados).
  - `SpaceContainerView`: Lista de espacios filtrados y buscados.
  - `SpaceDetailView`: Detalle individual de cada espacio.
  - Componentes auxiliares: `SearchBarView`, `FilterMenuView`, `SpaceGridView`.
  
- **ViewModels:**
  - `SpaceContainerViewModel`: Lógica para filtrado y búsqueda.
  - `SpaceDetailViewModel`: Gestión del estado destacado y toast.
  
- **Modelos:**
  - `SpaceItem`: Modelo principal que representa un espacio, con propiedades como `id`, `name`, `category`, `temperature`, etc.
  
- **Persistencia:**
  - Uso de SwiftData para almacenar espacios destacados.
  - Uso de `@Query` para sincronizar datos en tiempo real.

---

## Flujo de Navegación

1. **Pantalla principal (`SpaceMainView`):** Pestañas para navegar entre Colección (todos los espacios), Mapa y Destacados.
2. **Listado de espacios (`SpaceContainerView`):** Muestra espacios según el modo (todos o destacados), con búsqueda y filtros.
3. **Detalle de espacio (`SpaceDetailView`):** Muestra información detallada y permite marcar/desmarcar como destacado.
4. **Actualización de estado:** Cambios en destacados se reflejan automáticamente en las listas y persistencia.

---

## Gestión de Datos y Persistencia

- Los espacios destacados se almacenan localmente usando SwiftData.
- La vista usa `@Query` para obtener los espacios destacados en tiempo real.
- El ViewModel sincroniza el estado `isTracked` con la base de datos para reflejar si un espacio está guardado.
- Al marcar o desmarcar un espacio, se inserta o elimina la instancia gestionada en el contexto de SwiftData.
- Se maneja correctamente la eliminación buscando la instancia gestionada para evitar inconsistencias.

---

## Diseño UX/UI

Se puede ver un primer boceto en el [prototipo de Excalidraw](https://excalidraw.com/#json=t2_kt9vINqe7BEaKqVAE0,-SMezT70c_FAdhOeMjLuAw).

Se puede ver un primer diseño en el [prototipo de Figma](https://www.figma.com/make/09sDUowYuZLrX3bXMraj2b/iOS-Location-Collection-App?node-id=0-4&t=tZJtWRKj3hdkJDr4-1).


---

## Componentes Clave

- **Toast personalizado:** Mensajes que aparecen y desaparecen automáticamente para confirmar acciones.
- **Filtros dinámicos:** Permiten seleccionar categorías y buscar espacios por texto.
- **Sincronización reactiva:** Uso de `@Observable` y `@Query` para mantener la UI actualizada sin esfuerzo manual.
- **Gestión de contexto:** Uso correcto de `ModelContext` para inserciones y eliminaciones.
- **Visualización de Datos con SwiftCharts:** En la sección de detalles de cada espacio, se ha implementado una gráfica básica que muestra la variación mensual de la temperatura y el consumo energético utilizando la librería nativa **SwiftCharts** de iOS.

---

## Mejoras Futuras

- **Gráficos y visualizaciones avanzadas:** Incorporar gráficos dinámicos y detallados en la vista de detalle para mostrar variables de sensores y otros datos relevantes de forma visual e interactiva utilizando SwiftCharts.

- **Mejora de la vista de mapa:** Añadir anotaciones interactivas para mejorar la experiencia de navegación geográfica de los espacios.

- **Sincronización en la nube:** Implementar sincronización de datos entre dispositivos usando CloudKit o similar para que los espacios destacados y configuraciones se mantengan actualizadas en todos los dispositivos del usuario.

- **Optimización para grandes volúmenes de datos:** Mejorar el rendimiento y la gestión de memoria para manejar colecciones muy grandes de espacios sin afectar la experiencia de usuario.

- **Tests automatizados:** Añadir pruebas unitarias y de interfaz para asegurar la estabilidad y calidad del código, facilitando futuras modificaciones y mantenimiento.

- **Mejoras en la accesibilidad:** Asegurar que la app sea completamente accesible, incluyendo soporte para VoiceOver, Dynamic Type y otros ajustes de accesibilidad.

- **Modo oscuro personalizado:** Ajustar estilos y colores para ofrecer una experiencia visual óptima en modo oscuro, manteniendo coherencia y legibilidad.

- **Internacionalización:** Añadir soporte para múltiples idiomas para ampliar la base de usuarios.

- **Notificaciones push:** Implementar notificaciones para alertar a los usuarios sobre cambios importantes o novedades en los espacios destacados.

- **Integración con Siri y Atajos:** Permitir acciones rápidas y comandos de voz para gestionar espacios destacados o buscar información.

- **Mejoras en la UI/UX:** Refinar animaciones, transiciones y diseño para una experiencia más fluida y atractiva.

- **Gestión avanzada de filtros:** Permitir combinaciones múltiples de filtros y guardado de configuraciones personalizadas.

- **Modo offline:** Mejorar la experiencia cuando no hay conexión a internet, con almacenamiento y sincronización diferida.

- **Soporte para iPad y macOS:** Adaptar la interfaz para pantallas más grandes y aprovechar características específicas de cada plataforma.

---

## Cómo Ejecutar el Proyecto

1. Clona el repositorio:

   ```bash
   git clone https://github.com/carlosrasensio/SmartSpace.git
   cd SmartSpace