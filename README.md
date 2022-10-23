# CrackStation

This package demo the cracking method of plain-text passwords.
The latest update is POC v1.

A. What's here for?
In the POC v1 version, I aim to crack any single-character password, which fits the regular expression [A-Za-z0-9].

Test cases:
    testSha1_a()                Able to turn a to SHA1 code
    testSha1_7()                Able to turn 7 to SHA1 code
    testLoadingLookupTable()    Able to load lookup table
    testLookup_a()              Able to find a's SHA1 from lookup table
    testLookup_86f7e()          Able to find a by given a's SHA1
    testHashNotFound()          When not found, return nil

B. How to use it? 
I have two encrypt function, encryptUsingSha1 and encryptUsingSha2 in Sources > CrackStation > EncrptLib. These function as a practice of encryption a string. They are available on macOS 10.15 or higher version. If you want to call them, example as below:

    encryptUsingSha1(from: inpurString)
    It will return “SHA1 digest: xxxxxxxxxxxxxx”

I have a data JSON file, as a library. It allows my cracking function access to look up the correct password. If you want to access the library to look for a specific words' SHA1, example as below:

    let lookupTable = try CrackStation.loadDictionaryFromDisk()
    let ans = lookupTable["a"]
    ans is the SHA-1 code for "a" character.
    
If you want to access the library to look for a specific word by given SHA1, the example as below:
    
    let lookupTable = try CrackStation.loadDictionaryFromDisk()
    let lookupIndex = lookupTable.firstIndex(where: {$0.value.contains("86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")})
    if let index = lookupIndex {
        lookupTable[index].key is the keyword you are looking for
    }
