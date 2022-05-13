import Scenes
import Igis

class Target : RenderableEntity, EntityMouseDragHandler, EntityMouseDownHandler {
    // It's generally easiest to initialize any objects as part of their declaration,
    // unless more complex calculations are required
    static let targetSize = Size(width:30, height:30)

    let outerFillStyle = FillStyle(color:Color(.red))
    let middleFillStyle = FillStyle(color:Color(.black))
    let innerFillStyle = FillStyle(color:Color(.red))

    let outerEllipse = Ellipse(center:Point(), radiusX:Target.targetSize.width, radiusY:Target.targetSize.height, fillMode:.fill)
    let middleEllipse = Ellipse(center:Point(), radiusX:Target.targetSize.width * 2 / 3, radiusY:Target.targetSize.height * 2 / 3, fillMode:.fill)
    let innerEllipse = Ellipse(center:Point(), radiusX:Target.targetSize.width * 1 / 3, radiusY:Target.targetSize.height * 1 / 3, fillMode:.fill)

    init() {
        super.init(name:"Target")
    }
    
    // The setup() method is guaranteed to be invoked exactly once per object prior
    // to calculate() and render().
    // It enables the object to perform any setup that requires a Canvas.
    override func setup(canvasSize:Size, canvas:Canvas) {
        let centerX = canvasSize.width / 2
        let centerY = canvasSize.height / 2

        // Start the object off in the center
        outerEllipse.center = Point(x:centerX, y:centerY)
        alignChildren()

        dispatcher.registerEntityMouseDragHandler(handler:self)
        dispatcher.registerEntityMouseDownHandler(handler:self)
    }

    override func teardown() {
        dispatcher.unregisterEntityMouseDownHandler(handler:self)
        dispatcher.unregisterEntityMouseDragHandler(handler:self)
    }

    // The render() method is where the drawing to the canvas actually occurs.
    // Calculations should have occurred previously.
    override func render(canvas:Canvas) {
        canvas.render(outerFillStyle, outerEllipse, middleFillStyle, middleEllipse, innerFillStyle, innerEllipse)
    }

    // Implementing a separate method to align child objects is a good practice.
    // This way, any movement of the object can occur by moving the primary object only.
    func alignChildren() {
        middleEllipse.center = outerEllipse.center
        innerEllipse.center = outerEllipse.center
    }

    // The boundingRect() is used by Scenes as the initial step for hitTesting.
    // It's required to be implemented if the object desires intereaction with the mouse.
    override func boundingRect() -> Rect {
        return Rect(topLeft:Point(x:outerEllipse.center.x - outerEllipse.radiusX, y:outerEllipse.center.y - outerEllipse.radiusY),
                    size:Size(width:outerEllipse.radiusX * 2, height:outerEllipse.radiusY * 2))
    }

    // When this object is dragged, we'll move the primary object (the ellipse)
    // and then ask the children to follow.
    func onEntityMouseDrag(globalLocation:Point, movement:Point) {
        outerEllipse.center += movement
        alignChildren()
    }

    // When this object is clicked upon, we'll move it to the front.
    func onEntityMouseDown(globalLocation:Point) {
        layer.moveZ(of:self, to:.front)
    }
}
