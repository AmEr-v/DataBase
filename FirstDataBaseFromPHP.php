<?php
$host = "localhost";
$user = "root";
$psw = "";
$db = "rosidb";
$connection = mysqli_connect($host, $user, $psw, $db);
//SELECT * FROM `rosidb`.`country` LIMIT 1000;
$filterData = false;
if (isset($_POST["population"])) {
    $filterData = true;
}
if ($filterData) {
    $Firstletter = $_POST["Firstname"] .'%';
    $giveMeCountries = $connection->prepare("SELECT * FROM country where CountryPopulation <? AND CountryName LIKE ?");
    $giveMeCountries->bind_param("is", $_POST["population"], $Firstletter);
} else {
    $giveMeCountries = $connection->prepare("SELECT * FROM country");
}
//BIND PARAM WHEN NEEDED !!!
$giveMeCountries->execute();
$result = $giveMeCountries->get_result();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        table,
        th,
        td {
            border: 1px solid black;
            text-align: center;
        }
    </style>
</head>

<body>
    <form method="POST">
        <input type="number" placeholder="Choosee number of population" name="population">
        <input type="submit" value="Filter">
        <input type="text" name="Firstname">
    </form>
    <br><br><br>
    <table>
        <tr>
            <th>Country ID</th>
            <th>Country name</th>
            <th>Country Population</th>
        </tr>
        <?php
        while ($row  = $result->fetch_assoc()) {
        ?>
            <tr>
                <?php
                print("<td>" . $row["CountryId"] . "</td>");
                print("<td>" . $row["CountryName"] . "</td>");
                print("<td>" . $row["CountryPopulation"] . "</td>");
                ?>
            </tr>
        <?php
        }
        ?>
    </table>
</body>

</html>