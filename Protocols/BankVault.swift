//
//  BankVault.swift
//  Protocols
//
//  Created by Papa Roach on 8/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//


class BankVault {
    
    let name: String
    let address: String
    var amount: Double = 0.0
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
    
}


protocol ProvideAccess {
    func allowEntryWithPassword(password: [Int]) -> Bool
}


extension BankVault: ProvideAccess {
    func allowEntryWithPassword(password: [Int]) -> Bool {
        if password.count == 0 {
            return false
        } else if password.count > 10 {
            return false
        } else {
            var result: Bool = true
            
            for (index, digit) in password.enumerated() {
                if index % 2 == 0 && digit % 2 != 0 {
                    result = false
                }
            }
            return result
        }
    }
}
