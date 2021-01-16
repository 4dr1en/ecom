<main>
    <?php
    if(isset($contentCart)  && count($contentCart)){?>
        <form action="/mycart" method="post">
            <table>
                <tr>
                    <th>Care</th>
                    <th>description</th>
                    <th>price</th>
                    <th>quantity</th>
                    <th>action</th>
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
                    $ <em class="price"><?= $productLine['price'] ?></em>
                </td>
                <td>
                    <div class="quantityBox">
                        <input 
                            type="hidden" 
                            name="Quantity-<?= $productLine['id_item']?>" 
                            value="<?= $productLine['quantity']?>" 
                            id="input_l<?= $line?>"
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
            <input type="submit" name="buy" value="Buy">
            <input type="submit" name="saveCart" value="Save Cart">
        </form>

        <div id="commandInfo">
            <p>Ht = <?= $ht ?></p>
            <p>Tva = <?= $tva ?></p>
            <p>Total = <?= $total ?></p>
        </div>
        
    <?php
    }else{
    ?>
        <div><p>Your cart is empty =(, <a href="/categorie">go shopping !</a></p></div>
    <?php } ?>
</main>
