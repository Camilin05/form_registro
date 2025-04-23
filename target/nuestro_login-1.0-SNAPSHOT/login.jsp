<!DOCTYPE html>
<html>
    <head>
        <title>Ingreso de usuario</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            
            body {
                height: 100vh;
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                background: linear-gradient(135deg, #4b6cb7, #182848);
                background-size: 400% 400%;
                animation: gradient 15s ease infinite;
            }
            
            @keyframes gradient {
                0% {
                    background-position: 0% 50%;
                }
                50% {
                    background-position: 100% 50%;
                }
                100% {
                    background-position: 0% 50%;
                }
            }
            
            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 150%;
                max-width: 620px;
                padding: 20px;
            }
            
            .form {
                width: 100%;
                display: flex;
                flex-direction: column;
                gap: 15px;
                padding: 2em;
                background-color: rgba(23, 23, 23, 0.9);
                border-radius: 16px;
                transition: .4s ease-in-out;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            }
            
            .form:hover {
                transform: scale(1.02);
                box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
            }
            
            #heading {
                text-align: center;
                margin-bottom: 1.5em;
                color: rgb(255, 255, 255);
                font-size: 1.5em;
                font-weight: 600;
            }
            
            .field {
                display: flex;
                align-items: center;
                gap: 0.8em;
                border-radius: 12px;
                padding: 0.8em;
                border: none;
                outline: none;
                color: white;
                background-color: #252525;
                box-shadow: inset 2px 5px 10px rgb(5, 5, 5);
            }
            
            .input-icon {
                height: 1.3em;
                width: 1.3em;
                fill: white;
            }
            
            .input-field {
                background: none;
                border: none;
                outline: none;
                width: 100%;
                color: #d3d3d3;
                font-size: 1em;
            }
            
            .input-field::placeholder {
                color: #aaa;
            }
            
            .form .btn {
                
                display: flex;
                align-content: center;
                margin-top: 2em;
            }
            
            .button1, .button2 {
                padding: 0.9em 1.5em;
                border-radius: 8px;
                border: none;
                outline: none;
                transition: .3s ease-in-out;
                background-color: #3a86ff;
                color: white;
                font-weight: 600;
                cursor: pointer;
                width: 48%;
                margin-left:123px;
            }
            
            .button1:hover, .button2:hover {
                background-color: #2667cc;
                transform: translateY(-3px);
            }
            
            .button3 {
                margin-top: 1em;
                padding: 0.7em;
                border-radius: 8px;
                border: none;
                outline: none;
                transition: .3s ease-in-out;
                background-color: transparent;
                color: #aaa;
                cursor: pointer;
                width: 100%;
                font-size: 0.9em;
            }
            
            .button3:hover {
                color: white;
                background-color: rgba(255, 255, 255, 0.1);
            }
            
            @media (max-width: 480px) {
                .form {
                    padding: 1.5em;
                }
                
                .btn { 
                    flex-direction: column;
                    gap: 10px;
                }
                
                .button1, .button2 {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <form class="form" action="validarUsuario" method="post">
                <p id="heading">Iniciar Sesión</p>
                <div class="field">
                    <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M13.106 7.222c0-2.967-2.249-5.032-5.482-5.032-3.35 0-5.646 2.318-5.646 5.702 0 3.493 2.235 5.708 5.762 5.708.862 0 1.689-.123 2.304-.335v-.862c-.43.199-1.354.328-2.29.328-2.926 0-4.813-1.88-4.813-4.798 0-2.844 1.921-4.881 4.594-4.881 2.735 0 4.608 1.688 4.608 4.156 0 1.682-.554 2.769-1.416 2.769-.492 0-.772-.28-.772-.76V5.206H8.923v.834h-.11c-.266-.595-.881-.964-1.6-.964-1.4 0-2.378 1.162-2.378 2.823 0 1.737.957 2.906 2.379 2.906.8 0 1.415-.39 1.709-1.087h.11c.081.67.703 1.148 1.503 1.148 1.572 0 2.57-1.415 2.57-3.643zm-7.177.704c0-1.197.54-1.907 1.456-1.907.93 0 1.524.738 1.524 1.907S8.308 9.84 7.371 9.84c-.895 0-1.442-.725-1.442-1.914z"></path>
                    </svg>
                    <input autocomplete="off" placeholder="Usuario" class="input-field" type="text" name="txtusuario">
                </div>
                <div class="field">
                    <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"></path>
                    </svg>
                    <input placeholder="Contraseña" class="input-field" type="password" name="txtpassword">
                </div>
                <div class="btn">
                    <button class="button1" type="submit">Ingresar</button>
                    
                </div>
                
            </form>
        </div>
    </body>
</html>
