import Foundation
import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    let mapImage : Image
    var draw = false
    var X_FACTOR : Float = 1
    var Y_FACTOR : Float = 1
    let SCALED_WIDTH : Float = 1903
    let SCALED_HEIGHT : Float = 961
    var stateMetars : [String : Metar] = [String : Metar]()
    init() {
          guard let mapUrl = URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Map_of_USA_with_state_names.svg/1200px-Map_of_USA_with_state_names.svg.png?20220514043835") else {
                           fatalError("Failed to create URL for whitehouse")
          }
//let mapUrl = URL.init(fileURLWithPath: "/home/brayden-edington/Experiences/W2654_b/Sources/ScenesShell/map.jpeg")
        mapImage = Image(sourceURL:mapUrl)
        //print("Read in map image")
        if mapImage.isReady {
            print("REady")
        }

      


          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
      }

override func setup(canvasSize:Size, canvas:Canvas) {
            canvas.setup(mapImage)
            print("canvasSize: \(canvas.canvasSize!.width) / \(SCALED_WIDTH)")
            print("canvasSize: \(canvas.canvasSize!.height) / \(SCALED_HEIGHT)")
            //Scale x and y factors
         //   X_FACTOR = Float(canvas.canvasSize!.width) / SCALED_WIDTH
         //   Y_FACTOR = Float(canvas.canvasSize!.height) / SCALED_HEIGHT
            print("Updated X FACTOR \(X_FACTOR) Y FACTOR \(Y_FACTOR)")
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
       var stateName : String = "Washington"
       var xVal : Int = calcX(xVal:200, incX:0)
       var yVal : Int = calcY(yVal:125, incY:0)
       var ellipse = createEllipse(xVal:xVal, yVal:yVal)
       var text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       var station = createRectangle(xVal:xVal, yVal:yVal)
       var stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   
       //Save old coords
       var oldLat : Float = stateMetars[stateName]!.latitude! 
       var oldLon : Float = stateMetars[stateName]!.longitude!

       //Montana
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "Montana"
       var newLat = stateMetars[stateName]!.latitude! 
       var newLon = stateMetars[stateName]!.longitude! 
       //xVal = calcX(xVal:xVal, oldLon:oldLon, newLon:newLon)
       //yVal = calcY(yVal:yVal, oldLat:oldLat, newLat:newLat)
    
       xVal = calcX(xVal:xVal, incX:200)
       yVal = calcY(yVal:yVal, incY:0)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   


       //North Dakota
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "North Dakota"
       xVal = calcX(xVal:xVal, incX:400)
       yVal = calcY(yVal:yVal, incY:25)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   


       //Minnesota
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "Minnesota"
       xVal = calcX(xVal:xVal, incX:200)
       yVal = calcY(yVal:yVal, incY:25)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   


       //Wisconsin
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "Wisconsin"
       xVal = calcX(xVal:xVal, incX:100)
       yVal = calcY(yVal:yVal, incY:50)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   

       //Michigan
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "Michigan"
       xVal = calcX(xVal:xVal, incX:200)
       yVal = calcY(yVal:yVal, incY:100)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   


       //Maine
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "Maine"
       xVal = calcX(xVal:xVal, incX:400)
       yVal = calcY(yVal:yVal, incY:-150)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   

       //New Hampshire
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "New Hampshire"
       xVal = calcX(xVal:xVal, incX:-30)
       yVal = calcY(yVal:yVal, incY:60)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   

       //Vermont
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "Vermont"
       xVal = calcX(xVal:xVal, incX:-50)
       yVal = calcY(yVal:yVal, incY:-30)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   

       //New York
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "New York"
       xVal = calcX(xVal:xVal, incX:-70)
       yVal = calcY(yVal:yVal, incY:50)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   


       //Mass
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "Massachusetts"
       xVal = calcX(xVal:xVal, incX:90)
       yVal = calcY(yVal:yVal, incY:30)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   

       //Connecticut
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "Connecticut"
       xVal = calcX(xVal:xVal, incX:5)
       yVal = calcY(yVal:yVal, incY:30)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   

       //Rhode Island
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "Rhode Island"
       xVal = calcX(xVal:xVal, incX:45)
       yVal = calcY(yVal:yVal, incY:0)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   

       //New Jersey
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "New Jersey"
       xVal = calcX(xVal:xVal, incX:-90)
       yVal = calcY(yVal:yVal, incY:75)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   
       //Penn
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "Pennsylvania"
       xVal = calcX(xVal:xVal, incX:-90)
       yVal = calcY(yVal:yVal, incY:-60)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   
       //Ohio
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "Ohio"
       xVal = calcX(xVal:xVal, incX:-150)
       yVal = calcY(yVal:yVal, incY:50)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   
       //Indiana
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "Indiana"
       xVal = calcX(xVal:xVal, incX:-150)
       yVal = calcY(yVal:yVal, incY:50)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   
       //Illinois
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "Illinois"
       xVal = calcX(xVal:xVal, incX:-50)
       yVal = calcY(yVal:yVal, incY:-75)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   
       //Iowa
       canvas.render(FillStyle(color:Color(.black)))
       stateName = "Iowa"
       xVal = calcX(xVal:xVal, incX:-100)
       yVal = calcY(yVal:yVal, incY:10)
       ellipse = createEllipse(xVal:xVal, yVal:yVal)
       text = createText(xVal:xVal, yVal:yVal, temp:stateMetars[stateName]!.temp_c!)
       station = createRectangle(xVal:xVal, yVal:yVal)
       stationText = createStationText(xVal:xVal, yVal:yVal, text:stateMetars[stateName]!.station_id!)
       canvas.render(ellipse)   
       canvas.render(FillStyle(color:Color(.black)))
       canvas.render(text)   
       canvas.render(station)
       canvas.render(FillStyle(color:Color(.blue)))
       canvas.render(stationText)   
      // print("\(canvas.canvasSize)")
       draw = true
   }
}

