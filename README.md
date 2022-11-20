# CrackStation, a Decrypter implementation
This package demo the cracking method of unsalted plain-text passwords.
The latest version is MVP (2.0.0)

### Overview
The package is built by the following process:
- In the POC v1 version, I aim to decrypt any single-character SHA-1 password, which fits the regular expression [A-Za-z0-9].
- In the POC v2 version, I aim to decrypt any two-character SHA-1 password, which fits the regular expression [A-Za-z0-9]{1,2}.
- In the MVP (minimal viable product) version, this package is able to decrypt any three-characters password which matches the regular expression [A-Za-z0-9?!]{1,3}. Whether using SHA-1 or SHA-256 encryption.

### Mission Statement
People can use this package to understand how programs can decrypt passwords.

### Installation
**Swift Package Manager**
The [Swift Package Manager](https://www.swift.org/package-manager) is "a tool for managing the distribution of Swift code. It's integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies."
Once you have your Swift package set up, add CrackStation to the list of dependencies in your `Package.swift` file:
```javascript
dependencies: [
    .package(url: "https://github.com/AelianaShen/CrackStation.git", .upToNextMajor(from: "2.0.0"))
]
```

### Usage
#### The API
This package has two public functions. Their function signatures show below:
```js
public func decrypt(shaHash: String) -> String?
```
The decrypt function is used for decrypting hashes back to plain-text passwords. Inputs a hash string and outputs either nil or a password string.
```js
public init()
```
The init function is used for creating a decrypter.

#### Example
If you want to use decrypt function to decrypt a hash code "86f7e437faa5a7fce15d1ddcb9eaeaea377667b8", you can write:
```js
decrypt(shaHash: "86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")
```
The function returns the matched plain-text password with "86f7e437faa5a7fce15d1ddcb9eaeaea377667b8". If the library does not find any matches, the function returns nil.

### Test cases in packege
| Test cases | Description |
| --- | --- |
| testSha1_a() | Able to turn a to SHA1 code |
| testSha1_7() | Able to turn 7 to SHA1 code |
| testLoadingLookupTable() | Able to load lookup table |
| testDecrypt_sha1_0() | Able to decrypt 0's SHA1 |
| testDecrypt_sha2_9() | Able to decrypt 9's SHA2 |
| testDecrypt_sha1_J4() | Able to decrypt J4's SHA1 |
| testDecrypt_sha2_C0() | Able to decrypt C0's SHA2 |
| testDecrypt_sha1_Jxs() | Able to decrypt Jxs's SHA1 |
| testDecrypt_sha2_Jxs() | Able to decrypt Jxs's SHA2' |
| testHashNotFound() | When not found, return nil |

### Author
This package is build by Aeliana (Po-Hsuan) Shen.
