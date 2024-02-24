//
//  ContentView.swift
//  CurrencyTransfer
//
//  Created by André Zubko on 24/02/2024.
//

import SwiftUI



struct ContentView: View {
    
    @State private var firstItem = 0
    @State private var secondItem = 1
    @State private var amount: String = ""
    private var currencies = ["USD", "GPT", "JPY", "EUR", "CHF"]
    
    func convert(_ convert: String) -> String {
        
        var conversion: Double = 1.0
        let amount = Double(convert.DoubleValue)
        let selectedCurency = currencies[firstItem]
        let to = currencies[secondItem]
        
        let euroRates = ["USD": 1.15, "EUR": 1.0, "GBP": 0.84, "JPY": 130.04, "CHF": 1.08]
        let usdRates = ["USD": 1.0, "EUR": 0.87, "GBP": 0.73, "JPY": 109.12, "CHF": 0.91]
        let gbpRates = ["USD": 1.37, "EUR": 1.19, "GBP": 1.0, "JPY": 150.62, "CHF": 1.24]
        let jpyRates = ["USD": 0.0092, "EUR": 0.0077, "GBP": 0.0066, "JPY": 1.0, "CHF": 0.0083]
        let chfRates = ["USD": 1.10, "EUR": 0.93, "GBP": 0.81, "JPY": 120.60, "CHF": 1.0]
        
        switch (selectedCurency){
        case "USD":
            conversion = amount * (usdRates[to] ?? 0.0) // Konverzia z USD
        case "EUR":
            conversion = amount * (euroRates[to] ?? 0.0) // Konverzia z EUR
        case "JPY":
            conversion = amount * (jpyRates[to] ?? 0.0) // Konverzia z JPY
        case "GBP":
            conversion = amount * (gbpRates[to] ?? 0.0) // Konverzia z GBP
        case "CHF":
            conversion = amount * (chfRates[to] ?? 0.0) // Konverzia z CHF
        default:
            print("Niečo sa pokazilo") // Neočakávaný prípad
        }
        
        return String(format: "%.2f", conversion)
    }
    
    var body: some View {
        Form{
            Section(header: Text("Konvertovať meny")) {
                    TextField("Zadajte sumu", text: $amount)
                    .keyboardType(.decimalPad)
                    
                Picker(selection: $firstItem, label: Text("Z")) {
                    ForEach(currencies.indices, id: \.self) { index in
                        Text(self.currencies[index]).tag(index)
                    }
                }
                Picker(selection: $secondItem, label: Text("Na")) {
                    ForEach(currencies.indices, id: \.self) { index in
                        Text(self.currencies[index]).tag(index)
                    }
                }
            }
            
            Section(header: Text("Konverzia")) {
                Text("\(convert(amount)) \(currencies[secondItem])") // Výstup konverzie
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

