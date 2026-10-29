# Laboratorio 09 - Sistema de Registro de Contacto (PHP & JSP)

## Integrantes
* Brittany Gonzales Quiñonez

---

## 1. Ciclo de Vida HTTP (Cliente → Servidor)
El flujo de una petición en nuestra aplicación es el siguiente:
1. **Cliente**: El usuario llena el formulario en el navegador (HTML/JSP).
2. **DNS**: El navegador busca la IP de `localhost`.
3. **TCP/IP**: Se establece conexión en el puerto 8000 (Servidor PHP) o 8080 (Tomcat).
4. **HTTP Request**: Se envía un método `POST` con los datos del formulario.
5. **Server + Backend**: El servidor interpreta PHP (`registro.php`) o compila el JSP (`procesar.jsp`). Se validan los datos y se guardan en `$_SESSION` / `HttpSession`.
6. **Response**: El backend genera una tabla HTML con los registros y devuelve un código 200 OK.
7. **Render**: El navegador recibe el HTML y lo dibuja para el usuario.

---

## 2. Matriz Comparativa PHP vs JSP

| Característica | PHP | JSP (Java) |
| :--- | :--- | :--- |
| **Ciclo de vida** | Efímero (se destruye tras la petición). | Persistente (los Servlets se mantienen en memoria). |
| **Gestión de estado** | `$_SESSION` (guardado en archivos por defecto). | `HttpSession` (objetos en memoria RAM gestionados por Tomcat). |
| **Despliegue** | Copiar y pegar en `htdocs` (Apache). | Empaquetar o copiar a `webapps` (Tomcat). |
| **Seguridad (XSS)** | Uso de `htmlspecialchars()`. | Uso de `<%= valor %>` o `<c:out value="..."/>`. |
| **Rendimiento** | Muy rápido para peticiones simples. | Excelente para concurrencia masiva (multihilo). |
| **Madurez** | Gigante (WordPress, Laravel). | Enfocado en empresas (Spring Boot). |

---

## 3. Capturas de Pantalla y Evidencias

### 3.1. Estructura de Carpetas
Organización de los archivos en el entorno de desarrollo (VS Code).
![Estructura de carpetas](captura_01.png)

### 3.2. Despliegue PHP y Respuesta HTTP
Formulario HTML, tabla de registros generada a partir de la sesión `$_SESSION`, y respuesta HTTP (Status 200 OK).

![Formulario PHP](captura_07.png)
![Tabla PHP](captura_08.png)

### 3.3. Seguridad y Validación PHP (Error 405)
Bloqueo del acceso directo por URL (método GET) al script `registro.php`, devolviendo un código HTTP 405 Method Not Allowed.

![Error 405 PHP](captura_04.png)

### 3.4. Despliegue JSP
Formulario implementado en JSP con almacenamiento en `HttpSession` y su respectiva tabla de registros.

![Formulario JSP](captura_05.png)
![Tabla JSP](captura_06.png)

### 3.5. Logs de Servidores y Respuestas HTTP
Registro de peticiones en las consolas de los servidores (PHP Development Server y Apache Tomcat) e inspección de red con la pestaña Network.

![Logs PHP](captura_02.png)
![Network HTTP](captura_03.png)