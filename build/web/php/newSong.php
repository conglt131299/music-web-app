<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <?php
        MSSQL_CONNECT('localhost','sonnt69','sonnt69') or DIE("DATABASE FAILED TO RESPOND.");
        mssql_select_db('MusicDB') or DIE("Database unavailable");

        $query = "SELECT * FROM dbo.table";

        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("s", $_GET['q']);
        $stmt->execute();
        $stmt->store_result();
        $stmt->bind_result($cid, $cname, $name, $adr, $city, $pcode, $country);
        $stmt->fetch();
        $stmt->close();

        echo "<table>";
        echo "<tr>";
        echo "<th>CustomerID</th>";
        echo "<td>" . $cid . "</td>";
        echo "<th>CompanyName</th>";
        echo "<td>" . $cname . "</td>";
        echo "<th>ContactName</th>";
        echo "<td>" . $name . "</td>";
        echo "<th>Address</th>";
        echo "<td>" . $adr . "</td>";
        echo "<th>City</th>";
        echo "<td>" . $city . "</td>";
        echo "<th>PostalCode</th>";
        echo "<td>" . $pcode . "</td>";
        echo "<th>Country</th>";
        echo "<td>" . $country . "</td>";
        echo "</tr>";
        echo "</table>";
        ?>
    </body>
</html>
