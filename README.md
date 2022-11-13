# CrackStation

This package demo the cracking method of plain-text passwords.
The latest update is POC v2 (version 1.1.0).

### A. What's here for?
In the POC v2 version, I aim to crack any two-character password, which fits the regular expression [A-Za-z0-9]{1,2}.
People can use this package to understand how programs can decrypt passwords.

| Test cases | Description |
| --- | --- |
| testSha1_a() | Able to turn a to SHA1 code |
| testSha1_7() | Able to turn 7 to SHA1 code |
| testLoadingLookupTable() | Able to load lookup table |
| testLookup_a() | Able to find a's SHA1 from lookup table |
| testLookup_86f7e() | Able to find a by given a's SHA1 |
| testHashNotFound() | When not found, return nil |
| testCrack0 | Able to find 0's SHA1 from crack()|
| testCrackNotFound() | When crack() did not find any matches, return nil |

### B. How to use it?
I have two encrypt function, encryptUsingSha1 and encryptUsingSha2 in Sources > CrackStation > EncrptLib. These function as a practice of encryption a string. They are available on macOS 10.15 or higher version. If you want to call them, example as below:

    encryptUsingSha1(from: inpurString)
    It will return “SHA1 digest: xxxxxxxxxxxxxx”

I have a data JSON file, as a library. It allows my cracking function access to look up the correct password. If you want to access the library to look for a specific words' SHA1, example as below:

    let lookupTable = try CrackStation.loadDictionaryFromDisk()
    let lookupIndex = lookupTable.firstIndex(where: {$0.value.elementsEqual("a")})
    //then
    if let index = lookupIndex {
        lookupTable[index].key is the SHA-1 code for "a" character.
    }
    
If you want to access the library to look for a specific word by given SHA1 "86f7e437faa5a7fce15d1ddcb9eaeaea377667b8", the example as below:
    
    let ans = CrackStation().lookupTable["86f7e437faa5a7fce15d1ddcb9eaeaea377667b8"]
    ans is the keyword you are looking for

If you want to use crack function:

    let ans = CrackStation().crack(shaHash: "86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")
    ans is the key which match the given SHA1
    else return "nil"

If you want to use decrypt function:

    let ans = decrypt(shaHash: "86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")
    ans is the key which match the given SHA1
    else return "nil"

### C. Version
The latest stable version is 1.1.0

### D. Author
This package is build by Aeliana (Po-Hsuan) Shen.
