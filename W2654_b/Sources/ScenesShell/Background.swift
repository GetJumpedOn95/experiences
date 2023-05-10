import Foundation
import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    let mapImage : Image
    init() {
          //  guard let mapURL = URL(string:"/home/brayden-edington/Experiences/W2654_b/Sources/ScenesShell/map.jpeg") else {
          //                  fatalError("Failed to create URL for whitehouse")
 guard let mapUrl = Bundle.main.url(
            forResource: "map",
            withExtension: "json"
        ) else {
            throw Error.fileNotFound(name: name)
        }
        mapImage = Image(sourceURL:mapURL)

          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
      }

override func setup(canvasSize:Size, canvas:Canvas) {
            canvas.setup(mapImage)
}

override func render(canvas:Canvas) {
   if mapImage.isReady {
       canvas.render(mapImage)
       mapImage.renderMode = .destinationPoint(Point(x:100, y:200))
   }
}
}
