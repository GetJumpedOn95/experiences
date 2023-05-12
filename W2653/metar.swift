import Foundation
import Swift
import CoreFoundation


struct Metar {

    var raw_text: String?
    var station_id: String?
    var observation_time: String?
    var latitude: Float?
    var longitude: Float?
    var temp_c: Float?
    var dewpoint_c: Float?
    var wind_dir_degrees: Float?
    var wind_speed_kt: Float?
    var wind_gust_kt: Float?
    var visibility_statute_mi: Float?
    var altim_in_hg: Float?
    var sea_level_pressure_mb: Float?
    var corrected: Bool?
    var auto: Bool?
    var auto_station: Bool?
    var maintenance_indicator_on: Bool?
    var no_signal: Bool?
    var lightning_sensor_off: Bool?
    var freezing_rain_sensor_off: Bool?
    var present_weather_sensor_off: Bool?
    var wx_string: String?
    var sky_cover: Float?
    var cloud_base_ft_agl: Float?
    var sky_cover2: Float?
    var cloud_base_ft_agl2: Float?
    var sky_cover3: Float?
    var cloud_base_ft_agl3: Float?
    var sky_cover4: Float?
    var cloud_base_ft_agl4: Float?
    var flight_category: String
    var three_hr_pressure_tendency_mb: Float?
    var maxT_c: Float?
    var minT_c: Float?
    var maxT24hr_c: Float?
    var minT24hr_c: Float?
    var precip_in: Float?
    var pcp3hr_in: Float?
    var pcp6hr_in: Float?
    var pcp24hr_in: Float?
    var snow_in: Float?
    var vert_vis_ft: Float?
    var metar_type: String?
    var elevation_m: Float?
}
    func ConvertToMetar(components:[String]) -> Metar {
        let metar: Metar = Metar(raw_text:components[0], station_id:components[1], observation_time:components[2],
                                 latitude:Float(components[3]), longitude:Float(components[4]), temp_c:Float(components[5]), dewpoint_c:Float(components[6]),
                                 wind_dir_degrees:Float(components[7]), wind_speed_kt:Float(components[8]), wind_gust_kt:Float(components[9]), 
                                 visibility_statute_mi:Float(components[10]), altim_in_hg:Float(components[11]), sea_level_pressure_mb:Float(components[12]),
                                 corrected:Bool(components[13]),auto: Bool(components[14]), auto_station: Bool(components[15]),
                                 maintenance_indicator_on:Bool(components[16]), no_signal:Bool(components[17]), lightning_sensor_off:Bool(components[18]),
                                 freezing_rain_sensor_off:Bool(components[19]), present_weather_sensor_off:Bool(components[20]),
                                 wx_string:components[21], sky_cover:Float(components[22]), cloud_base_ft_agl:Float(components[23]), sky_cover2:Float(components[24]),
                                 cloud_base_ft_agl2:Float(components[25]), sky_cover3:Float(components[26]), cloud_base_ft_agl3:Float(components[27]),
                                 sky_cover4:Float(components[28]), cloud_base_ft_agl4:Float(components[29]), flight_category:components[30],
                                 three_hr_pressure_tendency_mb:Float(components[31]), maxT_c:Float(components[32]), minT_c:Float(components[33]), maxT24hr_c:Float(components[34]),
                                 minT24hr_c:Float(components[35]), precip_in:Float(components[36]), pcp3hr_in:Float(components[37]), pcp6hr_in:Float(components[38]),
                                 pcp24hr_in:Float(components[39]), snow_in:Float(components[40]), vert_vis_ft:Float(components[41]), metar_type:components[42],
                                 elevation_m:Float(components[43]))
        return metar
    }


extension Metar: CustomStringConvertible {
    var description: String {
        return "(\(raw_text), \(station_id),\(observation_time), \(latitude),\(longitude), \(temp_c),\(dewpoint_c)," +
        "\(wind_dir_degrees),\(wind_speed_kt), \(wind_gust_kt),\(visibility_statute_mi), \(altim_in_hg)," +
            "\(sea_level_pressure_mb), \(corrected),\(auto), \(auto_station),\(maintenance_indicator_on)," + 
            "\(no_signal), \(lightning_sensor_off),\(freezing_rain_sensor_off), \(present_weather_sensor_off)," + 
            "\(wx_string), \(sky_cover),\(cloud_base_ft_agl), \(sky_cover2),\(cloud_base_ft_agl2), \(sky_cover3)," +
            "\(cloud_base_ft_agl3), \(sky_cover4),\(cloud_base_ft_agl4), \(flight_category),\(three_hr_pressure_tendency_mb)," +
            "\(maxT_c),\(minT_c), \(maxT24hr_c),\(minT24hr_c), \(precip_in),\(pcp3hr_in), \(pcp6hr_in),\(pcp24hr_in), \(snow_in))"  +
            "\(vert_vis_ft),\(metar_type), \(elevation_m))" 
    }
}
