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
}
