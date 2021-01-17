<main>

    <div id="container">
        <div id="sidebar">
            <h2>Categories</h2>
            <nav>
                <ul>
                    <?php foreach($categories as $category):?>
                    <li>
                        </p>
                            <a href="/categorie?catid=<?=$category['id']?>" class="btn"><?= htmlentities($category['name']) ?></a>
                        <p>
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
                        <img src="<?=$item['image']?>" alt="product">
                        <div>
                            <h3 class="card-title"><?= htmlentities($item['name']) ?></h3>
                            <p><?php
                            if(strlen($item['description']) > 200){
                                print(nl2br(htmlentities(substr($item['description'], 0, 200))).'...');
                            }else{
                                print(nl2br(htmlentities($item['description'])));
                            }
                            ?></p>
                            <p>
                                <a href="/article<?= '?idProduct='.$item['id']?>" class="btn">more</a>
                            </p>
                        </div>
                    </div>
                <?php }?>
            </div>
        </div>
    </div>
</main>

