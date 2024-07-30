<?php
    //função para mostrar a janela de erro
    function mensagemErro($msg) {
        ?>
<script>
Swal.fire({
    icon: 'error',
    title: 'Oops...',
    text: '<?=$msg?>',
}).then((result) => {
    history.back();
})
</script>
<?php
        exit;
    } //fim da função
?>

<?php
    function mask($val, $mask){
        $maskared = '';
        $k = 0;
        for ($i = 0; $i <= strlen($mask) - 1; ++$i) {
            if ($mask[$i] == '#') {
                if (isset($val[$k])) {
                    $maskared .= $val[$k++];
                }
            } else {
                if (isset($mask[$i])) {
                    $maskared .= $mask[$i];
                }
            }
        }
        return $maskared;
    }

    function maskCep($val){
        $cepMascara = '#####-###';
        $cepAjustado = '';
        $j = 0;
        
        for ($i = 0; $i < strlen($cepMascara); ++$i) {
            if($cepMascara[$i] == '#') {
                if (isset($val[$j])) {
                    $cepAjustado .= $val[$j];
                    $j += 1;
                }
            } else {
                if (isset($cepMascara[$i])) {
                    $cepAjustado .= $cepMascara[$i];
                }
            }
        }
        return $cepAjustado;
    }