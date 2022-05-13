import Scenes

import Igis

import Foundation 

class Sun : RenderableEntity : EntityMouseClickHandler {
   
    var ellipse = Ellipse(center:Point(x:0, y:0), radiusX:45, radiusY:45, fillMode:.fillAndStroke)
    let strokeStyle = StrokeStyle(color:Color(.orange))
    let fillStyle = FillStyle(color:Color(.yellow))
    let lineWidth = LineWidth(width:5)
    var velocityX = 0
    var velocityY = 0
    var origVelX = 5
    var origVelY = 8

init() {
    // Using a meaningful name can be helpful for debugging
    super.init(name:"Sun")
}

override func setup(canvasSize: Size, canvas: Canvas) {
    // Position the ellipse at the center of the canvas
    var point = Point(x:canvasSize.width, y:0)
   // rectangle.rect.topLeft = point
    ellipse.center = point
    dispatcher.registerEntityMouseClickHandler(handler:self)
   // dispatcher.registerMouseMoveHandler(handler:self)
}

func onEntityMouseClick(globalLocation: Point) {
    ellipse.center = globalLocation
}
   
   override func teardown() {
    //dispatcher.unregisterEntityMouseClickHandler(handler:self)
    dispatcher.unregisterMouseMoveHandler(handler:self)
}

override func boundingRect() -> Rect {
    return Rect(size: Size(width: 100, height: 100))
}

func changeVelocity(velocityX:Int, velocityY:Int) {
//    self.velocityX = velocityX
  //  self.velocityY = velocityY
 
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
    var size = Size(width:100, height:100)
    let canvasBoundingRect = Rect(topRight:Point(x:canvasSize.width-100, y:0), size:Size(width:100, height:100))
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
          velocityX = -velocityX 
    }

    // If we're too far to the top or bottom, we bound the y velocity
      if tooFarUp || tooFarDown {
          velocityY = -velocityY
      }
}


/*

override func render(canvas:Canvas) {
    if let canvasSize = canvas.canvasSize {
  //  let clearRect = Rect(topLeft:Point(x:0, y:0), size:canvasSize)
 //   let clearRectangle = Rectangle(rect:clearRect, fillMode:.clear)
 //  canvas.render(clearR
    canvas.render(strokeStyle, fillStyle, lineWidth, ellipse)
    }
    }*/

}
