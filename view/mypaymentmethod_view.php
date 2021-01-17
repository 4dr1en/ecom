<main>
  <h2>My Payment Method</h2>

<a href="/mypaymentmethod?payment=add">Add payment method</a>

<table>
  <tr>
    <td><img src="../public/img/creditcard.png" alt="Credit Card"></td>
    <td>Name</td>
    <td>Card code</td>
    <td>Expiry date</td>
  </tr>
  <?php foreach($paymentsMethodByCard as $paymentMethodByCard) {?>
  <tr>
    <td>&nbsp;</td>
    <td><?= $paymentMethodByCard['cardName']?></td>
    <td><?= $paymentMethodByCard['cardNumber']?></td>
    <td><?= $paymentMethodByCard['cardDate']?></td>
    <td><a href="/mypaymentmethod?payment=remove&paymentMethodId=<?= $paymentMethodByCard['id']?>">Remove</a></td>
  </tr>
  <?php }?>
</table>
<table>
    <tr>
      <td><img src="../public/img/paypal.png" alt="Paypal"></td>
      <td>Link</td>
    </tr>
    <?php foreach($paymentsMethodByPaypal as $paymentMethodByPaypal) {?>
    <tr>
      <td>&nbsp;</td>
      <td><?= $paymentMethodByPaypal['value']?></td>
      <td><a href="/mypaymentmethod?payment=remove&paymentMethodId=<?= $paymentMethodByCard['id']?>">Remove</a></td>
    </tr>
    <?php }?>
</table>
<?php if(isset($_GET['payment'])) { if($_GET['payment'] == 'add') {?>
<form action="/mypaymentmethod" method="post">
  <input type="radio" id="ccd" onclick="displayCreditCard()" name="paymentMethod" value="creditCard">
  <label for="ccd"><img src="../public/img/creditcard.png" alt="Credit Card"></label>
  <input type="radio" id="ppl" onclick="displayPaypal()" name="paymentMethod" value="paypal">
  <label for="ppl"><img src="../public/img/paypal.png" alt="Paypal"></label>
  
  <div id="creditcard">
      <label for="cardNumber">Card Number: </label>
      <input type="text" id="cardNumber" name='cardNumber'
            pattern="[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}"
            placeholder="xxxx xxxx xxxx xxxx">
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
        </select>

        <label for="cardName">Card Name</label>
        <input type="text" id="cardName" name="cardName">
  </div>

  <div id="paypal">
      <input type="text" placeholder="Paypal Link" name='value'>
  </div>
        <button type="submit">Register</button>
</form>
<?php }} ?>