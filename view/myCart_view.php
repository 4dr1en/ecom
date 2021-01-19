<main>
    <?php
    if(isset($contentCart)  && count($contentCart)){?>
        <form action="/mycart" method="post">
            <table>
                <tr>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Remove</th>
                </tr>
        <?php
        $line= 0;
        foreach ($contentCart as $productLine) {
            $line++;
        ?>
            <tr class="productLine">
                <td><h3><?= $productLine['name'] ?></h3></td>
                <td><?= $productLine['description'] ?></td>
                <td>
                    $<em class="price"><?= $productLine['price'] ?></em>
                </td>
                <td>
                    <div class="quantityBox">
                        <input 
                            type="hidden" 
                            name="Quantity-<?= $productLine['id_item']?>" 
                            value="<?= $productLine['quantity']?>" 
                            id="input_l<?= $line?>"
                            class="quantity"
                        >
                        <em id='l<?=$line?>Quantity'><?= $productLine['quantity'] ?></em>
                        <div class="buttonQuantity">
                            <button class="addQuantity" data-line="<?=$line?>"  data-quantity="<?=$productLine['quantity']?>">+</button>
                            <button class="removeQuantity" data-line="<?=$line?>"  data-quantity="<?=$productLine['quantity']?>">-</button>
                        </div>
                    </div>
                </td>
                <td><a href="/mycart?action=removeItem&idItem=<?= $productLine['id_item']?>">Remove</a></td>
            </tr>
        <?php
        }
        ?>
            </table>

        <div id="commandInfo">
            <div id="prixInfo">
                <p>
                    <span class="priceTitle">Ht&#8239: </span>
                    <span id="priceHT">$&#8239<span><?= $ht ?></span></span>
                </p>
                <p>
                    <span class="priceTitle">Tva&#8239: </span>
                    <span id="totalTVA"> $&#8239<span><?= $tva ?></span></span>
                </p>
                <p>
                    <span class="priceTitle">Total&#8239: </span>
                    <span id="priceTotal">$&#8239<span><?= $total ?></span></span>
                </p>
            </div>
            <div id="modePayment">
                <?php if(count($paymentsMethod)){ ?>
                <h3>Please choose your payment method&#8239:</h3>
                <select name="paymentMethod" id="paymentMethod">
                    <?php
                    foreach ($paymentsMethod as $paymentMethod) {
                    ?>
                    <option value="<?= $paymentMethod['id'] ?>">
                    <?php
                        if($paymentMethod['method'] == 'creditCard'){
                            $values= explode("&", $paymentMethod['value']);
                            print('Credit Card | '.$values[0].' | '.strtoupper($values[2]));
                        }else print('paypal | '.$paymentMethod['value']);
                    ?>
                    </option>
                    <?php
                    }
                    ?>
                </select>
                <?php 
                }else{                
                ?>
                    <p>You don't have any payment method yet. <a href="/mypaymentmethod">Add one.</a></p>
                <?php 
                }               
                ?>
                
            </div>
            <?php
            if(count($paymentsMethod)){
                print('<input type="submit" name="buy" value="Buy now" id="buyInput">');
            }?>
            
        </div>
        
        <div id="saveCart" class="hidden">
            <input type="submit" name="saveCart" value="Save Cart">
        </div>
    </form>
        
        
    <?php
    }else{
    ?>
        <div><p>Your cart is empty =(, <a href="/categorie">go shopping !</a></p></div>
    <?php } ?>
</main>


