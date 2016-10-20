//
//  BankVaultTests.swift
//  Protocols
//
//  Created by Jim Campagno on 8/8/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//


import Quick
import Nimble
@testable import Protocols

class BankSpec: QuickSpec {
    override func spec() {
        
        let testVault = BankVault(name: "Garden City Vault", address: "90210 Street")
        
        describe("ProvideAccess Protocol") {
            it("Should provide a function called allowEntryWithPassword(_:) which return back a true or false based upon the correct password.") {
                
                // Empty Array test
                let noDigitsResponse = testVault.allowEntryWithPassword(password: [])
                expect(noDigitsResponse).to(equal(false))
                
                // Too many digits test
                let enteredDigits = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
                let tooManyDigitsResponse = testVault.allowEntryWithPassword(password: enteredDigits)
                expect(tooManyDigitsResponse).to(equal(false))
                
                // Every other number is even (beginning with first) test
                let correctDigits = [0, 2, 2, 3, 4, 1, 6]
                let correctDigitsResponse = testVault.allowEntryWithPassword(password: correctDigits)
                expect(correctDigitsResponse).to(equal(true))
                
                // One of the digits that should be even is not
                let incorrectDigits = [1, 2, 2, 2, 2, 2]
                let incorrectDigitsResponse = testVault.allowEntryWithPassword(password: incorrectDigits)
                expect(incorrectDigitsResponse).to(equal(false))
                
            }
        }
    }
}
