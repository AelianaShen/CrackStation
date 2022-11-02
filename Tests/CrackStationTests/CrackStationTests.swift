import XCTest
import CrackStation
@testable import CrackStation

final class CrackStationTests: XCTestCase {
    func testSha1_a() throws {
        let ans = encryptUsingSha1(from: "a")
        XCTAssertEqual(String(ans), "SHA1 digest: 86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")
    }
    func testSha1_7() throws {
        let ans = encryptUsingSha1(from: "7")
        XCTAssertEqual(String(ans), "SHA1 digest: 902ba3cda1883801594b6e1b452790cc53948fda")
    }
    func testLoadingLookupTable() throws {
        //when
        let lookupTable = try CrackStation.loadDictionaryFromDisk()
        //then
        XCTAssertNotNil(lookupTable)
    }
    func testLookup_a() throws {
        //when
        let lookupTable = try CrackStation.loadDictionaryFromDisk()
        let lookupIndex = lookupTable.firstIndex(where: {$0.value.elementsEqual("a")})
        //then
        if let index = lookupIndex {
            XCTAssertEqual(lookupTable[index].key,"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")
        }else{
            XCTAssert(false)
        }
    }
    func testLookup_86f7e() throws {
        //when
        let lookupTable = try CrackStation.loadDictionaryFromDisk()
        let ans = lookupTable["86f7e437faa5a7fce15d1ddcb9eaeaea377667b8"]
        //then
        XCTAssertEqual(ans,"a")
        
    }
    func testHashNotFound() throws {
        //when
        let lookupTable = try CrackStation.loadDictionaryFromDisk()
        let ans = lookupTable["_"]
        //then
        XCTAssertNil(ans)
    }
    func testCrack0() throws {
        //when
        let ans = try CrackStation.crack(password: "b6589fc6ab0dc82cf12099d1c2d40ab994e8410c")
        //then
        XCTAssertEqual(ans,"0")
    }
    func testCrackNotFound() throws {
        //when
        let ans = try CrackStation.crack(password: "")
        //then
        XCTAssertEqual(ans,nil)
    }
}
