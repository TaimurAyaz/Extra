//
//  UIColor+Extensions.swift
//
//
//  Created by TaimurAyaz on 2024-03-15.
//

#if canImport(UIKit)

import Foundation
import UIKit

// - MARK: Hex
public extension UIColor {
    /// Convenience initializer to create a UIColor instance from a hexadecimal string.
    /// - Parameters:
    ///   - hex: The hexadecimal representation of the color.
    ///   - alpha: The alpha value of the color (default is 1.0).
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        // Trim whitespaces and convert to uppercase
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        // Remove '#' prefix if present
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        // Ensure hex string is of valid length
        if hexFormatted.count > 6 {
            hexFormatted = String(hexFormatted.prefix(6))
        }
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        // Convert hex string to UInt64
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        // Initialize UIColor with RGB values extracted from hex string
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
    
    /// Convert UIColor to its hexadecimal representation.
    var toHex: String? {
        return toHex()
    }

    /// Convert UIColor to its hexadecimal representation.
    /// - Parameter alpha: A boolean indicating whether to include alpha value.
    /// - Returns: Hexadecimal representation of the color.
    func toHex(alpha: Bool = false) -> String? {
        guard let components = cgColor.components, components.count >= 3 else {
            return nil
        }

        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)

        if components.count >= 4 {
            a = Float(components[3])
        }

        // Convert RGB(A) values to hexadecimal
        if alpha {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
}


#endif
