import Igis
import Scenes

class Paddle: RenderableEntity {
    var rectangle: Rectangle
    var defaultMove = 25

    init(rect:Rect) {
        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)

        // Using a meaningful name can be helpful for debugging
        super.init(name: "Paddle")
    }

    override func render(canvas:Canvas) {
        let strokeStyle = StrokeStyle(color:Color(.black))
        let fillStyle = FillStyle(color:Color(.white))
        let lineWidth = LineWidth(width:2)
        canvas.render(strokeStyle, fillStyle, lineWidth, rectangle)
    }

    func move(to point:Point) {
        rectangle.rect.topLeft = point
    }

    func moveDown(canvasSize:Size) {
       //Save existing points
     
        var newY = rectangle.rect.topLeft.y
    
        //If the paddle will not go out of bounds, add defaultmove
        if(newY + defaultMove <= canvasSize.height) {
            newY = rectangle.rect.topLeft.y + defaultMove
        }
        var point = Point(x:rectangle.rect.topLeft.x, y:newY)      
        rectangle.rect.topLeft = point
    }
   

    func moveUp() {
        var newY = rectangle.rect.topLeft.y
        //If the paddle will not go out of bounds, add defaultmove
        if(newY - defaultMove >= 0) {
            newY = rectangle.rect.topLeft.y - defaultMove
        }
        var point = Point(x:rectangle.rect.topLeft.x, y:newY)
        rectangle.rect.topLeft = point  
    }
}
