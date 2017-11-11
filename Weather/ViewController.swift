//
//  ViewController.swift
//  Weather
//
//  Created by Semyon Belokovsky on 10/11/2017.
//  Copyright © 2017 ProfIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField?
    @IBOutlet weak var cityLabel: UILabel?
    @IBOutlet weak var tempLabel: UILabel?
    @IBOutlet weak var humidityLabel: UILabel?
    @IBOutlet weak var pressureLabel: UILabel?
    @IBOutlet weak var windLabel: UILabel?
    
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() {
        cityLabel?.text = weather?.city
        if let value = weather?.temp {
            tempLabel?.text = String(value);
        } else {
            tempLabel?.text = ""
        }
        if let value = weather?.humidity {
            humidityLabel?.text = String(value);
        } else {
            humidityLabel?.text = ""
        }
        if let value = weather?.pressure {
            pressureLabel?.text = String(value);
        } else {
            pressureLabel?.text = ""
        }
        if let value = weather?.wind {
            windLabel?.text = String(value);
        } else {
            windLabel?.text = ""
        }
    }
    
    func loadWeather(query: String) {
        let alamofireApiService = AlamofireApiService()
        alamofireApiService.loadWeather(query: query) { (weather) in
            self.weather = weather
            self.updateUI()
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let query = textField.text {
            textField.resignFirstResponder()
            loadWeather(query: query)
        }
        return true
    }
}

