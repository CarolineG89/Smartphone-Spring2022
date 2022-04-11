//
//  NetworkFunctions.swift
//  StockPrice
//
//  Created by Xuemeng Gao on 4/10/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

func getShortQuoteURL(_ symbol : String) -> String{
    let url = "\(shortQuoteURL)\(symbol)?apikey=\(apiKey)"
    return url
}

func getSymbolListURL() -> String{
    let url = "\(symbolListURL)\(apiKey)"
    return url
}

func getStockPrice(_ url : String) -> Promise<StockQuote>{
    
    return Promise<StockQuote> { seal -> Void in
        
        AF.request(url).responseJSON { response in
        
            if response.error != nil {
                seal.reject(response.error!)
            }
            
            let stockQuote = StockQuote("", "").self
            //get data here
            let stockQuoteArray = JSON(response.data!).arrayValue
            
            guard let stock = stockQuoteArray.first else {return seal.fulfill(stockQuote)}
            
            stockQuote.companyName = stock["name"].stringValue
            stockQuote.symbol = stock["symbol"].stringValue
            stockQuote.price = stock["dayLow"].stringValue
            stockQuote.dayLow = stock["dayLow"].stringValue
            stockQuote.dayHigh = stock["dayHigh"].stringValue
            
            seal.fulfill(stockQuote)

        }
    }
}// end of function
