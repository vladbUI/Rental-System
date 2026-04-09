<?php
$conn = @oci_connect('system', 'oraclenigabo', 'localhost/XE');
if (!$conn) {
    $e = oci_error();
    echo "FAILED: " . $e['message'] . "\n";
} else {
    echo "CONNECTION SUCCESSFUL!\n";
    $sql = "SELECT table_name FROM user_tables ORDER BY table_name";
    $stid = oci_parse($conn, $sql);
    oci_execute($stid);
    echo "Existing tables:\n";
    $found = false;
    while ($row = oci_fetch_assoc($stid)) {
        echo "  - " . $row['TABLE_NAME'] . "\n";
        $found = true;
    }
    if (!$found) echo "  (none)\n";
    oci_close($conn);
}
?>
