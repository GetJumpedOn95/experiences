import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {

    var rectangle : Rectangle
    var rect : Rect
    var rectangles = [Rectangle]()
    let horizontal = 7
    let vertical = 7
    let per_width = 200
    let per_height = 50
    let startX = 20
    let startY = 20 
    let lines : Lines
    let lineWidth = LineWidth(width:3)
    let ellipse : Ellipse
    let eye : Ellipse
    let fillStyle = FillStyle(color:Color(.lightgreen))
    let fillStyle2 = FillStyle(color:Color(.turquoise))
    let fillStyle3 = FillStyle(color:Color(.darkgreen))
    let green1 = StrokeStyle(color:Color(.lightgreen))
    let green2 = StrokeStyle(color:Color(.turquoise))
    let green3 = StrokeStyle(color:Color(.darkgreen))  
    var colors = [FillStyle]()
   
    init() {

        //start
        var x_axis = startX
        var y_axis = startY + vertical * per_height + 100

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
            } while j < horizontal - i 
        
         
             i = i + 1
            x_axis = startX + i * per_width/2
          
            
            y_axis = y_axis - per_height
           // if(i == vertical - 2) {
           //     y_axis = y_axis - 100
           // }
           // print("i =  \(i) and x_axis = \(x_axis) y = \(y_axis)") 
          
        }  while i < vertical - 1 


   

        //let blue = StrokeStyle(color:Color(red:100, green:100, blue:255))
        //canvas.render(blue)

        lines = Lines(from:Point(x:720, y:20), to:Point(x:870, y:200))
        lines.lineTo(Point(x:570, y:200))
        lines.lineTo(Point(x:720, y:20))
        ellipse = Ellipse(center:Point(x:720, y:120), radiusX:70, radiusY:30, fillMode:.fillAndStroke)
        eye = Ellipse (center:Point(x:720, y:120), radiusX:15, radiusY:15, fillMode:.fillAndStroke) 

        // Using a meaningful name can be helpful for debugging


        super.init(name:"Background")
    }
    
    override func setup(canvasSize:Size, canvas:Canvas) {

        colors.append(fillStyle)
        colors.append(fillStyle2)
        colors.append(fillStyle3)

        
        print("size = \(rectangles)")
        var num = 0
        for myRectangle in rectangles {

            canvas.render(colors[num%3],myRectangle)
            num = num + 1
        }
        canvas.render(green1)
        canvas.render(lineWidth)
        canvas.render(lines)
        canvas.render(green2,colors[2])
        canvas.render(colors[1],ellipse)
        canvas.render(green3)
        canvas.render(colors[2],eye) 
}
}
