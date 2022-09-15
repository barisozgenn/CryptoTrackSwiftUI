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
    
    func toUSDCurrency(minDigit: Int = 1, maxDigit: Int = 2) -> String {
        currencyPriceFormatter.minimumFractionDigits = minDigit
        currencyPriceFormatter.maximumFractionDigits = maxDigit
        
        return currencyPriceFormatter.string(for: self) ?? "$0.00"
    }
    
    func toPercentString() -> String {
        return "\(self >= 0 ? "+":"-" )%"+(percentageFormatter.string(for: self) ?? "0.00").replacingOccurrences(of: "-", with: "")
    }
    
    func asNumberString() -> String{
        return String(format: "%.2f", self)
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
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberString()
            
        default:
            return "\(sign)\(self)"
        }
    }
}
