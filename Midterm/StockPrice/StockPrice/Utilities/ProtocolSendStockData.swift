//
//  ProtocolSendStockData.swift
//  StockPrice
//
//  Created by Xuemeng Gao on 4/10/22.
//

import Foundation

protocol SendStockDelegate {
    func sendStockData(_ stockQuote : StockQuote)
}
