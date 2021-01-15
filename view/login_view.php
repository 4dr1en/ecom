<main>
    <?php if(isset($resultMsg)) print($resultMsg); ?>
    <form action="login" method="post" id="formLogin">
        <h2>Login</h2>
        <div>
            <label for="email">Your email</label><input type="email" name="email" id="email">
        </div>
        <div>
            <label for="password">Your password</label><input type="password" name="password" id="password">
        </div>

        <input type="submit" value="Send">
    </form>
</main>