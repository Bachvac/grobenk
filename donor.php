<script>
        function OdjaviMe(){
            window.location.replace('odjava.php');
        }
        function toggleVisibility(button) {
            if(button == "button1")var x = document.getElementById("pratim");
            else var x = document.getElementById("prate_me");

            if(x.style.display === "block") {
                x.style.display = "none";
            }
            else {
                x.style.display = "block";
            }
        }
</script>
<?php

echo '
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BloodBank</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
    <link href="style.css" rel="stylesheet">
    <link href="donorstyle.css" rel="stylesheet">
</head>';

    require_once "dbconnect.php"; 
    require_once "functions.php";


    session_start();
    $_SESSION["current_page"] = $_SERVER['REQUEST_URI'];
    $username = $_GET['username'];
    $password = $_GET['password'];

    $username = stripcslashes($username);
    $password = stripcslashes($password);
    $username = mysqli_real_escape_string($conn,$username);
    $password = mysqli_real_escape_string ($conn, $password);

    echo "
    <div id='nav-placeholder' onload>
    </div> 

    <script>
    $(function(){
      $('#nav-placeholder').load('donornavbar.php');
    });
    </script>";

    $info ="select *from donor where username = '$username' and password = '$password'";
    $run = mysqli_query($conn, $info);
    $result = $run or die ("Failed to query database". mysqli_error($conn));

    $row = mysqli_fetch_array($result);
    $OIB = $row['OIB_donora'];
    if ($row['username'] == $username && $row['password'] == $password && ("" !== $username || "" !== $password) ) {
        $_SESSION["username"] = $username; //spremam session varijablu da je mogu kasnije koristiti
        $_SESSION["ime"] = $row['ime_prezime_donora'];
        $_SESSION["mojOIB"] = $row['OIB_donora'];
    } else {
        echo "Pogresna lozinka ili username!";
        exit;
    }

    $active = 'active';
    $active2 = '';
    if(isset($_POST['dolazim'])){
        if(!empty($_POST['check_list'])){
            $active = '';
            $active2 = 'active';
            foreach($_POST['check_list'] as $id) {
                $sql = "INSERT INTO moj_event values  ('$OIB', '$id', '0')";
                $run_sql = mysqli_query($conn, $sql);
                $result = $run or die ("Failed to query database". mysqli_error($conn));
            }
        }
    }

    if(isset($_POST['otkazi'])) {
        if (!empty($_POST['check_list'])) {
            $active = '';
            $active2 = 'active';
            foreach ($_POST['check_list'] as $id) {
                $sql = "DELETE FROM moj_event where OIB_donora_don = '$OIB' and id_lokacije= '$id' and prisutnost = '0'";
                $run_sql = mysqli_query($conn, $sql);
            }
        }
    }

    $str = '<i style="color:goldenrod;" class="fas fa-star"></i>';

    if(!strcmp($row['spol'],'Z')) $gender = 'la';
    else $gender = 'o';
    $upit = "select naziv_lokacije, datum_dogadaja from lokacija where idlokacija in 
            (SELECT id_lokacije from moj_event where moj_event.OIB_donora_don = '$OIB' and prisutnost = 1)";
    $rezultat = mysqli_query($conn, $upit);

