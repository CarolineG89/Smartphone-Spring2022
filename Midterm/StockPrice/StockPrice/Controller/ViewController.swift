//
//  ViewController.swift
//  StockPrice
//
//  Created by Xuemeng Gao on 4/10/22.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SendStockDelegate {

    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var lblDayHigh: UILabel!
    @IBOutlet weak var lblDayLow: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    
    var stocksModel: [StockQuote]?
    
    let stocks = ["FB", "AAPL", "GOOG", "MSFT", "AMZN"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appleURL = getShortQuoteURL("AAPL")
        getStockPrice(appleURL).done { apple in
            print("test")
            self.lblCompanyName.text = apple.companyName
            self.lblSymbol.text = apple.symbol
            self.lblPrice.text = "Price: $\(apple.price)"
            self.lblDayLow.text = "Day low: $\(apple.dayLow)"
            self.lblDayHigh.text = "Day high: $\(apple.dayHigh)"
        }
        .catch { error in
            print("in getStockPrice \(error.localizedDescription)")
        }
                
        stocksModel = initializeStocks()
       
    }

    func initializeStocks() -> [StockQuote]{
        let fb = StockQuote("FB", "Meta Platforms, Inc.")
        let aapl = StockQuote("AAPL", "Apple Inc.")
        let goog = StockQuote("GOOG", "Alphabet Inc.")
        let msft = StockQuote("MSFT", "Microsoft Corporation")
        let amzn = StockQuote("AMZN", "Amazon.com, Inc.")

        var modelArr = [StockQuote]()

        modelArr.append(fb)
        modelArr.append(aapl)
        modelArr.append(goog)
        modelArr.append(msft)
        modelArr.append(amzn)

        return modelArr
       }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = stocksModel?.count else {return 0}
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options: nil)?.first as! StockTableViewCell
        
        guard let stockModel = stocksModel?[indexPath.row] else {return cell}
        
        
        cell.symbol = stockModel.companyName
        cell.sendStockDelegate = self
        
        cell.lblSymbol.text = stockModel.symbol
        cell.lblCompanyName.text = stockModel.companyName
        
        return cell
    }
    

    
    func sendStockData(_ stockQuote : StockQuote){
        
        lblCompanyName.text = stockQuote.companyName
        lblSymbol.text = stockQuote.symbol
        lblPrice.text = "Price: $\(stockQuote.price)"
        lblDayLow.text = "Day low: $\(stockQuote.dayLow) "
        lblDayHigh.text = "Day high: $\(stockQuote.dayHigh)"
    }
    
    
    @IBAction func addStock(_ sender: Any) {
        
        var txtField : UITextField?

        
        let alertController = UIAlertController(title: "Add Stock", message: "", preferredStyle: .alert)
     
        let OKButton = UIAlertAction(title: "OK", style: .default) { action in
            guard let symbol = txtField?.text else {
                return
            }

            let newStockURL = getShortQuoteURL(symbol.trimmingLeadingAndTrailingSpaces().uppercased())
            getStockPrice(newStockURL).done { stockQuote in
                if (stockQuote.symbol == "") {
                    return
                }
                let newStock = StockQuote(stockQuote.symbol, stockQuote.companyName)
                self.stocksModel?.append(newStock)
                self.tblView.reloadData()
            }
            .catch { error in
                print("in getStockPriceAction \(error.localizedDescription)")
            }
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { action in
            
        }
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        
        alertController.addTextField { stockTextField in
            stockTextField.placeholder = "Type Stock Symbol"
            txtField = stockTextField
        }
        
        self.present(alertController, animated: true, completion: nil)
        
    }

}

