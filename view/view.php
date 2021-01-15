<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0">
    <title><?php 
        if(isset($PAGE['title']))print($PAGE["title"]);
        else print('shop');
    ?></title>
    <link rel="stylesheet" href="/public/css/main.css">
    <?php
        if(isset($PAGE['additionalCSS'])){
            print('<link rel="stylesheet" href="'.$PAGE['additionalCSS'].'">');
        }
    ?>
    
    <script src="/public/script/main.js" defer></script>
    <?php
        if(isset($PAGE['additionalJS'])){
            print('<script src="'.$PAGE['additionalJS'].'" defer></script>');
        }
    ?>
    
</head>
<body>
    <?php
        include('../layout/header.php');
        include($PAGE['mainSectionHtml']);
        include('../layout/footer.php');
    ?>
</body>
</html>