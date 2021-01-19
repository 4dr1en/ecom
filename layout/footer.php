<footer>
    <p>Copyright It Akademy</p>
    <?php
    if(isset($_SESSION['user'])){ ?>
        <a href="/logout">Logout</a>
    <?php } ?>
</footer>
