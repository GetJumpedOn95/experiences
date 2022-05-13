
import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    var didDraw = false
   
      init() {
             super.init(name:"Background")
      }

      override func render(canvas:Canvas) {
          if let canvasSize = canvas.canvasSize, !didDraw {

              let turtle = Turtle(canvasSize:canvasSize)  
              let turtle2 = Turtle(canvasSize:canvasSize)
              let turtle3 = Turtle(canvasSize:canvasSize)
              let roof = Turtle(canvasSize:canvasSize)
        


              //HOUSE
              let rect2 = Rect(topLeft:Point(x:20, y:160), size:Size(width:200,height:200))
              let rectangle2 = Rectangle(rect:rect2, fillMode:.stroke)
              
              canvas.render(rectangle2)

              let rect3 = Rect(topLeft:Point(x:100, y:300), size:Size(width:30,height:60))
              let rectangle3 = Rectangle(rect:rect3, fillMode:.stroke)
              canvas.render(rectangle3)


              let rect4 = Rect(topLeft:Point(x:30, y:200), size:Size(width:40,height:30))
              let rectangle4 = Rectangle(rect:rect4, fillMode:.stroke)
              canvas.render(rectangle4)

              let rect5 = Rect(topLeft:Point(x:165, y:200), size:Size(width:40,height:30))
              let rectangle5 = Rectangle(rect:rect5, fillMode:.stroke)
              canvas.render(rectangle5)
              
              //Call drawshape with 5
              drawShape(n:9,steps:50, turtle:turtle)
              canvas.render(turtle)

              

              drawShape(n: 16,steps:50, turtle:turtle2)
              canvas.render(turtle2)

              drawShape(n: 12,steps:50, turtle:turtle3)
              canvas.render(turtle3)

              //ROOF
              roof.penUp()
              roof.left(degrees:90)
              roof.forward(steps:1180)
              roof.right(degrees:90)
              roof.forward(steps:443)
              roof.penDown()
              roof.right(degrees:45)
              roof.forward(steps:95)
              roof.right(degrees:45)
              roof.forward(steps:65)
              roof.right(degrees:45)
              roof.forward(steps:95)
              canvas.render(roof)

              //Pentagon
              turtle.penUp()
              turtle.left(degrees:90)
              turtle.forward(steps:900)
              turtle.right(degrees:90)
              turtle.forward(steps:443)
              turtle.penDown()
              drawShape(n:5,steps:50, turtle:turtle)
              canvas.render(turtle)



              //Octagon
              turtle.penUp()
              turtle.right(degrees:90)
              turtle.forward(steps:100)
              turtle.penDown()
              drawShape(n:8,steps:50, turtle:turtle)
              canvas.render(turtle)

              //circle

              turtle.penUp()
                            
                             turtle.forward(steps:300)
                             turtle.penDown()
                             drawShape(n:360,steps:3, turtle:turtle)
                            canvas.render(turtle)         
              didDraw = true
          }
      }

      func drawShape(n:Double, steps:Int, turtle:Turtle) {
          let rotate:Double = 360/n

          let maxCounter:Int = Int(n)
          var counter = 0
          while ( counter < maxCounter ) {
              turtle.forward(steps:steps)
              turtle.right(degrees:rotate)
              counter = counter + 1
          }


      }
     
}
