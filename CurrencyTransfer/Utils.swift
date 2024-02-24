//
//  Utils.swift
//  CurrencyTransfer
//
//  Created by André Zubko on 24/02/2024.
//

import Foundation

extension String {
    
    // Spoločná inštancia NumberFormatter pre prevod reťazcov na desatinné čísla.
    static let numberFormatter = NumberFormatter()
    
    // Konvertuje reťazec na desatinné číslo a spracúva rôzne oddelovače desatinných miest.
    var DoubleValue: Double {
        
        // Nastaví desatinný oddelovač na bodku
        String.numberFormatter.decimalSeparator = "."
        
        // Skúsi konvertovať reťazec na číslo s použitím bodky ako desatinného oddelovača
        if let result = String.numberFormatter.number(from: self) {
            return result.doubleValue
            
        } else {
            
            // Ak konverzia zlyhá, nastaví desatinný oddelovač na čiarku
            String.numberFormatter.decimalSeparator = ","
            
            // Skúsi konvertovať reťazec na číslo s použitím čiarky ako desatinného oddelovača
            if let result = String.numberFormatter.number(from: self) {
                return result.doubleValue
            }
        }
        
        // Ak zlyhajú obe konverzie, vráti 0
        return 0
    }
}
