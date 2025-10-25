
#web
## gobuster scan classic
```
gobuster dir -u <url> -w <wordlist>
```

## gobuster scan pentest classic fuzz
```
gobuster dir -u <url> -w <wordlist> -x json,html,php,txt,xml,md
```

## gobuster scan high rate
```
gobuster dir -u <url> -w <wordlist> -t 30
```

## gobuster scan with adding extension
```
gobuster dir -u <url> -w <wordlist> -x json,html,php,txt
```


## wfuzz with number on url ( url : http://site/ )
```
wfuzz -z range,1-1000 -u <url>FUZZ
```

## wfuzz with wordlist on url ( url : http://site/ )
```
wfuzz -z file,<file> -u <url>FUZZ
```

## wfuzz on post parameter
```
wfuzz -z file,<file> -X post -u <url> -d 'FUZZ=1'
```

## dirb commons
```
dirb <url> -w /usr/share/wordlists/dirb/common.txt
```


## ffuf fuzz keyword in url
```
ffuf -w <wordlist> -u <url>/FUZZ
```

## ffuf fuzz Host filter response size
```
ffuf -w <wordlist> -u <url> -H "Host: FUZZ" -fs <response_size>
```

## ffuf GET parameter fuzzing
```
ffuf -w <wordlist> -u <url>?<param>=FUZZ -fs <response_size>
```

## ffuf POST parameter fuzzing and filter response code 401
```
ffuf -w <wordlist> -u <url> -X POST -d "username=admin\&password=FUZZ" -fc 401
```


## nikto - first vuln scan
```
nikto -C all -h <url>
```

## default scan
```
feroxbuster --url <url>
```

## default scan with wordlist
```
feroxbuster --url <url> -w <wordlist>
```

## Multiple headers
```
feroxbuster -u <url> -H "<header>" "<header>"
```

## IPv6, non-recursive scan with INFO-level logging enabled
```
feroxbuster -u <proto|https>://[<ipv6>] --no-recursion -vv
```
        
## Abort or reduce scan speed to individual directory scans when too many errors have occurred
```
feroxbuster -u <url> --auto-bail
```

