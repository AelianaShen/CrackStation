import Foundation
public struct CrackStation {
    public private(set) var text = "Hello, World!"

    public init() {
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
        let lookupIndex = lookupTable.firstIndex(where: {$0.value.contains(password)})
        //then
        if let index = lookupIndex {
            return lookupTable[index].key
        }else{
            return "SHA1 Not Found"
        }
    }
}
