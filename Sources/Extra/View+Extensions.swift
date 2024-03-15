//
//  View+Extensions.swift
//
//
//  Created by TaimurAyaz on 2024-03-15.
//

import Foundation
import SwiftUI

// MARK: - Composition
public extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - block: The block to call on `View` when the condition is true.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, block: (Self) -> Content) -> some View {
        if condition {
            block(self)
        } else {
            self
        }
    }
}

// MARK: - Shape
public extension View {
    /// Applies the given corner radius to the input view.
    /// - Parameters:
    ///   - radius: The desired corder radius.
    /// - Returns: A modified `View` clipped by the provided corner radius
    @ViewBuilder func clip(withCorderRadius radius: Double) -> some View {
        clipShape(RoundedRectangle(cornerSize: .init(width: radius, height: radius), style: .continuous))
    }
}
