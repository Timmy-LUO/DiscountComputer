//
//  Calculator.swift
//  DiscountComputer
//
//  Created by 羅承志 on 2021/12/20.
//

import Foundation

struct Calculator {
    
    var discount: Float = 1  // 折扣
    var amount: Float = 0  // 金額
    
    // %折扣
    var discountText: String {
        return "\(Int(discount * 100)) %折扣"
    }
    // 折扣後金額
    var amountAfterDiscount: Float {
        return discount * amount
    }
    // 更改折扣
    mutating func changeDiscount(_ value: Float) {
        self.discount = value
    }
    // 更改金額
    mutating func changeAmount(text: String?) {
        let text = text ?? ""
        self.amount = Float(text) ?? 0
    }
    // differenceLabel  Float 轉 String
    var saveMoneyText: String {
        return "省下: " + difference.string(to: 0)
    }
    // 計算差額
    var difference: Float {
        return amount - amountAfterDiscount
    }
}

