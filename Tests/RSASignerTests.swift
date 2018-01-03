//
//  RSASignerTests.swift
//  Tests
//
//  Created by Carol Capek on 02.11.17.
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

class RSASignerTests: CryptoTestCase {
    let signatureBase64URL = "Zs9rmMw-za1uXpUS2VIOcEHaMuzQl6fBCi_40kRVIE0GUruWSvpHro1oXhGwf7HqKPLx_LM8bLPCORWi9OWU4swZHY8p-GR5rhLLs2XkdIvI5kdbikr7pZOsC9NaxJKMWAntKbTZY6exkoU8vM6xL9MQtH8QFLXTjI-ZvAXbp2Ws9CnIcvOPFqAupuUKADFRpSlODlsXy71CJ3iQeBaPfHvLk61jdW6hgHYj-0WYmrFhiF1dI9MZf9J3ApdKFsW0WFuxa8Y47HlCirEOb3lz7vm8o9lNBTnt0dpWOZMTU6lHuTBgiXvyENzJoKJymVsUbMmy-2LNejmVpPt1Pm3zrA"

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSigning() {
        guard privateKey != nil else {
            XCTFail()
            return
        }

        let signer = RSASigner(algorithm: .RS512, privateKey: privateKey!)
        let signature = try! signer.sign(message.data(using: .utf8)!)

        XCTAssertEqual(signature.base64URLEncodedString(), signatureBase64URL)
    }
}
