//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Yongjun Ou on 7/21/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $order.orderStruct.name)
                    TextField("Street Address", text: $order.orderStruct.streetAddress)
                    TextField("City", text: $order.orderStruct.city)
                    TextField("Zip", text: $order.orderStruct.zip)
                }

                Section {
                    NavigationLink {
                        CheckoutView(order: order)
                    } label: {
                        Text("Check out")
                    }
                }
                .disabled(order.orderStruct.hasValidAddress == false)
            }
            .navigationTitle("Delivery details")
            navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
