<main>
<h2>Commands histary</h2>
    <div id="container">
        <div id="history">
            <h3>history</h3>
            <nav>
                <ul>
                    <?php foreach($commands as $command):?>
                    <li>
                        <a href="/commandsHistory?command=<?=$command['id']?>" class="btn"><?=$command['dateCommand']?></a>
                    </li>
                    <?php endforeach ?>
                </ul>
            </nav>
        </div>
        
        <div id="command">
          <?php if(isset($item))print(var_dump($item)); ?>
        </div>
    </div>
    
</main>