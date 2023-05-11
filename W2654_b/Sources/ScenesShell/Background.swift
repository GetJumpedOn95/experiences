import Foundation
import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    let mapImage : Image
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
   if let canvasSize = canvas.canvasSize, mapImage.isReady {
       let destinationRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:canvasSize.width, height:canvasSize.height))
       mapImage.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0),  size:Size(width:canvasSize.width, height:canvasSize.height)))
   // mapImage.resizable()
  //      .aspectRatio(contentMode: .fill)
       canvas.render(mapImage)
   }
}
}
