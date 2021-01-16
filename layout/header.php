<header>
    <div id="h_left">
        <a href="/">
            <img src="public/img/logo.png" alt="logo" id="Logo">
            <h1>Home</h1>
        </a>
    </div>
    <div id="h_right">
        <nav>
            <ul>
                <li><a href="/categorie">Catégorie</a></li>
                
                <?php
                if(!isset($_SESSION['user'])){ ?>
                    <li><a href="/signin">Sign In</a></li>
                    <li><a href="/login">Login</a></li>
                <?php } else{?>
                    <li><a href="/mycart">My Cart</a></li>
                    <li><a href="/account">My Account</a></li>
                <?php } ?>
            </ul>
        </nav>
    </div>
   
</header>

