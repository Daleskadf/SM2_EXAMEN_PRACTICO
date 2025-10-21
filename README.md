# SM2_EXAMEN_PRACTICO

## Información del curso y alumno
- Nombre del curso: Soluciones moviles II
- Nombre del alumno: Daleska Nicolle Fernandez Villanueva
- Fecha: 21/10/25
- Link de repositorio: https://github.com/Daleskadf/SM2_EXAMEN_PRACTICO

---

## Descripción del proyecto
MovUni es una aplicación móvil desarrollada con Flutter que facilita la gestión de movilidad estudiantil y transporte compartido. 

---

## Historia de usuario (principal entregada)
Como usuario autenticado, quiero ver un historial de mis inicios de sesión, para saber cuándo y desde qué dispositivo accedí a mi cuenta.

Criterios de Aceptación
- Al iniciar sesión exitosamente, se registra el usuario, la fecha y hora del inicio, así como la dirección IP desde donde inició sesión.
- En la sección "Historial de inicios de sesión", el usuario puede ver una lista con:
  - Usuario, la Fecha y hora de inicio de sesión
- Los registros se deben mostrar ordenados del más reciente al más antiguo.

---

## Funcionalidades implementadas (resumen)
- Autenticación con Firebase Auth (login, recuperación de contraseña).
- Registro de historial de inicios de sesión en Firestore (`login_history` collection) con:
  - user id
  - email
  - timestamp (serverTimestamp)
  - device (p. ej. Android/iOS/Web)
- Pantalla `LoginHistoryScreen` para listar inicios de sesión propios.
- Acceso al historial desde el Drawer del dashboard (Conductor/Estudiante).
- Actualización de `lastLogin` en el documento `users` al iniciar sesión.

---
## Capturas de pantalla (evidencias)
Coloca las imágenes dentro de la carpeta `screenshots/` en el repositorio y referencialas con las rutas que aparecen debajo. Si ya subiste las imágenes, verifica que sus nombres coincidan exacto con los usados aquí.

1) screenshots/03_login_screen.png  
   - Descripción / caption: Pantalla de inicio de sesión. Se muestra un correo institucional (df2021050608@virtual.upt.pe), el campo contraseña y el botón "Iniciar Sesión". (Verifica la restricción de dominio @virtual.upt.pe en el flujo).

   (imagenes/1.png)

2) screenshots/04_drawer.png  
   - Descripción / caption: Drawer del dashboard con el menú abierto. Aquí se observa el ítem "Historial de Inicios de Sesión" (nuevo acceso implementado).

   (imagenes/2.png)

3) screenshots/05_login_history_list.png  
   - Descripción / caption: Pantalla "Historial de Inicios de Sesión" con la lista de registros del usuario (email, fecha/hora formateada y dispositivo). Los registros aparecen ordenados del más reciente al más antiguo.

  (imagenes/3.png)

4) screenshots/06_firestore_doc_example.png  
   - Descripción / caption: Captura de la consola de Firebase Firestore donde se muestra un documento del `login_history`. Campos visibles: device ("TargetPlatform.android"), email, ip (vacío), timestamp y userId.

   (imagenes/4.png)
