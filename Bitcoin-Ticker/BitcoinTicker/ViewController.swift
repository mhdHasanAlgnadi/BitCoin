//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
    
    let baseURL = "https://blockchain.info/ticker"
    let currency = ["USD", "JPY","CNY","SGD","HKD","CAD","NZD","AUD","CLP","GBP","DKK","SEK","ISK","CHF","BRL","EUR","RUB","PLN","THB","KRW","TWD"]

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!

    var n = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        getWeatherData(url: baseURL, parameters: ["":""])
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currency.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currency[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        getWeatherData(url: baseURL, parameters: ["":""])
    }
    
    

    
    
    
//    
//MARK: - Networking
//    /***************************************************************/
//    
    func getWeatherData(url: String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { response in
                if response.result.isSuccess {

                    print("Sucess! Got the weather data")
                    let currencyJSON : JSON = JSON(response.result.value!)

//                   self.updateCurrencyData(json: currencyJSON)
-                    if let r = currencyJSON["USD"]["last"].double {
                        self.switchCase(j: currencyJSON)
                          }
                }
                else {
                    print("Error: \(String(describing: response.result.error))")
                    self.bitcoinPriceLabel.text = "Connection Issues"
                }
            }

    }

    
    
    

//MARK: - JSON Parsing
//    /***************************************************************/
    
//    func updateCurrencyData(json : JSON) {
//
//        if let result = json["USD"]["last"].double {
//            switchCase(j: json)
//        }
//    }
    
    func switchCase(j : JSON){
        switch currencyPicker.selectedRow(inComponent: 0) {
        case 0:
            bitcoinPriceLabel.text = "\(j["USD"]["last"].double ?? 0)"
        case 1:
            bitcoinPriceLabel.text = "\(j["JPY"]["last"].double ?? 0)"
        case 2:
            bitcoinPriceLabel.text = "\(j["CNY"]["last"].double ?? 0)"
        case 3:
            bitcoinPriceLabel.text = "\(j["SGD"]["last"].double ?? 0)"
        case 4:
            bitcoinPriceLabel.text = "\(j["HKD"]["last"].double ?? 0)"
        case 5:
            bitcoinPriceLabel.text = "\(j["CAD"]["last"].double ?? 0)"
        case 6:
            bitcoinPriceLabel.text = "\(j["NZD"]["last"].double ?? 0)"
        case 7:
            bitcoinPriceLabel.text = "\(j["AUD"]["last"].double ?? 0)"
        case 8:
            bitcoinPriceLabel.text = "\(j["CLP"]["last"].double ?? 0)"
        case 9:
            bitcoinPriceLabel.text = "\(j["GBP"]["last"].double ?? 0)"
        case 10:
            bitcoinPriceLabel.text = "\(j["DKK"]["last"].double ?? 0)"
        case 11:
            bitcoinPriceLabel.text = "\(j["SEK"]["last"].double ?? 0)"
        case 12:
            bitcoinPriceLabel.text = "\(j["ISK"]["last"].double ?? 0)"
        case 13:
            bitcoinPriceLabel.text = "\(j["CHF"]["last"].double ?? 0)"
        case 14:
            bitcoinPriceLabel.text = "\(j["BRL"]["last"].double ?? 0)"
        case 15:
            bitcoinPriceLabel.text = "\(j["EUR"]["last"].double ?? 0)"
        case 16:
            bitcoinPriceLabel.text = "\(j["RUB"]["last"].double ?? 0)"
        case 17:
            bitcoinPriceLabel.text = "\(j["PLN"]["last"].double ?? 0)"
        case 18:
            bitcoinPriceLabel.text = "\(j["USD"]["last"].double ?? 0)"
        case 19:
            bitcoinPriceLabel.text = "\(j["THB"]["last"].double ?? 0)"
        case 20:
            bitcoinPriceLabel.text = "\(j["TWD"]["last"].double ?? 0)"
        default:
            bitcoinPriceLabel.text = "Error"
        }
    }



    
}

