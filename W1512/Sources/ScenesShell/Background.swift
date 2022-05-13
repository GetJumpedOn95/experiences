import Scenes
import Igis
import Foundation
  /*
     This class is responsible for rendering the background.
   */

class Background : RenderableEntity {
    var didDraw = false
    let dogImage : Image
      init() {
    
          guard let dogImageURL = URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/JackRussellJump_wb.jpg/83px-JackRussellJump_wb.jpg") else {

              fatalError("Failed to load dogImage")

          }

          dogImage = Image(sourceURL:dogImageURL)
          super.init(name:"Background")           
      }

      func renderSquare(turtle: Turtle, color: Color, width: Int) {
                  turtle.penColor(color:color)
                  for _ in 1 ... 4 {
                      turtle.forward(steps: width)
                      turtle.right(degrees: 120)
                      turtle.left(degrees: 30)
                  }
                  
                  
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

override func setup(canvasSize:Size, canvas:Canvas) {

    canvas.setup(dogImage)
}

override func render(canvas:Canvas) {

    //Render
    if let canvasSize = canvas.canvasSize, !didDraw, dogImage.isReady { 
   //if(dogImage.isReady) {
       dogImage.renderMode = .destinationRect(Rect(size:Size(width:2500, height: 1800)))
   
   
       print("rendering dog")
       canvas.render(dogImage)
    
                  
     //             if let canvasSize = canvas.canvasSize, !didDraw {


                      let turtle = Turtle(canvasSize:canvasSize)
                      //renderSquare(turtle:turtle, color:Color(.red), width:70)
                      //canvas.render(turtle)

                  
                 
              
          
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


              
     
      

          
      
