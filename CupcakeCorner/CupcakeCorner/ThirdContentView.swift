//
//  ThirdContentView.swift
//  CupcakeCorner
//
//  Created by Yongjun Ou on 7/19/23.
//

import SwiftUI

struct ThirdContentView: View {
    @State private var username = ""
    @State private var email = ""
    
    @StateObject var order = Order()


    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }

    var body: some View {
        NavigationView {
            Form {
//                Section {
//                    TextField("Username", text: $username)
//                    TextField("Email", text: $email)
//                }
//
//                Section {
//                    Button("Create account") {
//                        print("Creating account…")
//                    }
//                }
//                .disabled(disableForm)
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity)
                }
                
                Section {
                    // this can let the animation for the other 2 toggles
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled)
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)

                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
        }
    }
}

struct ThirdContentView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdContentView()
    }
}
