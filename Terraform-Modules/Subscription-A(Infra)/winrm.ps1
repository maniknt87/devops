winrm quickconfig -q
Enable-PSRemoting -Force

Set-Item WSMan:\localhost\Service\Auth\Basic -Value $true
Set-Item WSMan:\localhost\Service\AllowUnencrypted -Value $true

Restart-Service WinRM

netsh advfirewall firewall add rule name="WinRM" protocol=TCP dir=in localport=5985 action=allow