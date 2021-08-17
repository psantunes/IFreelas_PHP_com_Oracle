<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <title>IFreelas</title>
    <meta charset="utf-8">
    <meta name="description" content="Exercício de conexão de uma aplicação PHP com um SGBD Oracle"/>
    <meta name="author" content="Antonio Paulo Serpa Antunes">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
    
  <?php include 'header.php'; ?>

  <section id="pesquisa" class="ftco-domain text-white">
    <div class="container">

      <div class="row d-flex whiteline">
        <div class="col-12 offset-md-1 col-md-10 py-5">
          <h4>Select simples</h4>
          <p>Digite no formulário abaixo você deve digitar uma habilidade que você procura.  (busca na tabela habilidade).</p>
                  
           <form method="get" action="result.php" class="domain-form d-flex">
            <div class="form-group domain-name">
              <input name="keyword" type="text" class="form-control name px-4" placeholder="Exemplo: Java. HTML. CorelDraw">
            </div>
            <div class="form-group d-flex">
              <input type="submit" class="search-domain btn btn-primary text-center" value="Buscar" id="botao1">
            </div>
          </form>
        </div>
      </div>

      <div class="row d-flex whiteline">
        <div class="col-12 offset-md-1 col-md-10 py-5">
          <h4>Função #1</h4>
          <p>Digite no formulário abaixo você deve digitar a habilidade que você procura (busca na tabela habilidade).
            A consulta vai retornar o número de usuários com esta habilidade</p>
                  
           <form method="get" action="result2.php" class="domain-form d-flex">
            <div class="form-group domain-name">
              <input name="keyword" type="text" class="form-control name px-4" placeholder="Exemplo: Java. HTML. CorelDraw">
            </div>
            <div class="form-group d-flex">
              <input type="submit" class="search-domain btn btn-primary text-center" value="Buscar" id="botao2">
            </div>
          </form>
        </div>
      </div>


      <div class="row d-flex whiteline">
        <div class="col-12 offset-md-1 col-md-10 py-5">
          <h4>Função #2</h4>
          <p>Selecione a região da cidade e saiba quantos profissionais desejam trabalhar nela</p>
                  
           <form method="get" action="result3.php" class="domain-form d-flex">
            <div class="form-group domain-name">
            <select name="regiao" class="form-select form-select-lg" aria-label=".form-select-lg">
              <option selected>Selecione a região</option>
              <option value="1">Porto Alegre - Região Central</option>
              <option value="2">Porto Alegre - Zona Leste</option>
              <option value="3">Porto Alegre - Zona Norte</option>
              <option value="4">Porto Alegre - Zona Sul</option>
              <option value="5">Viamão</option>
            </select>
            </div>
            <div class="form-group d-flex">
              <input type="submit" class="search-domain btn btn-primary text-center" value="Buscar" id="botao3">
            </div>
          </form>
        </div>
      </div>

      <div class="row d-flex whiteline">
        <div class="col-12 offset-md-1 col-md-10 py-5">
          <h4>Procedure #1</h4>
          <p>Retorna o nível de conhecimento de Inglês (id_idioma: 1) do profissional Paulo (id_prof: 1): [retorno é varchar]</p>

          <?php
            $v1 = 1;
            $v2 = 1;
            $conn = oci_connect("antonio", "123", "localhost/xe", "AL32UTF8");
            $sql = "BEGIN verifica_nivel_idioma(:a,:b,:c); END;";
            $stid = oci_parse($conn, $sql);     
            oci_bind_by_name($stid, ":a", $v1);
            oci_bind_by_name($stid, ":b", $v2);
            oci_bind_by_name($stid, ":c", $v3, 30, SQLT_CHR);
            oci_execute($stid);
            oci_free_statement($stid);
            oci_close($conn);
            ?>
          O nível de inglês do profissional 1 é: <strong><?= $v3 ?></strong>.
        </div>
      </div>

      <div class="row d-flex whiteline">
        <div class="col-12 offset-md-1 col-md-10 py-5">
          <h4>Procedure #2</h4>
          <p>Retorna o número de profissionais cadastrados no sistema que são do curso técnico em redes (id_curso: 2): [retorno é number]</p>

          <?php
            $v1 = 2;
            $conn = oci_connect("antonio", "123", "localhost/xe", "AL32UTF8");
            $sql = "BEGIN numero_prof_x_curso(:a,:b); END;";
            $stid = oci_parse($conn, $sql);     
            oci_bind_by_name($stid, ":a", $v1);
            oci_bind_by_name($stid, ":b", $v2);
            oci_execute($stid);
            oci_free_statement($stid);
            oci_close($conn);
            ?>
          O número de profissionais do curso técnico em redes é: <strong><?= $v2 ?></strong>.

        </div>
      </div>


      <div class="row d-flex whiteline">
        <div class="col-12 offset-md-1 col-md-10 py-5">
          <h4>Procedure #3</h4>
          <p>Existem usuários no sistema que sabem Oracle? (id_habilidade: 15): [retorno booleano]</p>

          <?php
            $valor1 = 15;
            $conn = oci_connect("antonio", "123", "localhost/xe", "AL32UTF8");
            $sql = "BEGIN habilidade_x_prof(:a,:b); END;";
            $stid = oci_parse($conn, $sql);     
            oci_bind_by_name($stid, ":a", $valor1);
            oci_bind_by_name($stid, ":b", $valor2, -1, OCI_B_BOL);
            oci_execute($stid);
            oci_free_statement($stid);
            oci_close($conn);
            ?>
          Existem usuários na base que sabem Oracle? <strong><?php echo $valor2 == "bool(true)" ? "VERDADEIRO" : "FALSO"; ?></strong>
        </div>
      </div>


      <div class="row d-flex whiteline">
        <div class="col-12 offset-md-1 col-md-10 py-5">
          <h4>Procedure #4</h4>
          <p>Atualiza em lote o semestre de todos os profissionais. [sem retorno; mensagem via Javascript]</p>

          <?php
            if(isset($_POST['Atualizar'])){
              $conn = oci_connect("antonio", "123", "localhost/xe", "AL32UTF8");
              $sql = "BEGIN atualiza_semestre_em_lote; END;";
              $stid = oci_parse($conn, $sql);     
              if (oci_execute($stid)) {
                $message= "Procedure executada com sucesso.";
              }
              
              oci_free_statement($stid);
              oci_close($conn);  

            }
          ?>

          <div class="form-group domain-name">
             <form method="post" class="domain-form d-flex">
             <div class="form-group d-flex mr-2">
               <input type="submit" class="search-domain btn btn-primary text-center" name="Atualizar" value="Atualizar" id="botao4">
             </div>
             <div class="form-group domain-name">
               <input type="text" class="form-control name px-4" value="<?php if(isset($message)){ echo $message;}?>">
             </div>
             </form>
          </div>
        </div>
      </div>

      <div class="row d-flex whiteline">
        <div class="col-12 offset-md-1 col-md-10 py-5">
          <h4>Procedure #5</h4>
          <p>Retorna todos os profissionais que sabem trabalhar com Photoshop (id_habilidade: 5)</p>

          <?php 

          $conn = oci_connect("antonio", "123", "localhost/xe", "AL32UTF8");
          $stid = oci_parse($conn, "begin p_prof_habilidade(:p_id_habilidade, :p_res); end;");
          $id=5;
          $refcur = oci_new_cursor($conn);
          oci_bind_by_name($stid, ":p_id_habilidade", $id);
          oci_bind_by_name($stid, ":p_res", $refcur, -1, OCI_B_CURSOR);
          oci_execute($stid);

          oci_execute($refcur);  
          echo '<table class="table">';
          echo '<thead class="thead-dark">';
          echo '<th>Nome</th><th>Descrição</th>';
          echo '</thead>';
          while ($row = oci_fetch_array($refcur, OCI_ASSOC+OCI_RETURN_NULLS)) {
              echo '<tr>';
              foreach ($row as $item) {
                  echo '    <td>'.($item).'</td>';
              }
              echo '</tr>';
          }
          echo '</table>';

          oci_free_statement($refcur);
          oci_free_statement($stid);
          oci_close($conn);


          ?>

        </div>
      </div>

      <div class="row d-flex whiteline">
        <div class="col-12 offset-md-1 col-md-10 py-5">
          <h4>Procedure #6</h4>
          <p>Retorna todos os profissionais disponíveis para trabalhar em home office (busca string 'Home Office' em tipo_trabalho)</p>

          <?php 

          $conn = oci_connect("antonio", "123", "localhost/xe", "AL32UTF8");
          $stid = oci_parse($conn, "begin p_prof_tipo_trabalho(:p_string, :p_res); end;");
          $string="Home Office";
          $refcur = oci_new_cursor($conn);
          oci_bind_by_name($stid, ":p_string", $string);
          oci_bind_by_name($stid, ":p_res", $refcur, -1, OCI_B_CURSOR);
          oci_execute($stid);

          oci_execute($refcur);  
          echo '<table class="table">';
          echo '<thead class="thead-dark">';
          echo '<th>Nome</th><th>Descrição</th>';
          while ($row = oci_fetch_array($refcur, OCI_ASSOC+OCI_RETURN_NULLS)) {
              echo '<tr>';
              foreach ($row as $item) {
                  echo '    <td>'.($item).'</td>';
              }
              echo '</tr>';
          }
          echo '</table>';

          oci_free_statement($refcur);
          oci_free_statement($stid);
          oci_close($conn);


          ?>

        </div>
      </div>

      <div class="row d-flex whiteline">
        <div class="col-12 offset-md-1 col-md-10 py-5">
          <h4>Trigger #1</h4>
          <p>Impede que o usuário cadastre uma senha fraca da lista. Não implementada no PHP.</p>
          </div>
      </div>

      <div class="row d-flex">
        <div class="col-12 offset-md-1 col-md-10 py-5">
          <h4>Trigger #2</h4>
          <p>Impede que o usuário cadastre uma imagem no campo Avatar que não tenha a extensão .JPG ou .PNG. Não implementada no PHP.</p>
          </div>
      </div>

      </div>
    </section>

    <?php include 'footer.php'; ?>

  </body>
</html>