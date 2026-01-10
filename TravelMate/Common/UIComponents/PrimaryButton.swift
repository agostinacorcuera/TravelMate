//
//  TravelPrimaryButton.swift
//  TravelMateUI
//
//  Created by Agostina Corcuera on 16/04/2025.
//

import SwiftUI

public struct PrimaryButton: View {
    public enum ButtonSize {
        case small, medium, large
    }

    public var title: String
    public var size: ButtonSize
    public var isEnabled: Bool
    public var isLoading: Bool
    public var action: () -> Void

    public init(
        title: String,
        size: ButtonSize = .medium,
        isEnabled: Bool = true,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.size = size
        self.isEnabled = isEnabled
        self.isLoading = isLoading
        self.action = action
    }

    private var height: CGFloat {
        switch size {
        case .small: return 36
        case .medium: return 48
        case .large: return 60
        }
    }

    public var body: some View {
        Button(action: {
            if isEnabled && !isLoading {
                action()
            }
        }) {
            ZStack {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    Text(title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .background(isEnabled ? Color.PrimaryButton : Color.gray.opacity(0.4))
            .cornerRadius(12)
        }
        .disabled(!isEnabled || isLoading)
    }
}

