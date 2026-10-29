<?php
// 1. Manejo de Sesión (siempre al principio y sin avisos)
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// 2. Lógica para el botón de Limpiar Tabla
if (isset($_GET['limpiar'])) {
    $_SESSION['registros'] = []; // Vaciamos la sesión
    header("Location: index.html"); // Volvemos al formulario para empezar de cero
    exit;
}

// 3. Validar que sea método POST para registrar
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    exit('Método no permitido. Debes enviar el formulario.');
}

// 4. Sanitizar y validar entradas
$nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_SPECIAL_CHARS);
$correo = filter_input(INPUT_POST, 'correo', FILTER_VALIDATE_EMAIL);

// Validar que el nombre no tenga números (Backend)
if ($nombre && !preg_match("/^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$/", $nombre)) {
    http_response_code(400);
    exit('Error 400: El nombre solo debe contener letras.');
}

if (!$nombre || !$correo) {
    http_response_code(400);
    exit('Datos inválidos. Verifica el nombre y el correo.');
}

// 5. Guardar el registro en la sesión
$_SESSION['registros'][] = ['nombre' => $nombre, 'correo' => $correo];
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Resultados PHP</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; }
        body { background-color: #f4f4f5; min-height: 100vh; display: grid; place-items: center; padding: 20px; }
        .card { background: #ffffff; padding: 40px; border-radius: 8px; border: 1px solid #e4e4e7; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05); width: 100%; max-width: 700px; }
        h1 { color: #18181b; text-align: center; margin-bottom: 25px; font-size: 20px; font-weight: 600; }
        .table-container { overflow-x: auto; border-radius: 6px; border: 1px solid #e4e4e7; margin-bottom: 25px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 14px 16px; text-align: left; border-bottom: 1px solid #e4e4e7; font-size: 14px; }
        th { background-color: #f4f4f5; color: #52525b; font-weight: 600; text-transform: uppercase; font-size: 12px; }
        td { color: #18181b; }
        tr:last-child td { border-bottom: none; }
        
        .acciones { display: flex; gap: 10px; }
        .btn { display: inline-block; text-align: center; text-decoration: none; padding: 10px 16px; background: #ffffff; color: #18181b; border: 1px solid #d4d4d8; border-radius: 6px; font-weight: 500; font-size: 14px; transition: background 0.2s; cursor: pointer; }
        .btn:hover { background: #f4f4f5; }
        .btn-limpiar { color: #b91c1c; border-color: #fca5a5; }
        .btn-limpiar:hover { background: #fef2f2; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Registros Almacenados (PHP)</h1>
        <div class="table-container">
            <table>
                <tr><th>Nombre</th><th>Correo Electrónico</th></tr>
                <?php if (isset($_SESSION['registros']) && count($_SESSION['registros']) > 0): ?>
                    <?php foreach ($_SESSION['registros'] as $registro): ?>
                        <tr>
                            <td><?= htmlspecialchars($registro['nombre']) ?></td>
                            <td><?= htmlspecialchars($registro['correo']) ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr><td colspan="2" style="text-align: center;">No hay registros en la sesión.</td></tr>
                <?php endif; ?>
            </table>
        </div>
        <div class="acciones">
            <a href="index.html" class="btn">Volver al Formulario</a>
            <a href="registro.php?limpiar=1" class="btn btn-limpiar">Limpiar Tabla de Pruebas</a>
        </div>
    </div>
</body>
</html>