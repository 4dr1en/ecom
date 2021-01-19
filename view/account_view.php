<main>
    <div id="container">
        <div id="sidebar">
            <ul>
                <li>
                    <a href="/mycart">My cart</a>
                </li>
                <li>
                    <a href="/commandsHistory">My commands</a>
                </li>
                <li>
                    <a href="/mypaymentmethod">My Payment Method</a>
                </li>
                <li>
                    <a href="/account?action=edit">Edit personal information</a>
                </li>
                <li>
                    <a href="/account?action=editPassword">Edit Password</a>
                </li>
            </ul>
        </div>
        <div id="pageContent">
            <div id="imgProfile">
                <img src="/public/img/profile.webp" alt="image profile">
            </div>
            <div id="userInfos">
                <div>
                    <p class="infoTitle">Firstname</p>
                    <p class="infoContent"> <?= $_SESSION['user']['first_name']?> </p>
                </div>
                <div>
                    <p class="infoTitle">Lastname</p>
                    <p class="infoContent"> <?= $_SESSION['user']['last_name']?> </p>
                </div>
                <div>
                    <p class="infoTitle">Email</p>
                    <p class="infoContent"> <?= $_SESSION['user']['email']?> </p>
                </div>
                <div>
                    <p class="infoTitle">Phone number</p>
                    <p class="infoContent"> <?= $_SESSION['user']['phone']?> </p>
                </div>
                <div>
                    <p><?php if(isset($return)) {echo $return;} ?></p>  
                </div>
            </div>
        </div>
        <?php if(isset($_GET['action']) && $_GET['action'] == 'edit') { ?>
        <div>
            <form action="/account" method="post">
                <label for="editFirstname">New Firstname</label>
                <input type="text" id="editFirstname" name="firstName">
                <label for="editLastname">New Lastname</label>
                <input type="text" id="editLastname" name ="lastName">
                <label for="editEmail">New Mail</label>
                <input type="email" id="editEmail" name ='email'>
                <label for="editPhone">New Phone</label>
                <input type="tel" id="editPhone" name='phone'>
                <button type="submit">Edit</button>
            </form>
        </div>
        <?php } ?>
        <?php if(isset($_GET['action']) && $_GET['action'] == 'editPassword') { ?>
        <div>
            <form action="/account" method="post">
                <label for="currentPassword">Current Password</label>
                <input type="password" name="currentPassword" id="currentPassword">
                <label for="newPassword">New Password</label>
                <input type="password" name="newPassword" id="newPassword">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" name="confirmPassword" id="confirmPassword">
                <button type='submit'>Edit Password</button>
            </form> 
        </div>
        <?php } ?>
        
    </div>


</main>