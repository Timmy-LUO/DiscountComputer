//
//  Float Extension.swift
//  DiscountComputer
//
//  Created by 羅承志 on 2021/12/21.
//

import Foundation

extension Float {
    
    func string(to decimal: Int = 2) -> String {
        return String(format: "%.\(decimal)f", self)
    }
}
