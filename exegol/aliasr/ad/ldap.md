# ldap
#target/remote #os/windows #cat/ad #proto/ldap

## godap - connect normal login
```
godap <target_ip> -u <user> -p <password> -d <domain> -S -I
```

## godap - connect hash login
```
godap <target_ip> -u <user> -H <nt_hash> -d <domain> -S -I
```

## ldapsearch base
#cat/ATTACK/CONNECT 
```
ldapsearch -x -H ldap://<dc_fqdn> -s base
```

## ldapsearch SPN
#cat/ATTACK/CONNECT 
```
ldapsearch -Y GSSAPI -H ldap://<dc_fqdn> -D "<user>" -W -b "dc=<domain>,dc=<path>'" "servicePrincipalName=*" servicePrincipalName
```
	
## ldapsearch with base dn
#cat/ATTACK/CONNECT 
```
ldapsearch -x -H ldap://<dc_fqdn> -b <basedn>
```

## ldapsearch base with authentication
#cat/ATTACK/CONNECT 
```
ldapsearch -x -H ldap://<dc_fqdn> -D <domain>\\<username> -w <password> -b 'DC=<domain>,DC=<path>'
```

## ldapsearch - list all users
#cat/ATTACK/CONNECT 
```
ldapsearch -x -H ldap://<dc_fqdn> -D <domain>\\<username> -w <password> -b 'DC=<domain>,DC=<path>' '(&(objectCategory=person)(objectClass=user))'
```

## ldapsearch - list all users protected by adminCount
#cat/ATTACK/CONNECT 
```
ldapsearch -x -H ldap://<dc_fqdn> -D <domain>\\<username> -w <password> -b 'DC=<domain>,DC=<path>' '(&(objectCategory=user)(adminCount=1))'
```

## ldapsearch - list all users with password, pass, identifiant or pwd in their description
#cat/ATTACK/CONNECT 
```
ldapsearch -x -H ldap://<dc_fqdn> -D <domain>\\<username> -w <password> -b 'DC=<domain>,DC=<path>' '(&(objectCategory=user)(|(description=*pass*)(description=*password*)(description=*identifiant*)(description=*pwd*)))'
```

## ldapsearch - list all computer with laps enabled and corresponding laps password if able
#cat/ATTACK/CONNECT 
```
ldapsearch -x -H ldap://<dc_fqdn> -D <domain>\\<username> -w <password> -b 'DC=<domain>,DC=<path>' '(ms-Mcs-AdmPwdExpirationtime=*)' ms-Mcs-AdmPwd
```

## ldapdomaindump
#cat/ATTACK/CONNECT 
```
ldapdomaindump --no-json --no-grep --authtype SIMPLE -o ldap_dump -r <ip> -u <domain>\\<username> -p <password>
```

## ldapsearch-ad - list all password policies including FGPP
#cat/ATTACK/CONNECT 
```
ldapsearch-ad.py --server <dc_fqdn> -d <domain> -u <username> -p <password> --type pass-pols
```

## ldapsearch-ad - get the FGPP applied to a group
#cat/ATTACK/CONNECT 
```
ldapsearch-ad.py --server <dc_fqdn> -d <domain> -u <username> -p <password> -t search -s '(samaccountname=<groupname>)' cn msDS-PSOApplied 
```

## ldapsearch-ad - get the FGPP applied to a user
#cat/ATTACK/CONNECT 
```
ldapsearch-ad.py --server <dc_fqdn> -d <domain> -u <username> -p <password> --type show-user -s '(samaccountname=<username>)'
```



