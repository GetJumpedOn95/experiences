
import Scenes
import Igis    


class Background : RenderableEntity {

    var didDraw = false
  
    init() {
        // Using a meaningful name can be helpful for debugging
 

        super.init(name:"Background")

    }

    override func render(canvas:Canvas) {
        if let canvasSize = canvas.canvasSize, !didDraw {
            //Ground
            let rectGround = Rect(size:Size(width:canvasSize.width,height:canvasSize.height/2))
            let rectangleGround = Rectangle(rect:rectGround)
            let fillStyleGround = FillStyle(color:Color(.green))
            //Sky
            let rectSky = Rect(size:Size(width:725,height:840))
            let rectangleSky = Rectangle(rect:rectSky)
            let fillStyleSky = FillStyle(color:Color(.blue))

            canvas.render(fillStyleGround, rectangleGround)
            canvas.render(fillStyleSky, rectangleSky) 
                didDraw = true
        }

        
           
    }
}   
