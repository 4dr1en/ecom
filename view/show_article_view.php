<main>
    <?php
        if(isset($msgCart)){
            print('<p>'.$msgCart.'</p>');
        }
    ?>
    <h2>Article#<?= $item['id']?></h2>
    <p><?= $item['name']?></p>
    <p><?= $item['description']?></p>
    <a href="/article?action=addToCart&idProduct=<?=$item['id']?>">add to cart</a>
</main>

