import Scenes
import Igis
import Foundation
  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {

    let dog1 : Image
    let dog2 : Image
    let dog3 : Image
    let dog4 : Image
    let rectangle : Rectangle
    init() {
          
          guard let dog1URL = URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/JackRussellJump_wb.jpg/83px-JackRussellJump_wb.jpg") else {
              fatalError("Failed to load dog1")
          }
          dog1 = Image(sourceURL:dog1URL)

          guard let dog2URL = URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Acd_jump_chute.jpg/120px-Acd_jump_chute.jpg") else {
            fatalError("Failed to load dog2")
          }
          dog2 = Image(sourceURL:dog2URL) 
          
          guard let dog3URL = URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Flyballbox_terv_wb.jpg/120px-Flyballbox_terv_wb.jpg") else {
              fatalError("Failed to load dog3")
          }
          dog3 = Image(sourceURL :dog3URL)


          guard let dog4URL = URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Boxer_agility_tunnel_wb.jpg/120px-Boxer_agility_tunnel_wb.jpg") else {
              fatalError("Failed to load dog4")
          }
              dog4 = Image(sourceURL : dog4URL)

              let rect = Rect(topLeft:Point(x:350, y:300), size:Size(width:100, height:100))
              rectangle = Rectangle(rect:rect, fillMode:.stroke)
          super.init(name:"Background")  
          
      }

      override func setup(canvasSize:Size, canvas:Canvas) {
          canvas.setup(dog1)
          canvas.setup(dog2)
          canvas.setup(dog3)
          canvas.setup(dog4)
      }

      override func render(canvas:Canvas) {
          if dog1.isReady && dog2.isReady && dog3.isReady && dog4.isReady {
        

             
              //RESIZE DOWN
              dog1.renderMode = .destinationRect(Rect(size:Size(width:80, height:80)))

              //PARTIAL
              let sourceRect = Rect(topLeft:Point(x:20, y:20), size:Size(width:70, height:80))
              let destinationRect = Rect(topLeft:Point(x:500, y:400), size:Size(width:100, height:80))
              dog3.renderMode = .sourceAndDestination(sourceRect:sourceRect, destinationRect:destinationRect)
              dog4.renderMode = .destinationRect(Rect(topLeft:Point(x:350, y:300), size:Size(width:100, height:100)))
              
              canvas.render(dog1)
              canvas.render(dog4)
      
              dog2.renderMode = .destinationRect(Rect(topLeft:Point(x:100, y:200), size:Size(width:200,
              height:200)))  
              canvas.render(dog2)

              canvas.render(dog3)

              canvas.render(rectangle)
          }    
      }
}
