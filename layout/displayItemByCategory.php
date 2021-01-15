<div class="col-3">
        <div class="card">
            <h5 class="card-title"><?= htmlentities($item['name']) ?></h5>
            <p><?= nl2br(htmlentities($item['description'])) ?></p>
            <p>
                <a href="/article<?= '?id='.$item['id']?>" class="btn">Voir plus</a>
            </p>
        </div>
    </div>