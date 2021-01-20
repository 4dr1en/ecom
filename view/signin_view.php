<main>
    <?php
        if($newUserRegistered){
            ?>
            <p class="successMsg">Congratulations your account has been successfully created,<br> <a href="/">return to home</a></p>
            <?php
        }  
    ?>
    <h2>Registration</h2>
    <?php
        if(count($txtErrors)) {
            print('<div id="errorsForm">');
            foreach ($txtErrors as $error) {
                print('<p>'.$error.'</p>');
            }
            print('<div id="closeErrors">X</div></div>');
        }
    ?>
    <form action="/signin" method="post" id="register">
        <div>
            <label for="firstname">Your first name</label><input type="text" name="firstname" id="firstname">
            <label for="lastname">You last name</label><input type="text" name="lastname" id="lastname">

            <label for="email">Your email</label><input type="email" name="email" id="email">

            <label for="phone">Your phone number</label><input type="tel" name="phone" id="phone">

            <label for="pwd1">Your strong password</label><input type="password" name="pwd1" id="pwd1">
            <label for="pwd2">Please retype your password</label><input type="password" name="pwd2" id="pwd2">        
        </div>
        <input type="submit" value="Send">
    </form>
</main>
