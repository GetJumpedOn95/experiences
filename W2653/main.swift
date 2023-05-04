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

let commands = CommandLine.arguments
var filename = "Example-metars.csv"
if(commands.count > 1) {
  print("Commands \(commands)")
  filename = commands[1]
  print("Setting filename \(filename)")
}


func convertToMetar(components:[String]) -> Metar {
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
        let metar: Metar = convertToMetar(components:components)
        metarList.append(metar)
    }
}

//Print results
for metar in metarList {
    print(metar)
}



