<?php

    $cep = $_POST["cep"] ?? NULL;
    $dados_cep = NULL;

    if (!empty($cep) && strlen($cep) == 8) {
        $sql = "select * from endereco where cep = :cep";
        $consulta = $pdo->prepare($sql);
        $consulta->bindParam(":cep", $cep);
        $consulta->execute();
        $dados_cep = $consulta->fetch(PDO::FETCH_OBJ);

        if (empty($dados_cep)) {
            $infos = file_get_contents("https://viacep.com.br/ws/$cep/json/", true);
            $dados_cep = (json_decode($infos));
            
            if (!isset($dados_cep->erro)) {
                $sql = "insert into endereco (cep, logradouro, complemento, bairro, localidade, uf, ibge, gia, ddd, siafi) 
                values (:cep, :logradouro, :complemento, :bairro, :localidade, :uf, :ibge, :gia, :ddd, :siafi)";
                $consulta = $pdo->prepare($sql);
                $consulta->bindParam(":cep", $cep);
                $consulta->bindParam(":logradouro", $dados_cep->logradouro);
                $consulta->bindParam(":complemento", $dados_cep->complemento);
                $consulta->bindParam(":bairro", $dados_cep->bairro);
                $consulta->bindParam(":localidade", $dados_cep->localidade);
                $consulta->bindParam(":uf", $dados_cep->uf);
                $consulta->bindParam(":ibge", $dados_cep->ibge);
                $consulta->bindParam(":gia", $dados_cep->gia);
                $consulta->bindParam(":ddd", $dados_cep->ddd);
                $consulta->bindParam(":siafi", $dados_cep->siafi);
                $consulta->execute();
            } else {
                
                mensagemErro("CEP Não encontrado");
            }
        }
    } elseif (!empty($cep) && strlen($cep) != 8) {
        mensagemErro("O CEP deve conter apenas 8 digitos");
        
    }

?>

<div class="card">
    <div class="card-body">
        <form method="POST">
            <label for="cep">Digite o seu CEP</label>
            <input type="number" name="cep" id="cep" class="form-control">
            <br>
            <button type="submit" class="btn btn-success">Buscar</button>
            <hr>
        </form>
        <table class="
            table
            table-bordered
            table-hover
            table-striped">
            <thead>
                <tr>
                    <td>Cep</td>
                    <td>Logradouro</td>
                    <td>Complemento</td>
                    <td>Bairro</td>
                    <td>localidade</td>
                    <td>uf</td>
                    <td>ibge</td>
                    <td>gia</td>
                    <td>ddd</td>
                    <td>siafi</td>
                </tr>
            </thead>

            <tbody>
                <?php
                    if (!is_null($dados_cep) && isset($dados_cep) && !isset($dados_cep->erro)) {
                ?>

                <tr>
                    <td> <?=$dados_cep->cep?> </td>
                    <td> <?=$dados_cep->logradouro?> </td>
                    <td> <?=$dados_cep->complemento?> </td>
                    <td> <?=$dados_cep->bairro?> </td>
                    <td> <?=$dados_cep->localidade?> </td>
                    <td> <?=$dados_cep->uf?> </td>
                    <td> <?=$dados_cep->ibge?> </td>
                    <td> <?=$dados_cep->gia?> </td>
                    <td> <?=$dados_cep->ddd?> </td>
                    <td> <?=$dados_cep->siafi?> </td>
                </tr>
                <?php
                    } elseif(isset($dados_cep) && isset($dados_cep->erro)) {
                ?>
                <tr>
                    <td> Cep Não Encontrado </td>
                </tr>
                <?php
                    }
                ?>
            </tbody>
        </table>
    </div>
</div>