import Scenes
import Igis
import Foundation

  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer {

      var defaultCanvas: Canvas = Canvas()
      var defaultCanvasSize: Size = Size() 
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")

          // We insert our RenderableEntities in the constructor

          //Get state data
       var stateLocs : [StateLoc] = getStateData()
       var metars : [Metar] = getMetarData()
       var newStateLoc : [String : Metar] = getNewStateData(stateLocs:stateLocs, metars:metars)
       print("\(newStateLoc.count)")
      }
      override func preSetup(canvasSize: Size, canvas: Canvas) {
          defaultCanvasSize = canvasSize
          defaultCanvas = canvas
          print("setup canvas")
                  let ellipse = Ellipse(center:Point(x:155, y:200), radiusX:120, radiusY:55)
                                canvas.render(ellipse)
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
/*
      override func render(canvas:Canvas){
          if let defaultCanvasSize = canvas.canvasSize, !didDraw {
              let fillStyle = FillStyle(color:Color(.tan))
              let strokeStyle = StrokeStyle(color:Color(.black))
              let lineWidth = LineWidth(width:2)
              let ellipse = Ellipse(center:Point(x:155, y:200), radiusX:120, radiusY:55)
              canvas.render(ellipse)
             // rect =  Rect(topLeft:Point(x:defaultCanvasSize.center.x - 350, y:defaultCanvasSize.center.y - 200), size:popupSize)
             // box = Rectangle(rect:rect, fillMode:.clear)
             // canvas.render(strokeStyle,fillStyle, lineWidth, box)
              //canvas.render(strokeStyle, fillStyle, lineWidth, text, rectangle)

                  canvas.render(FillStyle(color:Color(.black)))
                  print("Displaying text '\(textLine)'")
                  var text = Text(location:Point(x:defaultCanvasSize.center.x - 345, y:defaultCanvasSize.center.y - yOffset), text:textLine)
                  text.font = "30pt Arial"
                  canvas.render(text)
                  yOffset = yOffset - 50
                  counter = counter + 1
              }
              didDraw = true
          }
      

               */
      func getMetarData() -> [Metar] {

          var metarList : [Metar] = []
          var filename = "Example-metars.csv"
          var lines = readFile(filename:filename)
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
          var lines = readFile(filename:filename)

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