echo '
    <div class="profil-img">
        <img src="donori/'.$row['image'].'">
        <div class="profil-info">
            <div class="profil-title">';
            if($row['br_donacija'] <= 20) echo '<h1>'.$row['ime_prezime_donora'].''.$str.'</h1>';
            else if($row['br_donacija'] <= 30) echo '<h1>'.$row['ime_prezime_donora'].''.$str.''.$str.'</h1>';
            else if($row['br_donacija'] <= 50) echo '<h1>'.$row['ime_prezime_donora'].''.$str.''.$str.''.$str.'</h1>';
            echo '
            </div>
            <div class="profil-content">
                <ul class="nav nav-tabs" id="myTab" >
                    <li class="nav-item">
                        <a class="nav-link '.$active.'" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">O meni</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Povijest donacija</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link '.$active2.'" id="event-tab" data-toggle="tab" href="#event" role="tab" aria-controls="event" aria-selected="false">Moji eventi</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="follow-tab" data-toggle="tab" href="#follow" role="tab" aria-controls="follow" aria-selected="false">Praćenje</a>
                    </li>
                </ul>
            </div>

            <div class="col-md-8">
                <div class="tab-content profile-tab" id="myTabContent">
                    <div class="tab-pane fade show '.$active.'" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Ime i prezime:</label>
                            </div>
                            <div class="col-md-6">
                                <p class="info">'.$row['ime_prezime_donora'].'</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Krvna grupa:</label>
                            </div>
                            <div class="col-md-6">
                                <p class="info">'.$row['krvna_grupa_don'].'</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>OIB:</label>
                            </div>
                            <div class="col-md-6">
                                <p class="info">'.$row['OIB_donora'].'</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Korisnicko ime:</label>
                            </div>
                            <div class="col-md-6">
                                <p class="info">'.$row['username'].'</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>E-mail:</label>
                            </div>
                            <div class="col-md-6">
                                <p class="info">'.$row['mail_donora'].'</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Broj telefona:</label>
                            </div>
                            <div class="col-md-6">
                                <p class="info">'.$row['broj_mobitela'].'</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Datum rođenja:</label>
                            </div>
                            <div class="col-md-6">
                                <p class="info">'.$row['datum_rodenja'].'</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Prebivalište:</label>
                            </div>
                            <div class="col-md-6">
                                <p class="info">'.$row['prebivaliste'].'</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <table>
                                    <tr><th align="left">Mjesto doniranja</th><th align="left">Datum doniranja</th></tr>';
                                    while($row = mysqli_fetch_array($rezultat)){
                                        echo '<tr><td>'.$row['naziv_lokacije'].'</td><td>'.$row['datum_dogadaja'].'</td><tr>';
                                    }
                      echo '</table> 
                    </div>

                    <div class="tab-pane fade show '.$active2.'" id="event" role="tabpanel" aria-labelledby="event-tab">';
                            $upit = "SELECT idlokacija, grad, naziv_lokacije, adresa_lokacije, datum_dogadaja, start, kraj from lokacija where idlokacija in(
                                    SELECT id_lokacije from moj_event where OIB_donora_don = '$OIB' and prisutnost = '0')";
                            $run = mysqli_query($conn, $upit);
                            $result = $run or die("Failed to query database". mysqli_error($conn));

                            echo '
                            <h2>Zakazani događaji:</h2><br>
                            <div class="event-container">
                                <form action="" method="POST">';
                                while($row = mysqli_fetch_array($result)){
                                    $d = $row['datum_dogadaja'];
                                    $day = date("d", strtotime($d));
                                    $month = date("m", strtotime($d));
                                    $year = date("Y", strtotime($d));

                                    if($month == 1) $mjesec = "Siječanj";
                                    if($month == 2) $mjesec = "Veljača";
                                    if($month == 3) $mjesec = "Ožujak";
                                    if($month == 4) $mjesec = "Travanj";
                                    if($month == 5) $mjesec = "Svibanj";
                                    if($month == 6) $mjesec = "Lipanj";
                                    if($month == 7) $mjesec = "Srpanj";
                                    if($month == 8) $mjesec = "Kolovoz";
                                    if($month == 9) $mjesec = "Rujan";
                                    if($month == 10) $mjesec = "Listopad";
                                    if($month == 11) $mjesec = "Studeni";
                                    if($month == 12) $mjesec = "Prosinac";

                                    $hours_start = date('H', strtotime($row['start']));
                                    $minutes_start = date('i', strtotime($row['start']));
                                    $hours_kraj = date('H', strtotime($row['kraj']));
                                    $minutes_kraj = date('i', strtotime($row['kraj']));

                              echo '<div class="event">
                                            <div class="event-date">
                                                <span class="day">'.$day.'</span>
                                                <span class="month">'.$mjesec.'</span>
                                                <span class="year">'.$year.'</span>
                                            </div>
                                            <span class="h4">'.$row['naziv_lokacije'].'<span>
                                            <span class="event-checkbox">
                                                <input class="squaredTwo" type="checkbox" name="check_list[]" value='.$row['idlokacija'].' onclick="Sakrij();"/>
                                            </span><br>
                                            <span class="h6">'.$hours_start.':'.$minutes_start.' - '.$hours_kraj.':'.$minutes_kraj.'</span><br>
                                            <span class="h6">'.$row['adresa_lokacije'].'</span>
                                    </div><br>';
                                }    
                               echo '<br>
                                    <input class="event-submit" type="submit" name="otkazi" value="Otkaži moj dolazak" onclick="Refresh();">
                                </form>
                            </div>';

                            $date = date("Ymd");
                            $dolazim = "SELECT idlokacija, grad, naziv_lokacije, adresa_lokacije, datum_dogadaja, start, kraj FROM lokacija WHERE grad IN 
                                       (SELECT prebivaliste FROM donor WHERE OIB_donora = '$OIB') AND datum_dogadaja > '$date' AND idlokacija NOT IN 
                                       (SELECT id_lokacije from moj_event WHERE OIB_donora_don = '$OIB')";
                            $run = mysqli_query($conn, $dolazim);
                            $result = $run or die ("Failed to query database". mysqli_error($conn));

                            echo '
                            <h2>Nadolazeći događaji:</h2><br>
                            <div class="event-container">
                                <form action="" method="POST">';
                                while($row_dolazim = mysqli_fetch_array($result)){
                                    $d = $row_dolazim['datum_dogadaja'];
                                    $day = date("d", strtotime($d));
                                    $month = date("m", strtotime($d));
                                    $year = date("Y", strtotime($d));

                                    if($month == 1) $mjesec = "Siječanj";
                                    if($month == 2) $mjesec = "Veljača";
                                    if($month == 3) $mjesec = "Ožujak";
                                    if($month == 4) $mjesec = "Travanj";
                                    if($month == 5) $mjesec = "Svibanj";
                                    if($month == 6) $mjesec = "Lipanj";
                                    if($month == 7) $mjesec = "Srpanj";
                                    if($month == 8) $mjesec = "Kolovoz";
                                    if($month == 9) $mjesec = "Rujan";
                                    if($month == 10) $mjesec = "Listopad";
                                    if($month == 11) $mjesec = "Studeni";
                                    if($month == 12) $mjesec = "Prosinac";

                                    $hours_start = date('H', strtotime($row_dolazim['start']));
                                    $minutes_start = date('i', strtotime($row_dolazim['start']));
                                    $hours_kraj = date('H', strtotime($row_dolazim['kraj']));
                                    $minutes_kraj = date('i', strtotime($row_dolazim['kraj']));

                              echo '<div class="event">
                                            <div class="event-date">
                                                <span class="day">'.$day.'</span>
                                                <span class="month">'.$mjesec.'</span>
                                                <span class="year">'.$year.'</span>
                                            </div>
                                            <span class="h4">'.$row_dolazim['naziv_lokacije'].'<span>
                                            <span class="event-checkbox">
                                                <input class="squaredTwo" type="checkbox" name="check_list[]" value='.$row_dolazim['idlokacija'].' onclick="Sakrij();"/>
                                            </span><br>
                                            <span class="h6">'.$hours_start.':'.$minutes_start.' - '.$hours_kraj.':'.$minutes_kraj.'</span><br>
                                            <span class="h6">'.$row_dolazim['adresa_lokacije'].'</span>
                                    </div><br>';
                                }    
                               echo '<br>
                                    <input class="event-submit" type="submit" name="dolazim" value="Dolazim" onclick="Refresh();">
                                </form>
                            </div>
                    </div>

                    <div class="tab-pane fade" id="follow" role="tabpanel" aria-labelledby="follow-tab">';
                        $upit = "SELECT ime_prezime_donora, OIB_donora, image from donor where
                                OIB_donora in (select OIB_prijatelja from following where
                                donor_OIB_donora = '$OIB')";

                        $rezultat = mysqli_query($conn, $upit);
                        echo '<h4>Pratim:</h4><br>';
                        while($row = mysqli_fetch_array($rezultat)){
                            echo '
                            <div class="follow-info">
                                <div class="follow-img">
                                    <img src="donori/'.$row['image'].'">
                                </div>
                                <a href="publicprofile.php?OIB_korisnika='.urlencode($row['OIB_donora']).'">'.$row['ime_prezime_donora'].'</a>
                            </div><br>
                            ';
                        }

                        $upit = "SELECT ime_prezime_donora, OIB_donora, image from donor where
                                               OIB_donora in (select OIB_prijatelja from followers where
                                               donor_OIB_donora = '$OIB')";
                        $rezultat = mysqli_query($conn, $upit);

                        echo '<h4>Prate me:</h4><br>';
                        while($row = mysqli_fetch_array($rezultat)){
                            echo '
                            <div class="follow-info">
                                <div class="follow-img">
                                    <img src="donori/'.$row['image'].'">
                                </div>
                                <a href="publicprofile.php?OIB_korisnika='.urlencode($row['OIB_donora']).'">'.$row['ime_prezime_donora'].'</a>
                            </div><br>';
                        }
                        echo'
                    </div>
                </div>
        </div>
    </div>
';
?>


