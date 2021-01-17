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
            </div>
        </div>
        
    </div>


</main>