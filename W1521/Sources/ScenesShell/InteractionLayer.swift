import Scenes
import Igis

  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */

class InteractionLayer : Layer, KeyDownHandler {
    let ball = Ball()
    let ball1 = Ball2()
    let ball2 = Ball2()
    let ball3 = Ball2()
    let ball4 = Ball2()
    let ball5 = Ball3()
    let ball6 = Ball4()
    let paddleLeft = Paddle(rect:Rect(size:Size(width:10, height:100)))
    let paddleRight = Paddle(rect:Rect(size:Size(width:10, height:100)))
    //let sun = Sun()
    var defaultCanvasSize = Size() 
    
    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")

        // We insert our RenderableEntities in the constructor
//        remove(entity:ball)
        insert(entity: ball, at: .front)
        insert(entity: ball1, at: .front)
        insert(entity: ball2, at: .front)
        insert(entity: ball3, at: .front)
        insert(entity: ball4, at: .front)
        insert(entity: ball5, at: .front) 
        insert(entity: ball6, at: .front)
        ball.changeVelocity(velocityX: 5, velocityY: 8)  
        ball1.changeVelocity(velocityX: 3, velocityY: 1)
        ball2.changeVelocity(velocityX: 1, velocityY: 2)
        ball3.changeVelocity(velocityX: 8, velocityY: 5)
        ball4.changeVelocity(velocityX: 2, velocityY: 1)
        ball6.changeVelocity(velocityX: 7, velocityY: 8) 
        ball5.changeVelocity(velocityX: 2, velocityY: 1)
        insert(entity: paddleLeft, at: .front)
        insert(entity: paddleRight, at: .front)
//        insert(entity: sun, at: .front)
        //sun.changeVelocity(velocityX: 5, velocityY: 8)
    }

    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {

        print("key: " + key + " code: " + code)
        //print("key: " + key + " code: " + code + " ctrlKey: " + ctrlKey + " shiftKey: " + shiftKey + " altKey: " + altKey + " metaKey " + metaKey)
        if(key == "d") {
            print("got d")
            paddleLeft.moveUp()
        } else if(key == "x") {
            print ("got x")
            paddleLeft.moveDown(canvasSize:defaultCanvasSize)
        } else if(key == "ArrowUp") {
            print ("got arrowUp")
            paddleRight.moveUp()
        } else if(key == "ArrowDown") {
            print ("got down")
            paddleRight.moveDown(canvasSize:defaultCanvasSize)
        }
        
    }

    override func preSetup(canvasSize: Size, canvas: Canvas) {
        paddleLeft.move(to:Point(x: 10, y: canvasSize.center.y))
        paddleRight.move(to:Point(x: canvasSize.width-12, y: canvasSize.center.y))  

        dispatcher.registerKeyDownHandler(handler: self)
        defaultCanvasSize = canvasSize
    }
    override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
        }
        
 
}

