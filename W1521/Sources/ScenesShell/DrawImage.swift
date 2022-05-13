import Scenes
import Igis
import Foundation
/*
 This class is responsible for rendering the background.
 */


class DrawImage : RenderableEntity {

    var rectangle : Rectangle
    var rect : Rect
    var rectangles = [Rectangle]()
    var clearRectangles = [Rectangle]()
    let horizontal = 10
    let vertical = 7
    var per_width = 200
    var per_height = 200
    let startX = 0
    let startY = 0
    let fillStyle = FillStyle(color:Color(.brown))
    let fillStyle2 = FillStyle(color:Color(.orange))
    let fillStyle3 = FillStyle(color:Color(.chocolate))
    let fillStyle4 = FillStyle(color:Color(.gold))
    let fillStyle5 = FillStyle(color:Color(.darkgreen))
    let outline = StrokeStyle(color:Color(.black))
    var colors = [FillStyle]()
    var didDraw = false

    init() {
        rect = Rect(topLeft:Point(x:startX, y:startY), size:Size(width:per_width,height:per_height))
        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        super.init(name:"Background")
    }

    override func render(canvas:Canvas) {
        if let canvasSize = canvas.canvasSize, !didDraw {

            //Calc vertical and horizontal size
            per_width = canvasSize.width/horizontal
            per_height = canvasSize.height/vertical

            //start
            var x_axis = startX
            var y_axis = startY
            var j = 0
            //Draw left vertical side
            repeat {
                //
                rect = Rect(topLeft:Point(x:x_axis, y:y_axis), size:Size(width:per_width,height:per_height))
                rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
                rectangles.append(rectangle)

                //clear rect
                rectangle = Rectangle(rect:rect, fillMode:.clear)
                clearRectangles.append(rectangle)
                print("adding x_axis = \(x_axis) y = \(y_axis)")

                j = j + 1
                y_axis = y_axis + per_height
            } while j < vertical
            //move back on on the y axis so bottom row appears on screen
            y_axis = y_axis - per_height

            j = 0
            //Draw bottom
            repeat {
                rect = Rect(topLeft:Point(x:x_axis, y:y_axis), size:Size(width:per_width,height:per_height))
                rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
                rectangles.append(rectangle)
                print("adding x_axis = \(x_axis) y = \(y_axis)")
                //clear rect                                                                                     
                rectangle = Rectangle(rect:rect, fillMode:.clear)                                                
                clearRectangles.append(rectangle)           

                j = j + 1
                x_axis = x_axis + per_width
            } while j < horizontal
            //move back one for y axis
            x_axis = x_axis - per_width

            //draw right
            j = 0
            repeat {
                rect = Rect(topLeft:Point(x:x_axis, y:y_axis), size:Size(width:per_width,height:per_height))
                rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
                rectangles.append(rectangle)
                //clear rect
                rectangle = Rectangle(rect:rect, fillMode:.clear)
                clearRectangles.append(rectangle) 

             
                print("adding x_axis = \(x_axis) y = \(y_axis)")
                j = j + 1
                y_axis = y_axis - per_height
            } while j < vertical
            //move back on on the y axis so bottom row appears on screen
            y_axis = y_axis + per_height

            //draw top
            j = 0
            repeat {
                rect = Rect(topLeft:Point(x:x_axis, y:y_axis), size:Size(width:per_width,height:per_height))
                rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
                rectangles.append(rectangle)
                print("adding x_axis = \(x_axis) y = \(y_axis)")
                //clear rect                                                                                     
                rectangle = Rectangle(rect:rect, fillMode:.clear)                                                 
                  clearRectangles.append(rectangle)             
                j = j + 1
                x_axis = x_axis - per_width
            } while j < horizontal

            //           didDraw = true
            //      }
            //      super.init(name:"Background")
            //   }

            //   override func setup(canvasSize:Size, canvas:Canvas) {
            colors.append(fillStyle)
            colors.append(fillStyle2)
            colors.append(fillStyle3)
            colors.append(fillStyle4)
            colors.append(fillStyle5)

            print("size = \(rectangles)")
            var num = 0
            for myRectangle in rectangles {

                canvas.render(colors[num%5],myRectangle)
                num = num + 1
            }
            canvas.render(outline)
            didDraw = true

            sleep(3)

            num = 0
            for myRectangle in clearRectangles {
                canvas.render(myRectangle)
                num = num + 1
            }
        canvas.render(outline)
        sleep(0)
        }
    }
}
   
