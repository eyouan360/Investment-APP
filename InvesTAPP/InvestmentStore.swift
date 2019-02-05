//
//  InvestmentStore.swift
//  InvesTAPP
//
//  Created by User on 12/2/17.
//  Copyright © 2017 Zerocool. All rights reserved.
//

import UIKit


class InvestmentStore {
    
    var allInvestments = [Investment]()
    
    func moveInvestment(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // Get reference to object being moved so you can re-insert it
        let movedInvestment = allInvestments[fromIndex]
        
        // Remove item from array
        allInvestments.remove(at: fromIndex)
        
        // Insert item in array at new location
        allInvestments.insert(movedInvestment, at: toIndex)
    }
    
    
    @discardableResult func createInvestment() -> Investment {
        let newInvestment = Investment(random: true)
        
        allInvestments.append(newInvestment)
        
        return newInvestment
    }
    
    func removeInvestment(_ investment: Investment) {
        if let index = allInvestments.index(of: investment) {
            allInvestments.remove(at: index)
        }
    }
    
}
