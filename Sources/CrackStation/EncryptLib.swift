import Foundation
import CryptoKit

// Input: a string.
// Output: the string encrypted using the SHA-1 algorithm.
@available(macOS 10.15, *)
public func encryptUsingSha1(from input: String) -> String {
    let inputData = Data(input.utf8)
    let output = Insecure.SHA1.hash(data: inputData)
    return output.description
}

// Input: a string.
// Output: the string encrypted using the SHA-2 algorithm.
@available(macOS 10.15, *)
public func encryptUsingSha2(from input: String) -> String {
    let inputData = Data(input.utf8)
    let output = SHA256.hash(data: inputData)
    return output.description
}
