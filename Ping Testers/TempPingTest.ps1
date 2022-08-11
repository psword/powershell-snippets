$test = @(
"IPAddress",
"domain.com"
)
foreach($ip in $test) {
    Test-NetConnection -ComputerName $ip -CommonTcpPort HTTP

}