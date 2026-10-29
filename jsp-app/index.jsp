<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Contacto - JSP</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
        }

        body {
            /* Fondo rosa palo / gris cálido muy sutil */
            background-color: #faf7f8;
            min-height: 100vh;
            display: grid;
            place-items: center;
            padding: 20px;
        }

        .card {
            background: #ffffff;
            padding: 40px;
            border-radius: 12px;
            border: 1px solid #f0e6e8;
            box-shadow: 0 8px 24px rgba(212, 106, 133, 0.08); /* Sombra con un toque rosado */
            width: 100%;
            max-width: 440px;
        }

        h1 {
            color: #3f3d40;
            text-align: center;
            margin-bottom: 25px;
            font-size: 22px;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #78757a;
            font-size: 14px;
            font-weight: 500;
        }

        input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #e6d6da;
            border-radius: 8px;
            font-size: 14px;
            color: #3f3d40;
            background-color: #fcfbfc;
            transition: all 0.2s ease;
        }

        input:focus {
            outline: none;
            border-color: #d46a85; /* Rosa viejo elegante */
            background-color: #ffffff;
            box-shadow: 0 0 0 3px rgba(212, 106, 133, 0.15);
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #d46a85;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s;
            margin-top: 10px;
        }

        button:hover {
            background-color: #c15974;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Registro de Contacto</h1>
        <form action="procesar.jsp" method="POST">
            <div class="form-group">
                <label for="nombre">Nombre completo</label>
                <!-- Restricción de solo letras desde el navegador -->
                <input type="text" id="nombre" name="nombre" required 
                       placeholder="Ej. María Fernanda" 
                       pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+" 
                       title="Solo se permiten letras y espacios">
            </div>
            <div class="form-group">
                <label for="correo">Correo electrónico</label>
                <input type="email" id="correo" name="correo" required placeholder="nombre@ejemplo.com">
            </div>
            <button type="submit">Enviar Registro</button>
        </form>
    </div>
</body>
</html>