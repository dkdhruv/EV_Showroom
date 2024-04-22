//
//  Back Button.swift
//  AirBnb Clone
//
//  Created by Admin on 18/04/24.
//

import SwiftUI

struct Back_Button: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button{
            dismiss()
        }label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(.black)
                .background{
                    Circle()
                        .fill(.white)
                        .frame(width: 32,height: 32)
                }
                .padding(42)
                .padding(.top)
        }
    }
}

#Preview {
    Back_Button()
}
