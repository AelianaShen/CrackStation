import Foundation
public struct CrackStation : Decrypter {
    private let lookupTable = loadDictionaryFromDisk()

    public init() {}
    
    static func loadDictionaryFromDisk() -> [String : String] {
        guard let path = Bundle.module.url(forResource: "data", withExtension: "json") else { return [:] }
        
        guard let data = try? Data(contentsOf: path) else { return [:] }
        let jsonResult = try? JSONSerialization.jsonObject(with: data)
        
        if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> {
            return lookupTable
        } else {
            return [:]
        }
    }
    
    public func decrypt(shaHash: String) -> String? {
        return lookupTable[shaHash]
    }
}
