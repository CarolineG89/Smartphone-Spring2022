//
//  StockQuote.swift
//  StockPrice
//
//  Created by Xuemeng Gao on 4/10/22.
//

import Foundation

class StockQuote {
    init(_ symbol : String, _ companyName: String){
        self.symbol = symbol
        self.companyName = companyName
    }
    var companyName = ""
    var symbol = ""
    var price = ""
    var dayHigh = ""
    var dayLow = ""
}
