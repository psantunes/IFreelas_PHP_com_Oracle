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
      $keyword = $_GET["keyword"];
      $conn = oci_connect("antonio", "123", "localhost/xe", "AL32UTF8");
      $sql = "SELECT avatar, nome, descricao
              FROM prof
              INNER JOIN habilidade_prof
              ON prof.id_prof =  habilidade_prof.id_prof
              INNER JOIN habilidades 
              ON habilidade_prof.id_habilidade = habilidades.id_habilidade
              WHERE habilidades.habilidade = '$keyword'";
      $stid = oci_parse($conn, $sql);
      oci_define_by_name($stid, 'AVATAR', $avatar);
      oci_define_by_name($stid, 'NOME', $nome);
      oci_define_by_name($stid, 'DESCRICAO', $descricao);
      oci_execute($stid); 
    ?>

    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h4 class="mb-3">Busca por '<?= $keyword ?>':</h4>
          </div>
        </div>
    </section>
 
    <section class="ftco-section search-result mb-5">
          <div class="container">
            <div class="row">
              <div class="col-12">
                  <div class="carousel-testimony owl-carousel">
                  <?php while (oci_fetch($stid)) { ?>
                      <div class="testimony-wrap p-4 pb-5">
                        <div class="user-img mb-5" style="background-image: url(<?= $avatar ?>)"></div>
                        <div class="text">
                          <p class="name"><?= $nome ?></p>
                          <p class="mb-5"><?= $descricao ?></p>
                        </div>
                      </div>
              <?php
              }
              oci_free_statement($stid);
              oci_close($conn);

              ?>
              </div>
            </div>
          </div>
        </div>
      </section>

      
    <?php include 'footer.php'; ?>
    <script src="js/jquery.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    
      <script>
          var carousel = function() {
      $('.carousel-testimony').owlCarousel({
        center: false,
        loop: false,
        margin: 30,
        stagePadding: 0,
        nav: true,
        navText: ['<<', '>>'],
        responsive:{
          0:{
            items: 1
          },
          600:{
            items: 2
          },
          1000:{
            items: 3
          }
        }
      });
    };
    carousel();
  </script>
  </body>
</html>