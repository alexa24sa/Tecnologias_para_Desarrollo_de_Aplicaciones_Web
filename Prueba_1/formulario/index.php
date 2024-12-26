<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="./style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
    <title>Login and Registration </title>
</head>
<body>
<header>
    <h2 class="row Logo">Logo</h2>
    <nav class="navigation navbar navbar-expand-lg navbar-light">
        <!-- Botón de la hamburguesa -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
        </button>
        
        <!-- Menú de navegación -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="#" class="nav-link">Inicio</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">Acerca</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">Servicios</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">Contacto</a>
                </li>
                <li class="nav-item">
                    <button class="btnLogin-popup btn btn-primary">Login</button>
                </li>
            </ul>
        </div>
    </nav>
</header>

    <div class="container">
        <div class="row wrapper">
            <span class="icon-close">
                <ion-icon name="close"></ion-icon>
            </span>
            <div class="form-box login">
                <h2>Login</h2>
                <form action="login.php" method="POST">
                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="mail"></ion-icon>
                        </span>
                        <input type="email" name="email" required>
                        <label>Email</label>

                    </div>

                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="lock-closed"></ion-icon>
                        </span>
                        <input type="password" name="password" required>
                        <label>Contraseña</label>
                        
                    </div>

                    <div class="remember-forgot">
                        <label><input type="checkbox"> Recordar</label>
                        <a href="#">¿Olvidaste tu contraseña?</a>
                    </div>
                    <button type="submit" name="login" class="btn">Login</button>
                    <div class="login-register">
                        <p>¿No tienes cuenta?<a href="#" class="register-link"> Registrate</a></p>
                    </div>
                </form>
            </div>

            <div class="form-box register">
                <h2>Registrate</h2>
                <form action="registro.php" method="POST">
                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="person"></ion-icon>
                        </span>
                        <input type="text" name="username" required>
                        <label>Username</label>

                    </div>
                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="mail"></ion-icon>
                        </span>
                        <input type="email" name="email" required>
                        <label>Email</label>

                    </div>

                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="lock-closed"></ion-icon>
                        </span>
                        <input type="password" name="password" required>
                        <label>Contraseña</label>
                        
                    </div>

                    <div class="remember-forgot">
                        <label><input type="checkbox"> Acepto los términos y condiciones</label>
                    </div>
                    <button type="submit" name="registrar" class="btn">Registrar</button>
                    <div class="login-register">
                        <p>¿Ya tienes cuenta?<a href="#" class="login-link"> Ingresa</a></p>
                    </div>
                </form>
            </div>
        </div>

    </div>


    
    <script src="script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>