<main>
    <h2>Ours products</h2>
    <div id="container">
        <div id="categories">
            <h3>categories</h3>
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
        
        <div id="products">
            <?php if(isset($_GET['catid'])) {
                foreach($items as $item) { ?>
                    <div class="card">
                        <img src="https://source.unsplash.com/200x80/?cars" alt="">
                        <h3 class="card-title"><?= htmlentities($item['name']) ?></h3>
                        <p><?= nl2br(htmlentities($item['description'])) ?></p>
                        <p>
                            <a href="/article<?= '?idProduct='.$item['id']?>" class="btn">Voir plus</a>
                        </p>
                    </div>
                <?php }
            }?>
        </div>
    </div>
    
</main>

