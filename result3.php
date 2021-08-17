<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <title>IFreelas</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/owl.carousel.min.css">      
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>

    <?php include 'header.php';
      $keyword = $_GET["regiao"];
      $conn = oci_connect("antonio", "123", "localhost/xe", "AL32UTF8");
      $sql = "Select N_regiao_profissional('$keyword') from dual";
      $stid = oci_parse($conn, $sql);     
      oci_execute($stid);
      $res = oci_fetch_array($stid, 1);
      $valor = implode($res);
    ?>

    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h4 class="mb-3">Função retornou <strong><?= $valor ?></strong> 
            profissionais que querem trabalhar na região.</h4>
          </div>
        </div>
    </section>
 

    <?php
    oci_free_statement($stid);
    oci_close($conn);
    ?>
      
    <?php include 'footer.php'; ?>
  </body>
</html>