<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catégorie</title>
</head>
<body>
<h1>Catégorie</h1>
<ul>
    <?php foreach($categories as $category):?>
    <li>
        </p>
            <a href="/categorie<?= '?catid='.$category['id']?>" class="btn"><?= htmlentities($category['name']) ?></a>
        <p>
    </li>
    <?php endforeach ?>
</ul>
<div class="row">
    <?php if(isset($_GET['catid'])) {
        foreach($items as $item) { ?>
    <div class="col-3">
        <div class="card">
            <h5 class="card-title"><?= htmlentities($item['name']) ?></h5>
            <p><?= nl2br(htmlentities($item['description'])) ?></p>
            <p>
                <a href="/article<?= '?id='.$item['id']?>" class="btn">Voir plus</a>
            </p>
        </div>
    </div>
    <?php }}?>
</div>
</body>

</html>