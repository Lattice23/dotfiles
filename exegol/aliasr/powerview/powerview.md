# powerview

## powerview - use
#plateform/linux #target/remote #cat/RECON
```
powerview "<domain>"/"<user>":"<password>"@"<dc_fqdn>" -k
```

## powerview - use hash
#plateform/linux #target/remote #cat/RECON
```
powerview "<domain>"/"<user>":@"<dc-ip>" -H "<<nt_hash>"
```

## powerview - use pfx
#plateform/linux #target/remote #cat/RECON
```
powerview "<dc-ip>" --pfx "<pfx-file>"
```

## powerview - relay mode
#plateform/linux #target/remote #cat/RECON
```
powerview --relay --relay-host "<target_ip>"
```

## powerview - find user description
#plateform/linux #target/remote #cat/RECON
```
powerview "<domain>"/"<user>":"<password>"@"<dc_fqdn>" -k  --query "Get-DomainUser -Where 'Description not \"\"' -Properties sAMAccountName,Description"
```

## powerview - find users
#plateform/linux #target/remote #cat/RECON
```
powerview "<domain>"/"<user>":"<password>"@"<dc_fqdn>" -k  --query "Get-DomainUser -Select sAMAccountName -OutFile <outfile|users.txt>" 
```

## powerview - find group membership
#plateform/linux #target/remote #cat/RECON
```
powerview "<domain>"/"<user>":"<password>"@"<dc_fqdn>" -k  --query "Get-DomainGroup -LDAPFilter \"(!(sAMAccountName=Denied RODC Password Replication Group))\" -Where 'member contains CN=Users' -Properties member,sAMAccountName"
```

## powerview - find gmsa
#plateform/linux #target/remote #cat/RECON
```
powerview "<domain>"/"<user>":"<password>"@"<dc_fqdn>" -k  --query "Get-ADObject -Where 'msDS-GroupMSAMembership != ''' -Properties sAMAccountName,msDS-GroupMSAMembership"
```

