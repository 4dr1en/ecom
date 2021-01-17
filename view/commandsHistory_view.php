<main>
    <div id="container">
        <div id="sidebar">
            <h2>history</h2>
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
        
        <div id="pageContent">
        <?php if(isset($items)){ ?>
            <h2>Command history</h2>
            <table>
                <tr>
                    <th>Product</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
                <?php
                foreach ($items as $key => $item) {?>
                    <tr class="productLine">
                        <td><h3><?= $item['name_item'] ?></h3></td>
                        <td><?= $item['category'] ?></td>
                        <td>$&#8239;<?= $item['price'] ?></td>
                        <td><?= $item['quantity'] ?></td>
                        <td>$&#8239;<?= $item['quantity']*$item['price'] ?></td>
                    </tr>
               
                <?php } ?>
                    
               
            </table>
        <?php } ?>
        </div>
    </div>
    
</main>