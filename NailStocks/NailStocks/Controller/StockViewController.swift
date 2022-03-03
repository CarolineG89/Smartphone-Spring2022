//
//  StockViewController.swift
//  NailStocks
//
//  Created by Xuemeng Gao on 3/2/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewController: UIViewController {

    
    @IBOutlet weak var txtStockSymbol: UITextField!
    
    @IBOutlet weak var lblMarketCap: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func getMarketCap(_ sender: Any) {
            guard let symbol = txtStockSymbol.text else {return}
            
            let url = "\(url)\(symbol.uppercased())?apikey=\(apiKey)"
            print(url)
                    
            SwiftSpinner.show("Getting market cap value for \(symbol)")
            
            AF.request(url).responseJSON { response in
                SwiftSpinner.hide(nil)
                
                if response.error != nil {
                    print(response.error!)
                }
            let stocks = JSON(response.data!).array
                        
            guard let stock = stocks!.first else {return}
            print(stock)
                
            let marketcap = MarketCap()
            marketcap.symbol = stock["symbol"].stringValue
            marketcap.date = stock["date"].stringValue
            marketcap.marketCap = stock["marketCap"].intValue
          
                
            self.lblMarketCap.text = "\(marketcap.symbol) : Date:\(marketcap.date), MarketCap:\(marketcap.marketCap)"
        }
     
    }
    

}
