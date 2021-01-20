<main>
    <?php
        if(isset($msgCart)){
            print($msgCart);
        }
        
    ?>
    <div id="pageContent">
        <p>Article #<?= $item['id']?></p>
        <h2 class="nameItem"><?= $item['name']?></h2>
        <img src="<?=$item['image']?>" alt="<?=$item['name']?>">
        <p class="description"><?=htmlspecialchars($item['description']) ?></p>
        <p>Price&#8239: $&#8239<span id="price"><?=$item['price']?></span></p>
        <form action="/article" method="post">
            <input type="number" min="1" max="9" step="1" name="quantity" id="quantity" value="1" data-price="<?=$item['price']?>">
            <input type="hidden" name="idProduct" value="<?=$item['id']?>">
            <input type="submit" class="btGreen" value="Add to cart">  
        </form>
    </div>
    
</main>

