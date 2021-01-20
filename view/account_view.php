<main>
    <div id="container">
        <div id="sidebar">
            <h2>ACCOUNT</h2>
            <nav>
                <ul>
                    <li>
                        <a href="/mycart"><p>My cart</p></a>
                    </li>
                    <li>
                        <a href="/commandsHistory"><p>My commands</p></a>
                    </li>
                    <li>
                        <a href="/mypaymentmethod"><p>My Payment Method</p></a>
                    </li>
                    <li>
                        <a href="/account?action=edit"><p>Edit personal information</p></a>
                    </li>
                    <li>
                        <a href="/account?action=editPassword"><p>Edit Password</p></a>
                    </li>
                </ul>
            </nav>
            
        </div>
        <div id="pageContent">
            <div>
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
                </div>
            </div>
           
            <?php if(isset($_GET['action']) && $_GET['action'] == 'edit') { ?>
                <div id="editInfos">
                    <form action="/account" method="post">
                        <label for="editFirstname" class="infoTitle">New Firstname</label>
                        <input type="text" id="editFirstname" name="firstName" value="<?= $_SESSION['user']['first_name']?>">
                        <label for="editLastname" class="infoTitle">New Lastname</label>
                        <input type="text" id="editLastname" name ="lastName" value="<?= $_SESSION['user']['last_name']?>">
                        <label for="editEmail" class="infoTitle">New Mail</label>
                        <input type="email" id="editEmail" name ='email' value="<?= $_SESSION['user']['email']?>">
                        <label for="editPhone" class="infoTitle">New Phone</label>
                        <input type="tel" id="editPhone" name='phone' value="<?= $_SESSION['user']['phone']?>">
                        <button type="submit">Edit</button>
                    </form>
                </div>
                <?php } ?>


                <?php if(isset($_GET['action']) && $_GET['action'] == 'editPassword') { ?>
                <div id='editPassword'>
                    <form action="/account" method="post">
                        <label for="currentPassword" class="infoTitle">Current Password</label>
                        <input type="password" name="currentPassword" id="currentPassword">
                        <label for="newPassword" class="infoTitle">New Password (8 characters at least)</label>
                        <input type="text" name="newPassword" id="newPassword">
                        <label for="confirmPassword" class="infoTitle">Confirm Password</label>
                        <input type="text" name="confirmPassword" id="confirmPassword">
                        <button type="submit">Edit Password</button>
                    </form>
                </div>
                <?php } ?>
        </div>
    </div>

    <div>
        <?php if(isset($return)){echo($return);} ?>
    </div>


</main>