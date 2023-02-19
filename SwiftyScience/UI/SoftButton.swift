//
//  SoftButton.swift
//  SwiftyScience
//
//  Created by Ocean on 2/18/23.
//

import SwiftUI


struct SoftButton: View {
    var title: String
    var backgroundColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.white)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(backgroundColor)
                )
        }
    }
}
