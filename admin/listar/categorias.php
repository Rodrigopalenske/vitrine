<script>
    function excluir(id){
        var escolha = confirm("Excluir o item número " + id)
        if(escolha){
            location.href="excluir/categorias/" + id
        }
    }
</script>
<div class="card">
    <div class="card-body">
        <table 
            class="
            table 
            table-bordered 
            table-hover 
            table-striped"
        >
            <thead>
                <tr>
                    <td>ID</td>
                    <td>Nome da Categoria</td>
                    <td>Opções</td>
                </tr>
            </thead>

            <tbody>
                <?php
                    $sql = "select * from categoria";
                    $consulta = $pdo->prepare($sql);
                    $consulta->execute();
                    $dados = $consulta->fetchAll(PDO::FETCH_OBJ);
                    foreach($dados as $dado){
                ?>
                    <tr>
                        <td><?=$dado->id?></td>
                        <td><?=$dado->nome?></td>
                        <td>
                        <a 
                            href="cadastros/categorias/<?=$dado->id?>"
                            class="btn btn-success"
                        >
                            <i class="fas fa-edit"></i>
                        </a>

                        <a 
                            href="javascript:excluir(<?=$dado->id?>)"
                            class="btn btn-danger"
                        >
                            <i class="fas fa-trash"></i>
                        </a>                        
                        </td>
                    </tr>
                <?php
                    }
                ?>
            </tbody>

        </table>
    </div>
</div>