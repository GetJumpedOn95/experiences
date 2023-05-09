import Foundation
import Swift


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
