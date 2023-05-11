import Foundation
import Swift
import CoreFoundation 

struct StateLoc {

    var state: String?
    var lat: Float?
    var lon: Float?
    }

func convertToStateLoc(components:[String]) -> StateLoc {
    let stateLoc: StateLoc = StateLoc(state:components[0], lat:Float(components[1]),lon:Float(components[2]))
    return stateLoc
}

extension StateLoc: CustomStringConvertible {
    var description: String {
        return "(\(state), \(lat),\(lon))"
    }
}
