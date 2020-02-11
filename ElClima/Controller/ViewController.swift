//
//  ViewController.swift
//  ElClima
//
//  Created by Francisco Hernandez on 1/17/20.
//  Copyright © 2020 Francisco Hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var conditionImageView: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //this code says that the textfield needs to report back to the viewcontroller
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: Any) {
        //this dismisses the keyboard
        searchTextField.endEditing(true)
        //this prints whatever you have in the placeholder
        print(searchTextField.text!)
    }
    
    //if the user did not type something/ they need to type something
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type a city"
            return false
        }
    }
    
    //this func is to have the return button on the keyboard to be true
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    //this resets the placeholder after the user hits return
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
    
    func didUpdateWeather(weather: WeatherModel) {
        print(weather.temperature)
    }
    
}

