# SM2_EXAMEN_PRACTICO

## Información del curso y alumno
- Nombre del curso: Soluciones moviles II
- Nombre del alumno: Daleska Nicolle Fernandez Villanueva
- Fecha: 21/10/25

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
