import Scenes

import Igis

import Foundation 

class Ball : RenderableEntity, MouseMoveHandler {
   
    var ellipse = Ellipse(center:Point(x:0, y:0), radiusX:30, radiusY:30, fillMode:.fillAndStroke)
    let strokeStyle = StrokeStyle(color:Color(.orange))
    let fillStyle = FillStyle(color:Color(.red))
    let lineWidth = LineWidth(width:5)
    var velocityX = 0
    var velocityY = 0
    var origVelX = 5
    var origVelY = 8

init() {
    // Using a meaningful name can be helpful for debugging
    super.init(name:"Ball")
}

override func setup(canvasSize: Size, canvas: Canvas) {
    // Position the ellipse at the center of the canvas
    ellipse.center = canvasSize.center
  //  dispatcher.registerEntityMouseClickHandler(handler:self)
    dispatcher.registerMouseMoveHandler(handler:self)
}

override func teardown() {
    //dispatcher.unregisterEntityMouseClickHandler(handler:self)
    dispatcher.unregisterMouseMoveHandler(handler:self)
}

//func onEntityMouseClick(globalLocation: Point) {
//    ellipse.center = globalLocation
//}

func onMouseMove(globalLocation: Point, movement: Point) {
    ellipse.center = globalLocation
    origVelX = velocityX
    origVelY = velocityY
}

override func boundingRect() -> Rect {
    return Rect(size: Size(width: Int.max, height: Int.max))
}

func changeVelocity(velocityX:Int, velocityY:Int) {
    self.velocityX = velocityX
    self.velocityY = velocityY
 
}

override func calculate(canvasSize: Size) {
/*
    let canvasBoundingRect = Rect(size:canvasSize)
    let ballBoundingRect = Rect(topLeft:Point(x:ellipse.center.x-ellipse.radiusX, y:ellipse.center.y-ellipse.radiusY),
                                size:Size(width:ellipse.radiusX*2, height:ellipse.radiusY*2))
    let containment = canvasBoundingRect.containment(target: ballBoundingRect)

    // Bounce horizontally
    if !containment.intersection([.overlapsRight, .beyondRight]).isEmpty && velocityX > 0 ||
         !containment.intersection([.overlapsLeft, .beyondLeft]).isEmpty && velocityX < 0 {
        velocityX *= -1
    }*/
    
    if(ellipse.radiusX < 30) {
        ellipse.radiusX = ellipse.radiusX + 2
    }
    if(ellipse.radiusY < 30) {
        ellipse.radiusY = ellipse.radiusY + 2
    }

    if(abs(self.velocityY) > abs(origVelY)) {
       if(self.velocityY < 0) {
          print("Adding velocity")
          self.velocityY = self.velocityY + 1
          print("new velocity = " + String(self.velocityY))
       }else {
           print("sub velocity")
           self.velocityY = self.velocityY - 1
           print("new velocity = " + String(self.velocityY))
       }
    }

    
     

    // First, move to the new position
    ellipse.center += Point(x:velocityX, y:velocityY)

    // Form a bounding rectangle around the canvas
    let canvasBoundingRect = Rect(size:canvasSize)

    // Form a bounding rect around the ball (ellipse)
    let ballBoundingRect = Rect(topLeft:Point(x:ellipse.center.x-ellipse.radiusX, y:ellipse.center.y-ellipse.radiusY),
                                size:Size(width:ellipse.radiusX*2, height:ellipse.radiusY*2))

                                
     
    // Determine if we've moved outside of the canvas boundary rect
    let tooFarLeft = ballBoundingRect.topLeft.x < canvasBoundingRect.topLeft.x
    let tooFarRight = ballBoundingRect.topLeft.x + ballBoundingRect.size.width > canvasBoundingRect.topLeft.x + canvasBoundingRect.size.width

    let tooFarUp = ballBoundingRect.topLeft.y < canvasBoundingRect.topLeft.y   
    let tooFarDown = ballBoundingRect.topLeft.y + ballBoundingRect.size.height > canvasBoundingRect.topLeft.y + canvasBoundingRect.size.height  

      // If we're too far to the left or right, we bounce the x velocity
      if tooFarLeft || tooFarRight {
          velocityX = -velocityX * 2
          ellipse.radiusX = 10 
    }

    // If we're too far to the top or bottom, we bound the y velocity
      if tooFarUp || tooFarDown {
          ellipse.radiusY = 10   
          //changeVelocity(velocityX:velocityX, velocityY:-velocityY * 2)
          velocityY = -velocityY * 2
      }
}




override func render(canvas:Canvas) {
    if let canvasSize = canvas.canvasSize {
  //  let clearRect = Rect(topLeft:Point(x:0, y:0), size:canvasSize)
 //   let clearRectangle = Rectangle(rect:clearRect, fillMode:.clear)
 //  canvas.render(clearRectangle)

        let rectGround = Rect(topLeft:Point(x:0, y:canvasSize.height/2), size:Size(width:canvasSize.width,height:canvasSize.height/2))
        let rectangleGround = Rectangle(rect:rectGround)
        let fillStyleGround = FillStyle(color:Color(.green))
        //Sky
        let rectSky = Rect(size:Size(width:canvasSize.width,height:canvasSize.height/2))
        let rectangleSky = Rectangle(rect:rectSky)
        let fillStyleSky = FillStyle(color:Color(.blue))

        //draw sun
        //let sun = Circle(topLeft:Point(x:10, y: 65), size:Size(width:10, height:10))
        let sun = Ellipse(center:Point(x:50, y:50), radiusX:40, radiusY:40, fillMode:.fill)
        let fillSun = FillStyle(color:Color(.yellow))

        //lake
        let lake = Ellipse(center:Point(x:canvasSize.width - 100, y: canvasSize.height - 60), radiusX:200, radiusY:100, fillMode:.fill)
        let fillLake = FillStyle(color:Color(.royalblue))    
        let turtle = Turtle(canvasSize:canvasSize)
        turtle.penUp()
        turtle.left(degrees:45)
        turtle.forward(steps:700)
        //turtle.penDown()
        //var circleSides = 360
        //while (circleSides > 80) {
            
          //  drawShape(n:Double( circleSides), turtle:turtle, color: Color(.yellow), width: 1)

        //circleSides = circleSides - 20
        
        //}
       
        //lady bug
        turtle.penUp()
        turtle.right(degrees:135)
        turtle.forward(steps:500)
        turtle.penDown()
        drawShape(n: 4, turtle:turtle, color:Color(.red), width: 7)
        turtle.penColor(color:Color(.black))
        turtle.forward(steps:15)  

        //kite
        turtle.penUp()
        turtle.forward(steps:400)   
        turtle.right(degrees:45)
        turtle.forward(steps:100)
        turtle.penDown()
        drawShape(n: 4, turtle:turtle, color:Color(.purple), width: 100)
        turtle.right(degrees:45)
        turtle.penUp()
        turtle.forward(steps:135)
        turtle.penDown()
        turtle.penColor(color:Color(.black))
        turtle.forward(steps:200)

        
        
        canvas.render(fillStyleGround, rectangleGround)
        canvas.render(fillStyleSky, rectangleSky)
        canvas.render(turtle)
        canvas.render(fillSun, sun)
        canvas.render(fillLake, lake)
    canvas.render(strokeStyle, fillStyle, lineWidth, ellipse)
    }
}


func drawShape(n:Double, turtle:Turtle, color: Color, width: Int) {

    let rotate:Double = 360/n

    turtle.penColor(color:color)


    var maxSteps = width
    let maxCounter:Int = Int(n)

    var counter = 0
   

    while (maxSteps != 0) { 
    while ( counter < maxCounter ) {

        turtle.forward(steps:maxSteps)

        turtle.right(degrees:rotate)

        counter = counter + 1

    }
  
    maxSteps = maxSteps - 1
    counter = 0
    }
    

} 
}
