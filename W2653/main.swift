import Foundation
import CoreFoundation

func readFile(filename:String) -> Array<Substring> {

    //Read in the file
    let contents = try! String(contentsOfFile: filename)

    //Split the file on endline (\n)
    let lines = contents.split(separator:"\n")

    print("Num words: \(lines.count)")
    // let lineStrings : Array<String>
    // for line in lines {
    //     lineStrings.append(String(line))
    // }

    // return lineStrings
    return lines
}

func appendFile(filename:String, runTime:Double) {
  var contents : String = String(format: "%f", runTime)
  contents = contents + "\n"
  guard let data = contents.data(using:String.Encoding.utf8) else {return}
  let filePath = getDocumentsDirectory().appendingPathComponent(filename)
//  print("writing \(contents) to \(filePath)")
  if let fileHandle = try? FileHandle(forWritingTo: filePath) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
                fileHandle.closeFile()
   }
}

func getDocumentsDirectory() -> URL {
  let fileURL: URL = URL(fileURLWithPath: "./")
  return fileURL
}

var filename = "Example-metars.csv"

//Arrary of Substrings
var lines = readFile(filename:filename)

var headings: [String] = ["raw_text","station_id","observation_time","latitude","longitude","temp_c","dewpoint_c","wind_dir_degrees","wind_speed_kt","wind_gust_kt","visibility_statute_mi","altim_in_hg","sea_level_pressure_mb","corrected","auto","auto_station","maintenance_indicator_on","no_signal","lightning_sensor_off","freezing_rain_sensor_off","present_weather_sensor_off","wx_string","sky_cover","cloud_base_ft_agl","sky_cover","cloud_base_ft_agl","sky_cover","cloud_base_ft_agl","sky_cover","cloud_base_ft_agl","flight_category","three_hr_pressure_tendency_mb","maxT_c","minT_c","maxT24hr_c","minT24hr_c","precip_in","pcp3hr_in","pcp6hr_in","pcp24hr_in","snow_in","vert_vis_ft","metar_type","elevation_m"]

//Convert list of metars
var metarList: [Metar] = []
for line  in lines {
    let components = line.components(separatedBy: ",")
     
    //Verify the components match the headings
    if headings.count != components.count {
        print("Components did not have enough values: \(components)")
    }else{
        let metar: Metar = ConvertToMetar(components:components)
        metarList.append(metar)
    }
}

//Print results
for metar in metarList {
    print(metar)
}



