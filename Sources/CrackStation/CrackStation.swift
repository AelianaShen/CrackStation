import Foundation
public struct CrackStation : Decrypter {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    
    public func decrypt(shaHash: String) -> String? {
        let ans = try? CrackStation.crack(password: shaHash)
        if ans == "Optional(\"SHA1 Not Found\")" {
            return nil
        }else{
            return ans
        }
    }
    
    static func loadDictionaryFromDisk() throws -> [String : String] {
        guard let path = Bundle.module.url(forResource: "data", withExtension: "json") else { return [:] }
        
        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)
        
        if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> {
            return lookupTable
        } else {
            return [:]
        }
    }
    public static func crack(password: String) throws -> (String) {
        let lookupTable = try CrackStation.loadDictionaryFromDisk()
        guard let ans = lookupTable[password] else { return "SHA1 Not Found" }
        return ans
    }
}
