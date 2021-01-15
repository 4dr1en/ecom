<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<h1>ACCUEIL</h1>

<div class="row">
    <?php foreach($listItems as $item): ?>
    <div class="col-3">
        <div class="card">
            <h5 class="card-title"><?= htmlentities($item['name']) ?></h5>
            <p><?= nl2br(htmlentities($item['description'])) ?></p>
            <p>
            <a href="/article<?= '?id='.$item['id']?>" class="btn">Voir plus</a>
            </p>
        </div>
    </div>
    <?php endforeach ?>
</div>
</body>
</html>