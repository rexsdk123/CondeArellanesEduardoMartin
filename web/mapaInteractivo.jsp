<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mapa interactivo</title>

    <!-- Icono -->
    <link rel="shortcut icon" href="img/inflable.png" type="image/x-icon">

    <!-- CSS INTERNO -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f8fb;
        }

        header {
            background-color: #0a3d62;
            color: white;
            text-align: center;
            padding: 20px;
        }

        .contenedor {
            width: 90%;
            max-width: 1100px;
            margin: 30px auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .info {
            font-size: 16px;
            line-height: 1.6;
        }

        .highlight {
            color: #e67e22;
            font-weight: bold;
        }

        .nota {
            font-size: 14px;
            color: #555;
            margin-top: 10px;
        }

        .mapa {
            width: 100%;
            height: 400px;
            border: none;
            border-radius: 10px;
            margin-top: 10px;
        }

        footer {
            text-align: center;
            padding: 15px;
            background: #0a3d62;
            color: white;
            margin-top: 30px;
        }

        /* RESPONSIVO */
        @media (min-width: 768px) {
            .contenedor {
                flex-direction: row;
            }

            .card {
                flex: 1;
            }
        }
    </style>
</head>

<body>

<header>
    <h1>Zona de Entrega</h1>
    <p>Servicio de renta de inflables</p>
</header>

<div class="contenedor">

    <div class="card">
        <h2>🚚 Envío sin costo</h2>

        <p class="info">
            Ofrecemos entrega <span class="highlight">totalmente GRATIS</span> dentro de un radio de 
            <span class="highlight">10 km</span> desde nuestra ubicación.
        </p>

        <p class="info">
            Si tu evento se encuentra fuera de esta zona, se aplicará un costo adicional dependiendo de la distancia.
        </p>

        <p class="nota">
            *El costo extra se calcula automáticamente al momento de realizar tu pedido.
        </p>
    </div>

    <div class="card">
        <h2>📍 Zona de cobertura</h2>

        <iframe 
            class="mapa"
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d120467.44258857447!2d-99.13257331298091!3d19.34282738141643!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85ce028207270789%3A0xc1e59250ec54f8a9!2sIztapalapa%2C%20Ciudad%20de%20M%C3%A9xico%2C%20CDMX!5e0!3m2!1ses-419!2smx!4v1776799598671!5m2!1ses-419!2smx"
            allowfullscreen=""
            loading="lazy">
        </iframe>

        <p class="nota">
            *El área mostrada es aproximada.
        </p>
    </div>

</div>

<footer>
    © 2026 Renta de Inflables - Todos los derechos reservados
</footer>

</body>

</html>
