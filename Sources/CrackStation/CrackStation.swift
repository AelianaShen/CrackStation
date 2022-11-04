import Foundation

enum Errors : Error {
    case pathNotFound
    case loadLookupTableFail
}

public struct CrackStation : Decrypter {
    var lookupTable = [String:String]()

    public init() {
        do{
            self.lookupTable = try CrackStation.loadDictionaryFromDisk()
        } catch Errors.pathNotFound {
            print("Can't find data.json")
        } catch Errors.loadLookupTableFail {
            print("Load data fail")
        } catch {
            print("Unexpected error: \(error).")
        }
    }
    
    static func loadDictionaryFromDisk() throws -> [String : String] {
        guard let path = Bundle.module.url(forResource: "data", withExtension: "json") else { throw Errors.pathNotFound }
        
        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)
        
        if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> {
            return lookupTable
        } else {
            throw Errors.loadLookupTableFail
        }
    }
    
    public func decrypt(shaHash: String) -> String? {
        let ans = try? CrackStation.crack(shaHash: shaHash)
        return ans
    }
    
    public static func crack(shaHash: String) throws -> String? {
        guard let ans = CrackStation().lookupTable[shaHash] else { return nil }
        return ans
    }
}
