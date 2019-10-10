<?php
require_once "pdo.php";
session_start();
if(!isset($_SESSION['name'])) {
  header("Location: firstscreen.php");
  return;
}


?>
<!DOCTYPE html>
<html>
<head>
<title>Preyas Hanche - Profile Database</title>
<?php require_once "bootstrap.php"; ?>
</head>
<body>
<div class="container">
<h1>Preyas Hanche Resume Registry</h1>
<br>
<?php
if ( isset($_SESSION['error']) ) {
    echo '<p style="color:red">'.$_SESSION['error']."</p>\n";
    unset($_SESSION['error']);
}
if ( isset($_SESSION['success']) ) {
    echo '<p style="color:green">'.$_SESSION['success']."</p>\n";
    unset($_SESSION['success']);
}
echo("<table>");
echo("<tr>");
echo("<th>Name</th>");
echo("<th>Headline</th>");
echo("<th>Action</th>");
echo("</tr>");
$stmt = $pdo->query("SELECT * FROM profile");
while ( $row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    echo "<tr><td>";
    echo('<a href="view.php?profile_id='.$row['profile_id'].'">');
    echo(htmlentities($row['first_name']));
    echo("</a>");
    echo("</td><td>");
    echo(htmlentities($row['headline']));
    echo("</td><td>");
    echo('<a href="edit.php?profile_id='.$row['profile_id'].'">Edit</a> / ');
    echo('<a href="delete.php?profile_id='.$row['profile_id'].'">Delete</a>');
    echo("</td></tr>\n");
}
?>
</table>
<br>
<p>
<a href="add.php">Add New Entry</a>
<a href="logout.php">Logout</a>
</p>
</div>
</body>
