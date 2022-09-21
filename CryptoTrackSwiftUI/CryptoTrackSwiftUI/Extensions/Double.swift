//
//  Double.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 14.09.2022.
//

import Foundation
import SwiftUI

extension Double {
    
    private var currencyPriceFormatter : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        return formatter
    }
    private var percentageFormatter : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }
    
    func toUSDCurrency() -> String {
        
        var minDigit = 0
        var maxDigit = 2
        
        let number = abs(Double(self))
        
        switch number {
        case 10000...:
            minDigit = 0
            maxDigit = 0
        case 1000...:
            minDigit = 2
            maxDigit = 4
        case 10...:
            minDigit = 3
            maxDigit = 5
        case 1...:
            minDigit = 4
            maxDigit = 6
        case 0...:
            minDigit = 6
            maxDigit = 8
            
        default:
            minDigit = 6
            maxDigit = 8
        }
        currencyPriceFormatter.minimumFractionDigits = minDigit
        currencyPriceFormatter.maximumFractionDigits = maxDigit
        
        return currencyPriceFormatter.string(for: self) ?? "$0.00"
    }
    
    func toPercentString() -> String {
        return "\(self >= 0 ? "+":"-" )%"+(percentageFormatter.string(for: self) ?? "0.00").replacingOccurrences(of: "-", with: "")
    }
    
    func asNumberString(digit: Int = 2) -> String{
        return String(format: "%.\(digit)f", self)
    }
    
    func toPercentColor() -> Color {
        return self >= 0 ? Color.theme.currencyGreenColor : Color.theme.currencyRedColor
    }
    func getImageArrowSystemName() -> String{
        return self >= 0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill"
    }
    func formattedWithAbbreviations() -> String {
        let number = abs(Double(self))
        let sign = (self < 0) ? "-" : ""
        
        switch number {
            
        case 1_000_000_000_000...:
            let formatted = number / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = number / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = number / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = number / 1_000
            let stringFormatted = formatted.asNumberString(digit: 3)
            return "\(sign)\(stringFormatted)K"
        case 1...:
            return self.asNumberString(digit: 3)
        case 0...:
            return self.asNumberString(digit: 6)
            
        default:
            return "\(sign)\(self)"
        }
    }
}
