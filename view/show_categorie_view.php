<main>

    <div id="container">
        <div id="sidebar">
            <h2>CATEGORIES</h2>
            <nav>
                <ul>
                    <?php foreach($categories as $category):?>
                    <li>
                        <a href="/categorie?catid=<?=$category['id']?>" class="btn">
                            <p>
                            <?= htmlentities($category['name']) ?>
                            </p>
                        </a>
                    </li>
                    <?php endforeach ?>
                </ul>
            </nav>
        </div>
        
        <div id="pageContent">
            <h2><?=$currentCategoryName?></h2>
            <div>
                <?php
                foreach($items as $item) { ?>
                    <div class="card">
                        <div class="cardImage">
                            <img src="<?=$item['image']?>" alt="product">
                        </div>
                        
                        <div class="cardContent">
                            <h3 class="card-title"><?= htmlentities($item['name']) ?></h3>
                            <p class="card-description"><?php
                            if(strlen($item['description']) > 200){
                                print(nl2br(htmlentities(substr($item['description'], 0, 200))).'...');
                            }else{
                                print(nl2br(htmlentities($item['description'])));
                            }
                            ?></p>
                            <p>
                                <a href="/article?idProduct=<?=$item['id']?>" class="bt seeProduct">View Product</a>
                            </p>
                        </div>
                    </div>
                <?php }?>
            </div>
        </div>
    </div>
</main>

