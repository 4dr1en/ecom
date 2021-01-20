<main>
    <div id="pageContent">
    <?php
        if(!isset($_GET['payment'])){
            print('<a href="/mypaymentmethod?payment=add" class="bt">Add a payment method</a>');
        }
    ?>
    

    <h2>My Payment Method</h2>

    <?php if(!count($paymentsMethodByCard) && !count($paymentsMethodByPaypal)){
        print("<p>You have no means of payment yet.</p>");
    } ?>
    <!--cb-->
    <?php if(count($paymentsMethodByCard)){ ?>
    <table>
        <tr>
            <th><img src="../public/img/creditcard.png" alt="Credit Card"></th>
            <th>Name</th>
            <th>Card code</th>
            <th>Expiry date</th>
        </tr>
        <?php foreach ($paymentsMethodByCard as $paymentMethodByCard) { ?>
        <tr>
            <td>&nbsp;</td>
            <td><?= $paymentMethodByCard['cardName'] ?></td>
            <td><?= $paymentMethodByCard['cardNumber'] ?></td>
            <td><?= $paymentMethodByCard['cardDate'] ?></td>
            <td><a href="/mypaymentmethod?payment=remove&paymentMethodId=<?= $paymentMethodByCard['id'] ?>" class="btRed">Remove</a>
            </td>
        </tr>
        <?php } ?>
    </table>
    <?php } ?>


    <!--paypal-->
    <?php if(count($paymentsMethodByPaypal)){ ?>
        <table>
            <tr>
                <th><img src="../public/img/paypal.png" alt="Paypal"></th>
                <th>Link</th>
            </tr>
            <?php foreach ($paymentsMethodByPaypal as $paymentMethodByPaypal) { ?>
            <tr>
                <td>&nbsp;</td>
                <td><?= $paymentMethodByPaypal['value'] ?></td>
                <td><a href="/mypaymentmethod?payment=remove&paymentMethodId=<?= $paymentMethodByPaypal['id'] ?>" class="btRed">Remove</a>
                </td>
            </tr>
            <?php } ?>
        </table>
    <?php } ?>


    <!--add payment-->
    <?php if (isset($_GET['payment']) && $_GET['payment'] == 'add') {?>
        <form action="/mypaymentmethod" method="post" id="addPayment">
            <input type="radio" id="ccd" onclick="displayCreditCard()" name="paymentMethod" value="creditCard">
            <label for="ccd"><img src="../public/img/creditcard.png" alt="Credit Card"></label>
            <input type="radio" id="ppl" onclick="displayPaypal()" name="paymentMethod" value="paypal">
            <label for="ppl"><img src="../public/img/paypal.png" alt="Paypal"></label>

            <div id="creditcard">
                <label for="cardNumber">Card Number: </label>
                <input type="text" id="cardNumber" name='cardNumber' 
                    pattern="[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}"
                    placeholder="xxxx xxxx xxxx xxxx"
                ><br>

                <label for="cardName">Card Name</label>
                <input type="text" id="cardName" name="cardName">
                
                <legend>Expiration Date :</label>
                <select id="expiryMonth" name="expiryMonth">
                    <option value="">Month</option>
                    <option value="01">01</option>
                    <option value="02">02</option>
                    <option value="03">03</option>
                    <option value="04">04</option>
                    <option value="05">05</option>
                    <option value="06">06</option>
                    <option value="07">07</option>
                    <option value="08">08</option>
                    <option value="09">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>

                <select id="expiryYear" name="expiryYear">
                    <option value="">Year</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                    <option value="2028">2028</option>
                    <option value="2029">2029</option>
                    <option value="2030">2030</option>
                    <option value="2031">2031</option>
                </select><br>
                <button type="submit">Register</button>
            </div>

            <div id="paypal">
                <input type="text" placeholder="Paypal Link" name='value' id="paypalLink"><br>
                <button type="submit">Register</button>
            </div>
            
        </form>
    <?php } ?>
    </div>
</main>