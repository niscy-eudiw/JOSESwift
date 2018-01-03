//
//  RSAVerifierTests.swift
//  Tests
//
//  Created by Carol Capek on 03.11.17.
//
//  ---------------------------------------------------------------------------
//  Copyright 2018 Airside Mobile Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//  ---------------------------------------------------------------------------
//

import XCTest
@testable import SwiftJOSE

class RSAVerifierTests: CryptoTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testVerifying() {
        guard publicKey != nil else {
            XCTFail()
            return
        }

        let jws = try! JWS(compactSerialization: compactSerializedJWSConst)
        let verifier = RSAVerifier(algorithm: .RS512, publicKey: publicKey!)
        
        guard let signingInput = [jws.header, jws.payload].asJOSESigningInput() else {
            XCTFail()
            return
        }

        XCTAssertTrue(try! verifier.verify(signingInput, against: jws.signature))
    }

}
