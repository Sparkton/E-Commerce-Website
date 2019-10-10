<?php // Do not put any HTML above this line
require_once "pdo.php";
require_once "util.php";
session_start();
if ( ! isset($_SESSION['name']) ) {
    die('Not logged in');
}

$name = $_SESSION['name'];

if ( isset($_POST['cancel'] ) ) {
    // Redirect the browser to game.php
    header("Location: index.php");
    return;
}

if ( isset($_POST['first_name']) && isset($_POST['last_name'])
     && isset($_POST['email']) && isset($_POST['headline']) && isset($_POST['summary'])) {
    // Data validation
    if ( strlen($_POST['first_name']) < 1 || strlen($_POST['last_name']) < 1 || strlen($_POST['email']) < 1 ||
    strlen($_POST['headline']) < 1 || strlen($_POST['summary']) < 1) {
        $_SESSION['error'] = 'All fields are required';
        header("Location: add.php");
        return;
    }
    else if (strpos($_POST['email'], '@') == false) {
      $_SESSION['error'] = 'The mail must have an at (@) sign';
      header("Location: add.php");
      return;
    }
    else {

      $msg = validatePos();
      if(is_string($msg)){
        $_SESSION['error'] = $msg;
        header("Location: add.php");
        return;
      }
        $stmt = $pdo->prepare('INSERT INTO profile
        (user_id, first_name, last_name, email, headline, summary)
        VALUES ( :uid, :fn, :ln, :em, :he, :su)');
        $stmt->execute(array(
          ':uid' => $_SESSION['user_id'],
          ':fn' => $_POST['first_name'],
          ':ln' => $_POST['last_name'],
          ':em' => $_POST['email'],
          ':he' => $_POST['headline'],
          ':su' => $_POST['summary'])
        );
        $stmt = $pdo->prepare('SELECT profile_id FROM profile WHERE first_name = :fn');
        $stmt->execute(array(
          'fn' => $_POST['first_name']
        ));
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if ( $row === false ) {
            $_SESSION['error'] = 'Bad value for profile_id';
            header( 'Location: add.php' ) ;
            return;
        }
        $profile_id = htmlentities($row['profile_id']);
        $rank = 1;
        for($i=1; $i <= 9; $i++)
        {
          if ( ! isset($_POST['year'.$i])) continue;
          if ( ! isset($_POST['desc'.$i])) continue;
          $year = $_POST['year'.$i];
          $desc = $_POST['desc'.$i];
          $stmt = $pdo->prepare('INSERT INTO Position
          (profile_id, rank, year, description) VALUES (:pid, :rnk, :year, :descr)');
          $stmt->execute(array(
            ':pid' => $profile_id,
            ':rnk' => $rank,
            ':year' => $year,
            ':descr' => $desc
          ));
          $rank++;
        }
        $rank = 1;
        for ($i = 1; $i <= 9; $i++) {
            if (!isset($_POST['edu_year' . $i])) continue;
            if (!isset($_POST['edu_school' . $i])) continue;
            $edu_year = $_POST['edu_year' . $i];
            $edu_school = $_POST['edu_school' . $i];
            $stmt = $pdo->prepare("SELECT * FROM Institution where name = :xyz");
            $stmt->execute(array(":xyz" => $edu_school));
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($row) {
                $institution_id = $row['institution_id'];
            } else {
                $stmt = $pdo->prepare('INSERT INTO Institution (name) VALUES ( :name)');
                $stmt->execute(array(
                    ':name' => $edu_school,
                ));
                $institution_id = $pdo->lastInsertId();
            }
            $stmt = $pdo->prepare('INSERT INTO Education (profile_id, institution_id, year, rank) VALUES ( :pid, :institution, :edu_year, :rank)');
            $stmt->execute(array(
                    ':pid' => $profile_id,
                    ':institution' => $institution_id,
                    ':edu_year' => $edu_year,
                    ':rank' => $rank)
            );
            $rank++;
        }
        $_SESSION['success'] = 'Profile added';
        header( 'Location: index.php' ) ;
        return;
  }
}

// Fall through into the View
?>
<!DOCTYPE html>
<html>
<head>
<?php require_once "bootstrap.php"; ?>
<title>Preyas Hanche Profile Database Page</title>
</head>
<body>
<div class="container">
<?php
// Note triple not equals and think how badly double
// not equals would work here...
if ( isset($_SESSION['error']) ) {
    echo('<p style="color: red;">'.htmlentities($_SESSION['error'])."</p>\n");
    unset($_SESSION['error']);
}

?>
<h1>Adding Profile for UMSI</h1>
<form method="post">
<p>First Name:
<input type="text" name="first_name" size="60"/></p>
<p>Last Name:
<input type="text" name="last_name" size="60"/></p>
<p>Email:
<input type="text" name="email" size="30"/></p>
<p>Headline:<br/>
<input type="text" name="headline" size="80"/></p>
<p>Summary:<br/>
<textarea name="summary" rows="8" cols="80"></textarea>
<p>
Education: <input type="submit" id="addEdu" value="+">
<div id="edu_fields">
</div>
</p>
<p>
Position: <input type="submit" id="addPos" value="+">
<div id="position_fields">

</div>
<p>
<input type="submit" value="Add">
<input type="submit" name="cancel" value="Cancel">
</p>
</form>

<script>
countPos = 0;
countEdu = 0;
$(document).ready(function(){
window.console && console.log('Document ready called');
$('#addPos').click(function(event){
event.preventDefault();
if(countPos >= 9){
  alert("Maximum of nine position entries exceeded");
  return;
}
countPos++;
window.console && console.log("Adding position" + countPos);
$('#position_fields').append(
  '<div id="position' + countPos +'" \
  <p>Year: <input type="text" name="year' + countPos + '" value="" /> \
  <input type="button" value="-" \
  onclick="$(\'#position'+countPos+'\').remove();return false;"></p> \
  <textarea name="desc'+countPos+'" rows="8" cols="80"></textarea> \
  </div>');
});

$('#addEdu').click(function (event) {
  event.preventDefault();
  if (countEdu >= 9) {
    alert("Maximum of nine education entries exceeded");
    return;
    }
  countEdu++;
  window.console && console.log("Adding education " + countEdu);
  $('#edu_fields').append(
    '<div id="edu' + countEdu + '"> \
    <p>Year: <input type="text" name="edu_year' + countEdu + '" value="" /> \
    <input type="button" value="-" onclick="$(\'#edu' + countEdu + '\').remove();return false;"><br>\
    <p>School: <input type="text" size="80" name="edu_school' + countEdu + '" class="school" value="" />\
    </p></div>'
    );
  $('.school').autocomplete({
  source: "school.php"
    });
  });
});
</script>

</div>
</body>
