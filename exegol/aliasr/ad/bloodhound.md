# bloodhound
#target/remote #os/windows #cat/ad 

## bloodhound - collect data
#os/linux #target/remote #port/389 #port/631 #cat/RECON
https://github.com/fox-it/BloodHound.py

```bash
bloodhound-python --zip -c All -d "<domain>" -u "<user>" -p "<password>" -dc "<dc_fqdn>" -ns "<dc-ip>"
```

## bloodhound - collect data (alternative)
https://github.com/fox-it/BloodHound.py

```bash
bloodhound-python -d <domain> -u <user> -p <password> -gc <global_catalog> -dc <dc_fqdn> -c all --zip
```

## rusthound - collect data

```bash
rusthound -d "<domain>" -u "<user>"@"<domain>" -p "<password>" --zip --ldaps --adcs --old-bloodhound
```