func createEllipse(xVal:Int, yVal:Int) -> Ellipse {
      var ellipse = Ellipse(center:Point(x:xVal, y:yVal), radiusX:20, radiusY:20)
      return ellipse
}


func createText(xVal:Int, yVal:Int, temp:Float) -> Text {
      let text = Text(location:Point(x:xVal-10, y:yVal), text:String(temp))   
      text.font = "10pt Arial" 
      return text
}

func createStationText(xVal:Int, yVal:Int, text:String) -> Text {
      let text = Text(location:Point(x:xVal+20, y:yVal-10), text:text)   
      text.font = "10pt Arial" 
      return text
}
/*
func calcX2(xVal:Int, oldLon:Float, newLon:Float) -> Int {
  let diff = newLon - oldLon
    print("old:\(oldLon)  new:\(newLon) diff:\(diff)")
  print("x diff \(diff) * \(X_FACTOR)")
  return Int(xVal + Int(diff * X_FACTOR))
}

func calcY2(yVal:Int, oldLat:Float, newLat:Float) -> Int {
  let diff = newLat - oldLat
    print("oldY:\(oldLat)  newY:\(newLat) diffY:\(diff)")
  print("y diff \(diff) * \(Y_FACTOR)")
  return Int(yVal + Int(diff * Y_FACTOR))
}
*/
func calcX(xVal:Int, incX:Int) -> Int {
  return Int(Float(xVal + incX)  * X_FACTOR)
}

func calcY(yVal:Int, incY:Int) -> Int {
  return Int(Float(yVal + incY) * Y_FACTOR)
}

func createRectangle(xVal:Int, yVal:Int) -> Rectangle {
        let rect = Rect(topLeft:Point(x:xVal+20, y:yVal-25), size:Size(width:35, height:15))
        let rectangle = Rectangle(rect:rect, fillMode:.stroke)
      return rectangle
}
func getData() {
    var stateLocs : [StateLoc] = getStateData()
    var metars : [Metar] = getMetarData()
    stateMetars  = getNewStateData(stateLocs:stateLocs, metars:metars)
    //print("\(stateMetars.count)")
      }

func getNewStateData(stateLocs:[StateLoc], metars:[Metar]) -> [String : Metar] {
    var stateMetar =  [String : Metar]()
    for stateLoc in stateLocs {
        for metar in metars {
            if (metar.latitude! <= stateLoc.lat! + 1.5 && metar.latitude! >= stateLoc.lat! - 1.5) &&
                 (metar.longitude! <= stateLoc.lon! + 1.5 && metar.longitude! >= stateLoc.lon! - 1.5) {
                stateMetar[stateLoc.state!] = metar
                //print("\(stateLoc.state!)")
                break
            }
        }
    }
    return stateMetar
}

func getMetarData() -> [Metar] {

    var metarList : [Metar] = []
    let filename = "Example-metars.csv"
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
    let filename = "state.csv"
    //Arrary of Substrings
    let lines = readFile(filename:filename)

    //Convert list of metars
    for line  in lines {
        let components = line.components(separatedBy: ",")
        let stateLoc: StateLoc = convertToStateLoc(components:components)
        statesLoc.append(stateLoc)
    }


    //Print results
//    for stateLoc in statesLoc {
//        print(stateLoc)
//    }
    return statesLoc
}
}
