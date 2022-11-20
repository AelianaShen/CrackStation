import XCTest
import CrackStation
@testable import CrackStation

final class CrackStationTests: XCTestCase {
    
    func testSha1_a() throws {
        //when
        let SHA1digest = encryptUsingSha1(from: "a")
        //then
        XCTAssertEqual(String(SHA1digest), "SHA1 digest: 86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")
    }
    
    func testSha1_7() throws {
        //when
        let SHA1digest = encryptUsingSha1(from: "7")
        //then
        XCTAssertEqual(String(SHA1digest), "SHA1 digest: 902ba3cda1883801594b6e1b452790cc53948fda")
    }
    
    func testLoadingLookupTable() throws {
        //when
        let lookupTable = CrackStation.loadDictionaryFromDisk()
        //then
        XCTAssertNotNil(lookupTable)
    }
    
    func testLookup_sha1_a() throws {
        //when
        let lookupTable = CrackStation.loadDictionaryFromDisk()
        let lookupIndex = lookupTable.firstIndex(where: {$0.value.elementsEqual("a")})
        //then
        if let index = lookupIndex {
            XCTAssertEqual(lookupTable[index].key,"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")
        }else{
            XCTAssert(false)
        }
    }
    
    func testDecrypt_sha1_0() throws {
        //when
        let password = CrackStation().decrypt(shaHash: "b6589fc6ab0dc82cf12099d1c2d40ab994e8410c")
        //then
        XCTAssertEqual(password,"0")
    }
    
    func testDecrypt_sha2_9() throws {
        //when
        let password = CrackStation().decrypt(shaHash: "19581e27de7ced00ff1ce50b2047e7a567c76b1cbaebabe5ef03f7c3017bb5b7")
        //then
        XCTAssertEqual(password,"9")
    }
    
    func testDecrypt_sha1_J4() throws {
        //when
        let password = CrackStation().decrypt(shaHash: "007b8ed60734aaaee298ed9b7130d6dec15aced3")
        //then
        XCTAssertEqual(password,"J4")
    }
    
    func testDecrypt_sha2_C0() throws {
        //when
        let password = CrackStation().decrypt(shaHash: "c899b3d71c1f520db816563ec9d7d0c4f15a47776d1e52e83bddfec13a440e7b")
        //then
        XCTAssertEqual(password,"C0")
    }
    
    func testDecrypt_sha1_Jxs() throws {
        //when
        let password = CrackStation().decrypt(shaHash: "cfa726c3361cdb6dc75ca1323e3909efaa4750c5")
        //then
        XCTAssertEqual(password,"Jxs")
    }
    
    func testDecrypt_sha2_Jxs() throws {
        //when
        let password = CrackStation().decrypt(shaHash: "40b6a79b2bd95fdbe0116948b3e1bb740c9b1fac6895b598680e8417f3c6d5d4")
        //then
        XCTAssertEqual(password,"Jxs")
    }
    
    func testCrackNotFound() throws {
        //when
        let password = CrackStation().decrypt(shaHash: "")
        //then
        XCTAssertEqual(password,nil)
    }
}
