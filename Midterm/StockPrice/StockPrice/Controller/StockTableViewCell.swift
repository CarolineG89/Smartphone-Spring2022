//
//  StockTableViewCell.swift
//  StockPrice
//
//  Created by Xuemeng Gao on 4/10/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    @IBOutlet weak var lblCompanyName: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    var symbol = ""
    var companyName = ""
    
    var sendStockDelegate : SendStockDelegate?
    

    
    @IBAction func getPrice(_ sender: Any) {
        let stockURL = getShortQuoteURL(symbol)
        

        getStockPrice(stockURL).done { stockQuote in
            stockQuote.companyName = self.companyName
            self.sendStockDelegate?.sendStockData(stockQuote)
            
        }
        .catch { error in
            print(error.localizedDescription)
            
        }

        
    }
}
