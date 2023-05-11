import Foundation
import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    let mapImage : Image
    var draw = false
    var stateMetars : [String : Metar] = [String : Metar]()
    init() {
          guard let mapUrl = URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Map_of_USA_with_state_names.svg/1200px-Map_of_USA_with_state_names.svg.png?20220514043835") else {
                           fatalError("Failed to create URL for whitehouse")
          }
//let mapUrl = URL.init(fileURLWithPath: "/home/brayden-edington/Experiences/W2654_b/Sources/ScenesShell/map.jpeg")
        mapImage = Image(sourceURL:mapUrl)
        print("Read in map image")
        if mapImage.isReady {
            print("REady")
        }

          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
      }

override func setup(canvasSize:Size, canvas:Canvas) {
            canvas.setup(mapImage)
}

override func render(canvas:Canvas) {
   if let canvasSize = canvas.canvasSize, mapImage.isReady, !draw {
       let destinationRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:canvasSize.width, height:canvasSize.height))
       mapImage.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0),  size:Size(width:canvasSize.width, height:canvasSize.height)))
       canvas.render(mapImage)

       //let ellipse = Ellipse(center:Point(x:155, y:200), radiusX:120, radiusY:55)
       //canvas.render(ellipse)   
       getData()
       //Washington
 
       canvas.render(FillStyle(color:Color(.black)))
       var xVal : Int = 220
       var yVal : Int = 120
       var ellipse = createEllipse(xVal:xVal, yVal:yVal)
       var text = createText(xVal:xVal, yVal:yVal, temp:stateMetars["Washington"]!.temp_c!)
       var station = createRectangle(xVal:xVal+10, yVal:yVal-10)
       var stationText = createStationText(xVal:xVal+10, yVal:yVal-10, text:stateMetars["Washington"]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(text)   
       canvas.render(station)
       canvas.render(stationText)   

       //Montana
       canvas.render(FillStyle(color:Color(.black)))
       xVal += 220
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars["Montana"]!.temp_c!)
       station = createRectangle(xVal:xVal+10, yVal:yVal-10)
       stationText = createStationText(xVal:xVal+10, yVal:yVal-10, text:stateMetars["Montana"]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(text)   
       canvas.render(station)
       canvas.render(stationText)   

       draw = true
   }
}

func createEllipse(xVal:Int, yVal:Int) -> Ellipse {
      var ellipse = Ellipse(center:Point(x:xVal, y:yVal), radiusX:20, radiusY:20)
      return ellipse
}


func createText(xVal:Int, yVal:Int, temp:Float) -> Text {
      var text = Text(location:Point(x:xVal-10, y:yVal), text:String(temp))   
      text.font = "10pt Arial" 
      return text
}

func createStationText(xVal:Int, yVal:Int, text:String) -> Text {
      var text = Text(location:Point(x:xVal-10, y:yVal), text:text)   
      text.font = "10pt Arial" 
      return text
}

func createRectangle(xVal:Int, yVal:Int) -> Rectangle {
        let rect = Rect(topLeft:Point(x:xVal, y:yVal), size:Size(width:25, height:15))
        let rectangle = Rectangle(rect:rect, fillMode:.stroke)
      return rectangle
}
func getData() {
    var stateLocs : [StateLoc] = getStateData()
    var metars : [Metar] = getMetarData()
    stateMetars  = getNewStateData(stateLocs:stateLocs, metars:metars)
    print("\(stateMetars.count)")
      }

func getNewStateData(stateLocs:[StateLoc], metars:[Metar]) -> [String : Metar] {
    var stateMetar =  [String : Metar]()
    for stateLoc in stateLocs {
        for metar in metars {
            if (metar.latitude! <= stateLoc.lat! + 1.5 && metar.latitude! >= stateLoc.lat! - 1.5) &&
                 (metar.longitude! <= stateLoc.lon! + 1.5 && metar.longitude! >= stateLoc.lon! - 1.5) {
                stateMetar[stateLoc.state!] = metar
                print("\(stateLoc.state!)")
                break
            }
        }
    }
    return stateMetar
}

func getMetarData() -> [Metar] {

    var metarList : [Metar] = []
    var filename = "Example-metars.csv"
    let lines = readFile(filename:filename)
    //Convert list of metars
    for line  in lines {
        let components = line.components(separatedBy: ",")

        let metar: Metar = convertToMetar(components:components)
        if (metar.latitude != nil && metar.longitude != nil && metar.station_id != nil && metar.temp_c != nil && metar.dewpoint_c != nil) {
            metarList.append(metar)
        }
    }
    return metarList
}

func readFile(filename:String) -> Array<Substring> {

    //Read in the file
    let contents = try! String(contentsOfFile: filename)

    //Split the file on endline (\n)
    let lines = contents.split(separator:"\n")

    print("Num words: \(lines.count)")
    return lines
}

func getStateData() -> [StateLoc] {
    var statesLoc: [StateLoc] = []
    var filename = "state.csv"
    //Arrary of Substrings
    let lines = readFile(filename:filename)

    //Convert list of metars
    for line  in lines {
        let components = line.components(separatedBy: ",")
        let stateLoc: StateLoc = convertToStateLoc(components:components)
        statesLoc.append(stateLoc)
    }


    //Print results
    for stateLoc in statesLoc {
        print(stateLoc)
    }
    return statesLoc
}
}
