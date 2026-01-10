//
//  RoundCorner.swift
//  TravelMateUI
//
//  Created by Agostina Corcuera on 16/04/2025.
//

import SwiftUI

public struct RoundedCorner: Shape {
    public var radius: CGFloat = .infinity
    public var corners: UIRectCorner = .allCorners

    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

public struct InvertedBottomCorners: Shape {
    public var radius: CGFloat

    public init(radius: CGFloat) {
        self.radius = radius
    }

    public func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.width
        let height = rect.height

        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 0, y: height - radius))
        path.addQuadCurve(to: CGPoint(x: radius, y: height),
                          control: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width - radius, y: height))
        path.addQuadCurve(to: CGPoint(x: width, y: height - radius),
                          control: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.closeSubpath()

        return path
    }
}


