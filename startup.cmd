
vagrant up

set this_dir=%~dp0
set key_file=%this_dir%.vagrant\machines\default\virtualbox\private_key
set teraterm_pro=C:\Users\takao_sakai\bin\teraterm-4.99\ttermpro.exe

start %teraterm_pro% ^
vagrant@127.0.0.1:2222 ^
/auth=publickey /keyfile=%key_file%
