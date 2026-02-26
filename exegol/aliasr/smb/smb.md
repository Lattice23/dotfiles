# smb

## smbclient-ng - connect kerberos
#plateform/linux #target/remote #cat/RECON
```
smbng -d "<domain>" -u "<user>" -p "<password>" --ip "<target_ip>" --host "<dc_fqdn>" -k --kdcHost "<dc_fqdn>"
```

## smbclient-ng - connect normal
#plateform/linux #target/remote #cat/RECON
```
smbng -d "<domain>" -u "<user>" -p "<password>" --host "<target_ip>"
```

## enum4linux - connect normal
#plateform/linux #target/remote #cat/RECON
```
enum4linux-ng -A -u "<domain>"/"<user>" -p "<password>" "<target_ip>"
```

## smbclient.py - connect normal
#plateform/linux #target/remote #cat/RECON
```
smbclient.py "<domain>"/"<user>":"<password>"@"<ip>"
```
## rpcclient - enumdomusers
#plateform/linux #target/remote #cat/RECON 
```
rpcclient <ip> -U "<user>%<password>" -c "enumdomusers;quit"
```

## rpcclient - srvinfo
#plateform/linux #target/remote #cat/RECON 
```
rpcclient <ip> -U "<user>%<password>" -c "srvinfo;quit"
```

## rpcclient - get user sid
#plateform/linux #target/remote #cat/RECON 
```
rpcclient <ip> -c "lookupnales <name>; wmic useraccount get name,sid; quit"
```

## rpcclient - querydominfo
#plateform/linux #target/remote #cat/RECON 
```
rpcclient <ip> -U "<user>%<password>" -c "querydominfo;quit"
```

## rpcclient - getdompwinfo  (password policy)
#plateform/linux #target/remote #cat/RECON 
```
rpcclient <ip> -U "<user>%<password>" -c "getdompwinfo;quit"
```

## rpcclient - netshareenum  (password policy)
#plateform/linux #target/remote #cat/RECON 
```
rpcclient <ip> -U "<user>%<password>" -c "netshareenum;quit"
```

## Trying all username as password from list of users
#plateform/linux #target/remote #cat/ATTACK/BRUTEFORCE-SPRAY  
```
for u in `cat <file>`; do echo -n "user: $u " && rpcclient -U "$u%$u" -c "getusername;quit" <ip>; done
```

## rpcclient - enum (Enum commands list)
#plateform/linux #target/remote #cat/RECON
```
rpcclient <ip> -U "<user>%<pass>" -c "enum;quit"
```

## rpcclient - enumdomains (Current domain)
#plateform/linux #target/remote #cat/RECON
```
rpcclient <ip> -U "<user>%<pass>" -c "enumdomains;quit"
```

## rpcclient - enumdomgroups (Enum Domain groups)
#plateform/linux #target/remote #cat/RECON
```
rpcclient <ip> -U "<user>%<pass>" -c "enumdomgroups;quit"
```

## rpcclient - querygroup (Enum Group Information)
#plateform/linux #target/remote #cat/RECON
```
rpcclient <ip> -U "<user>%<pass>" -c "querygroup <RID>;quit"
```

## rpcclient - querygroupmem (Enum Group Membership)
#plateform/linux #target/remote #cat/RECON
```
rpcclient <ip> -U "<user>%<pass>" -c "querygroupmem <RID>;quit"
```

## rpcclient - queryuser (Enumerate specific User/ computer information by RID)
#plateform/linux #target/remote #cat/RECON
```
rpcclient <ip> -U "<user>%<pass>" -c "queryuser <RID>;quit"
```

## rpcclient - getusrdompwinfo (User password policies)
#plateform/linux #target/remote #cat/RECON
```
rpcclient <ip> -U "<user>%<pass>" -c "getusrdompwinfo <RID>;quit"
```

## rpcclient - lsaenumsid (Local Users LSA Enum SID)
#plateform/linux #target/remote #cat/RECON
```
rpcclient <ip> -U "<user>%<pass>" -c "lsaenumsid;quit"
```

## rpcclient - lookupsid (Local Users Lookup SID)
#plateform/linux #target/remote #cat/RECON
```
rpcclient <ip> -U "<user>%<pass>" -c "lookupsid <SID>;quit"
```

## rpcclient - setuserinfo2 (Reset AD user password)
#plateform/linux #target/remote #cat/EXPLOIT
```
rpcclient <ip> -U "<user>%<pass>" -c "setuserinfo2 <LOGIN> 23 '<NEWPASSWORD>';quit"
```


