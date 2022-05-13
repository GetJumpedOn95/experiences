

import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {

   
    var num = 0
    let text  : Text
    let text2 : Text
    let text3 : Text
    let rectangle : Rectangle
    let rectangle2 : Rectangle
    let rectangle3 : Rectangle
    let rectangleGround : Rectangle
    let rectangleSky : Rectangle  
    let fillStyleGround : FillStyle
    let fillStyleSky : FillStyle
    var rectangles = [Rectangle]()
    let fillStyle = FillStyle(color:Color(.white)) 
    let fillStyle1 = FillStyle(color:Color(.yellow))
    let fillStyle2 = FillStyle(color:Color(.orange)) 
    let fillStyle3 = FillStyle(color:Color(.purple))
    let fillStyle4 = FillStyle(color:Color(.red))
    let fillStyle5 = FillStyle(color:Color(.pink))
    let fillStyle6 = FillStyle(color:Color(.brown))
    var colors = [FillStyle]()
    let fillStyleText =  FillStyle(color:Color(.black)) 
    let strokeStyle = StrokeStyle(color:Color(.black))
    let lineWidth = LineWidth(width:5) 

    init() {

        func drawDoors (startX : Int, startY : Int) -> [Rectangle] {
            var rectangle : Rectangle
            var rect : Rect
            var rectangles = [Rectangle]()
            let per_width = 50
            let per_height = 80

            //start

            var x_axis = startX
            var y_axis = startY
    
           

             rect = Rect(topLeft:Point(x:x_axis, y:y_axis), size:Size(width:per_width,height:per_height))
                    rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
                    rectangles.append(rectangle)
                    return rectangles
        }


        func drawWindows (startX : Int, startY : Int, vertical : Int) -> [Rectangle] {
        var rectangle : Rectangle
        var rect : Rect
        var rectangles = [Rectangle]()
        let horizontal = 5
        //let vertical = 9
        let per_width = 40
        let per_height = 50

        //start

        var x_axis = startX
        var y_axis = startY
        var i = 0
        repeat {

            var j = 0
            repeat {

                rect = Rect(topLeft:Point(x:x_axis, y:y_axis), size:Size(width:per_width,height:per_height))
                rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
                rectangles.append(rectangle)
                print("adding x_axis = \(x_axis) y = \(y_axis)")
                j = j + 1
                x_axis = x_axis + per_width
            } while j < horizontal

            i = i + 1

            x_axis = startX

            y_axis = y_axis + per_height
            print("i =  \(i) and x_axis = \(x_axis) y = \(y_axis)")

        }  while i < vertical
        return rectangles

    }
    
//    init(){
        
        //canvas.render(fillStyle, strokeStyle, lineWidth, rectangle) 
        
        text2 = Text(location:Point(x:50, y:210), text:"Brayden")  
        text2.font = "30pt Atial"
        let rect2 = Rect(topLeft:Point(x:20, y:160), size:Size(width:200,height:690))
        rectangle2 = Rectangle(rect:rect2, fillMode:.fillAndStroke)
        
        let windows2 : [Rectangle] = drawWindows(startX:20, startY:225, vertical:9)
        rectangles.append(contentsOf: windows2)
        rectangles.append(contentsOf: drawDoors(startX:95, startY: 770))


        text = Text(location:Point(x:255, y:60), text:"Brayden")
        text.font = "30pt Atial"  
        let rect = Rect(topLeft:Point(x:225, y:10), size:Size(width:200,height:840))
        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        let windows : [Rectangle] = drawWindows(startX:225, startY:70, vertical:11)
        rectangles.append(contentsOf: windows)
        rectangles.append(contentsOf: drawDoors(startX:300, startY: 770))  

        text3 = Text(location:Point(x:430, y:330), text:"Brayden")
        text3.font = "30pt Atial"           
        let rect3 = Rect(topLeft:Point(x:430, y:280), size:Size(width:200,height:570))
        rectangle3 = Rectangle(rect:rect3, fillMode:.fillAndStroke)      
        let windows3 : [Rectangle] = drawWindows(startX:430, startY:340, vertical:8)
        rectangles.append(contentsOf: windows3)
        rectangles.append(contentsOf: drawDoors(startX:505, startY: 770)) 


        //Ground
        let rectGround = Rect(topLeft:Point(x:20, y:850), size:Size(width:725,height:30))
         rectangleGround = Rectangle(rect:rectGround)

        fillStyleGround = FillStyle(color:Color(.green))



        //Sky
        let rectSky = Rect(topLeft:Point(x:20, y:10), size:Size(width:725,height:840))
        rectangleSky = Rectangle(rect:rectSky)
        fillStyleSky = FillStyle(color:Color(.blue))

        
 
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }
    
    override func setup(canvasSize:Size, canvas:Canvas) {
        colors.append(fillStyle1)
        colors.append(fillStyle2)
        colors.append(fillStyle3)
        colors.append(fillStyle4)
        colors.append(fillStyle5)
        colors.append(fillStyle6)
        
        canvas.render(fillStyleSky, rectangleSky) 
        canvas.render(fillStyle1, strokeStyle, lineWidth,  rectangle)
        canvas.render(fillStyle2, strokeStyle, lineWidth, rectangle2)
        canvas.render(fillStyle3, strokeStyle, lineWidth, rectangle3)
        canvas.render(fillStyleText, text)
        canvas.render(fillStyleText,  text2)
        canvas.render(fillStyleText,  text3)
              //canvas.render( rectangle)
              // canvas.render(rectangle2)
              // canvas.render(rectangle3)
              // canvas.render(text)
              // canvas.render(text2)
              //canvas.render(text3)
        num = 0
               for myRectangle in rectangles {
                   //    canvas.render(myRectangle)
                   
                   canvas.render(colors[num%6], myRectangle)
                   num = num + 1
               } 
               canvas.render(fillStyleGround, rectangleGround)
               //canvas.render(fillStyleSky, rectangleSky)
    }

   
    
}

