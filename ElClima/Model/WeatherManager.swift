//
//  WeatherManager.swift
//  ElClima
//
//  Created by Francisco Hernandez on 1/27/20.
//  Copyright © 2020 Francisco Hernandez. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=8c81ca9bfb839eb3e03f93c0d0130cd9&units=metric"
    
    //function to get the data of the city that the user types in
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //create URL
        if let url = URL(string: urlString) {
            //create url session
            let session = URLSession(configuration: .default)
            //give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            //start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            print(error)
            return nil
        }
    }
}
