# ElClima

WEATHER APP

A Beautiful, dark-mode enabled weather app. 
You'll be able to check the weather for the current location based on 
the GPS data from the iPhone as well as by searching for a city manually.

JSON,STRUCTS,MVS STRUCTURE, PROTOCOLS/DELEGATES, CORE DATA

switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
