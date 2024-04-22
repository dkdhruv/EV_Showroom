//
//  Payment Button.swift
//  AirBnb Clone
//
//  Created by Dhruv Khanna on 14/04/24.
//

import SwiftUI
import PassKit

struct Payment_Button: View {
    var action : () -> Void
    var body: some View {
        Representable(action: action)
            .frame(minWidth: 100, maxWidth: 400)
            .frame(height: 55)
            .frame(maxHeight : .infinity)
    }
}

#Preview {
    Payment_Button(action: {})
}

extension Payment_Button {
    struct Representable : UIViewRepresentable {
        var action : () -> Void
        
        func makeCoordinator() -> Coordinator {
            Coordinator(action : action)
        }
        func makeUIView(context: Context) -> some UIView {
            context.coordinator.button
        }
        func updateUIView(_ uiView: UIViewType, context: Context) {
            context.coordinator.action = action
        }
    }
    
    class Coordinator : NSObject {
        var action : () -> Void
        var button = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .automatic)
        
        init(action: @escaping () -> Void, button: PKPaymentButton = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .automatic)) {
            self.action = action
            super.init()
//            self.button = button
            button.addTarget(self, action: #selector(callback(_:)), for: .touchUpInside)
        }
        
        @objc
        func callback(_ sender :  Any ) {
            action()
        }
    }
}
