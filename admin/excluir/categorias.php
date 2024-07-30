<?php
    $page = explode("/", $_GET['param']);
                
    $id = $page[2] ?? NULL;

    if (empty($id)){
        mensagemErro("item invalido");
        echo "<script>location.href='listar/categorias'</script>";
        exit;
    }

    $sql = "select id from categoria where id = :id";
    $consulta = $pdo->prepare($sql);
    $consulta->bindParam(":id", $id);
    $consulta->execute();
    $dados = $consulta->fetch(PDO::FETCH_OBJ);


    $idvazio = empty($dados->id);

    if ($idvazio){
        mensagemErro("item invalido");
        echo "<script>location.href='listar/categorias'</script>";
        exit;
    }

    $sql = "delete from categoria where id = :id";
    $consulta = $pdo->prepare($sql);
    $consulta->bindParam(":id", $id);
    if ($consulta->execute()){
        echo "<script>location.href='listar/categorias'</script>";
        exit;
    }
?>