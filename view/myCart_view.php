<main>
    <?php
    if(isset($contentCart)){
        foreach ($contentCart as $productLine) {
        ?>
            <div class="productLine">
                <h3><?= $productLine['name'] ?></h3>
                <p>description= <?= $productLine['description'] ?></p>
                <p>quantity= <?= $productLine['quantity'] ?></p>
                <p>price= <?= $productLine['price'] ?></p>
            </div>
        <?php
        }
    }
    ?>
</main>
<div>

</div>