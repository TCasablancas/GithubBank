//
//  String+Extension.swift
//  GithubBank
//
//  Created by Thyago on 31/12/20.
//

import Foundation

extension String {
    func convertToNumber() -> NSDecimalNumber? {
        guard self.count > 3 else { return nil }
        let str = self
        let status = str.last
        var number = String(str.dropLast())
        number.insert(",", at: number.index(number.endIndex, offsetBy: -3))
        let locale = Locale(identifier: "pt_BR")
        let decimalNumber = NSDecimalNumber(string: number, locale: locale)
        
        guard status == "+" else {
            let negative = NSDecimalNumber(string: "1.0")
            return decimalNumber.multiplying(by: negative)
        }
        
        return NSDecimalNumber(string: number, locale: locale)
    }
    
    func formatNumber(_ n: Int) -> String {
        let num = abs(Double(n))
        let sign = (n < 0) ? "-" : ""

        switch num {
        case 1_000_000_000...:
            var formatted = num / 1_000_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)b"

        case 1_000_000...:
            var formatted = num / 1_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)m"

        case 1_000...:
            var formatted = num / 1_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)k"

        case 0...:
            return "\(n)"

        default:
            return "\(sign)\(n)"
        }
    }
}

extension Double {
    func reduceScale(to places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        let newDecimal = multiplier * self
        let truncated = Double(Int(newDecimal))
        let originalDecimal = truncated / multiplier
        return originalDecimal
    }
}
