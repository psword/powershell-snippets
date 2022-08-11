Set-SchUseStrongCrypto -Value 1
Set-WsusIISLimitInterval -Minutes 15
Set-WsusIISLoadBalancerCapabilities -Level TcpLevel
Set-WsusWebExecutionTimeout -TimeoutInSeconds 7200
Set-WsusWebMaxRequestLength -MaxRequestLength 204800
Set-WsusIISMaxCachedUpdates -MaxCachedUpdates 30000
Set-WsusIISMaxInstalledPrerequisites -MaxInstalledPrerequisites 800
Set-WsusIISIdleTimeout -Minutes 0
Set-WsusIISRegularTimeInterval -Minutes 0
Set-WsusIISPingEnabled -Enabled $Falsess