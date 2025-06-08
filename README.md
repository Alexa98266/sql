<!DOCTYPE html>
<html>
<head><title>Login Inseguro</title></head>
<body>
<h2>Formulario de Login (Vulnerable a SQL Injection)</h2>
<form method="POST">
    Usuario: <input type="text" name="usuario"><br>
    <input type="submit" value="Iniciar sesión">
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = $_POST["usuario"];
    $conn = new mysqli("localhost", "root", "", "prueba_seguridad");

    if ($conn->connect_error) {
        die("Error de conexión: " . $conn->connect_error);
    }

    $sql = "SELECT id, nombre_usuario, correo FROM usuarios WHERE nombre_usuario = '$usuario'";
    $result = $conn->query($sql);

    echo "<h3>Resultado:</h3>";
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            echo "ID: " . $row["id"] . " - Usuario: " . $row["nombre_usuario"] . " - Email: " . $row["correo"] . "<br>";
        }
    } else {
        echo "No se encontraron resultados.";
    }
    $conn->close();
}
?>
</body>
</html>
