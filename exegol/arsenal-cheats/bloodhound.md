# bloodhound

#bloodhound
## bloodhound - collect data
```bash
bloodhound-python --zip -c All -d "<domain>" -u "<user>" -p "<password>" -dc "<dc_fqdn>" -ns "<dc_ip>"
```

## bloodhound - collect data (alternative)
```bash
bloodhound-python -d <domain> -u <user> -p <password> -gc <global_catalog> -dc <dc_fqdn> -c all --zip
```

## rusthound - collect data
```bash
rusthound -d "<domain>" -u "<user>"@"<domain>" -p "<password>" --zip --ldaps --adcs --old-bloodhound
```
