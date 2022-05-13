import Scenes
import Igis
import Foundation 
  /*
     This class is responsible for the foreground Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class Interaction : RenderableEntity  {
    var didDraw = false
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")

          // We insert our RenderableEntities in the constructor

      }

      func drawShape(n:Double, turtle:Turtle, color: Color, width: Int) {
          let rotate:Double = 360/n
          turtle.penColor(color:color)

          let maxCounter:Int = Int(n)
          var counter = 0
          while ( counter < maxCounter ) {
              turtle.forward(steps:width)
              turtle.right(degrees:rotate)
              counter = counter + 1
          }
      }

      override func render(canvas:Canvas) {

       


          if let canvasSize = canvas.canvasSize, !didDraw {


              let turtle = Turtle(canvasSize:canvasSize)
              //renderSquare(turtle:turtle, color:Color(.red), width:70)
              //canvas.render(turtle)

              didDraw = true



              let colors = [Color(.yellow), Color(.orange), Color(.indigo), Color(.purple)]
              var colorIndex = 0
              for i in 1 ... 100 {
                  let width = i * 10
                  let sides = Double(i % 8 + 5)
                  let color = colors[colorIndex]
                  //renderSquare(turtle:turtle, color:color, width:width)
                  drawShape(n:sides, turtle:turtle, color:color, width:width)
                  colorIndex = (colorIndex + 1) % colors.count
                  turtle.penUp()
                  turtle.right(degrees:20)
                  turtle.penDown()
              }

              canvas.render(turtle)
  

              didDraw = true
          }

      }
  }
