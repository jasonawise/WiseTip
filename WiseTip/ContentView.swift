//
//  ContentView.swift
//  WiseTip
//
//  Created by Jason Wise on 2/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount = 0.0
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalBillAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipAmount = billAmount / 100 * tipSelection
        let total = billAmount + tipAmount
        return total
    }
    var body: some View {
        VStack {
            HStack {
                Section {
                    TextField("How much was your bill?", value: $billAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .padding()
                } header: {
                    Text("How much was your bill?")
                }
            }
            .padding()
            VStack {
                Section {
                    Picker("Tip Percent: ", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("What Tip Amount Should You Leave?")
                }
            }
            HStack {
                Section {
                    Text(totalBillAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .padding()
                } header: {
                    Text("You should leave a tip of")
                }
            }
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
