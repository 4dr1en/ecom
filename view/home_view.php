
<main>
    <h2>ACCUEIL</h2>

    <div class="row">
        <?php foreach($listItems as $item): ?>
        <div class="col-3">
            <div class="card">
                <h5 class="card-title"><?= htmlentities($item['name']) ?></h5>
                <p><?= nl2br(htmlentities($item['description'])) ?></p>
                <p>
                    <a href="/article<?= '?idProduct='.$item['id']?>" class="btn">Voir plus</a>
                </p>
            </div>
        </div>
        <?php endforeach ?>
    </div>
</main>


