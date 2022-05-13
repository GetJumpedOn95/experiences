import Scenes
import Igis

class Box : RenderableEntity, EntityMouseDownHandler, EntityMouseDragHandler {
    // It's generally easiest to initialize any objects as part of their declaration,
    // unless more complex calculations are required
    static let boxSize = Size(width:200, height:100)
    static let handleSize = Size(width:20, height:20)

    let font = "12pt Arial"
    let fontFillStyle = FillStyle(color:Color(.black))
    let lineStyle = StrokeStyle(color:Color(.black))
    let lineWidth = LineWidth(width:1)
    let fillStyle = FillStyle(color:Color(.black))
    let rectangle = Rectangle(rect:Rect(topLeft:Point(), size:Box.boxSize), fillMode:.fill)

    var lineLeft   = Lines(from:Point(), to:Point())
    var lineRight  = Lines(from:Point(), to:Point())
    var lineTop    = Lines(from:Point(), to:Point())
    var lineBottom = Lines(from:Point(), to:Point())
    
    let handleStrokeStyle = StrokeStyle(color:Color(.yellow))
    let handleFillStyle = FillStyle(color:Color(.orange))
    let topHandle = Rectangle(rect:Rect(topLeft:Point(), size:Box.handleSize), fillMode:.fillAndStroke)
    let rightHandle = Rectangle(rect:Rect(topLeft:Point(), size:Box.handleSize), fillMode:.fillAndStroke)
    let bottomHandle = Rectangle(rect:Rect(topLeft:Point(), size:Box.handleSize), fillMode:.fillAndStroke)
    let leftHandle = Rectangle(rect:Rect(topLeft:Point(), size:Box.handleSize), fillMode:.fillAndStroke)

    let leftTextBox    = Text(location:Point(), text:"")
    let rightTextBox   = Text(location:Point(), text:"")
    let topTextBox     = Text(location:Point(), text:"")
    let bottomTextBox  = Text(location:Point(), text:"")

    // The setup() method is guaranteed to be invoked exactly once per object prior
    // to calculate() and render().
    // It enables the object to perform any setup that requires a Canvas.
    override func setup(canvasSize:Size, canvas:Canvas) {
        // Initial position of box at center
        let centerX = canvasSize.width / 2
        let centerY = canvasSize.height / 2
    
        let boxTopLeft = Point(x:centerX - rectangle.rect.size.width/2, y:centerY - rectangle.rect.size.height/2)
        rectangle.rect.topLeft = boxTopLeft
        alignChildren()

        // Left text box
        leftTextBox.font = font
        leftTextBox.alignment = .left
        leftTextBox.baseline = .middle

        // Right text box
        rightTextBox.font = font
        rightTextBox.alignment = .right
        rightTextBox.baseline = .middle

        // Top text box
        topTextBox.font = font
        topTextBox.alignment = .center
        topTextBox.baseline = .top

        // Bottom text box
        bottomTextBox.font = font
        bottomTextBox.alignment = .center
        bottomTextBox.baseline = .bottom

        dispatcher.registerEntityMouseDownHandler(handler:self)
        dispatcher.registerEntityMouseDragHandler(handler:self)
    }

    override func teardown() {
        dispatcher.unregisterEntityMouseDragHandler(handler:self)
        dispatcher.unregisterEntityMouseDownHandler(handler:self)
    }

    // Implementing a separate method to align child objects is a good practice.
    // This way, any movement of the object can occur by moving the primary object only.
    func alignChildren() {
        // Place handles around box
        let centerX = rectangle.rect.left + rectangle.rect.size.width / 2
        let centerY = rectangle.rect.top + rectangle.rect.size.height / 2
        
        topHandle.rect.topLeft    = Point(x:centerX - topHandle.rect.size.width / 2, y:rectangle.rect.topLeft.y)
        bottomHandle.rect.topLeft = Point(x:centerX - bottomHandle.rect.size.width / 2, y:rectangle.rect.bottom - bottomHandle.rect.size.height)
        leftHandle.rect.topLeft   = Point(x:rectangle.rect.topLeft.x, y:centerY - leftHandle.rect.size.height / 2)
        rightHandle.rect.topLeft  = Point(x:rectangle.rect.right - rightHandle.rect.size.width, y:centerY - rightHandle.rect.size.height / 2)
    }

    // This method examines the relationship between the box and the target.
    // It then constructs a description string filtered as specified.
    func containmentString(desiredSet:ContainmentSet) -> String {
        guard let layer = layer as? InteractionLayer else {
            fatalError("Expected InteractionLayer owner to setContainment()")
        }
        let targetRect = layer.target.boundingRect()
        let containmentSet = rectangle.rect.containment(target:targetRect)
        let resultantSet = containmentSet.intersection(desiredSet)

        var strings = [String]()
        if resultantSet.contains(.containedFully) {
            strings.append("Contained Fully")
        }
        if resultantSet.contains(.overlapsFully) {
            strings.append("Overlaps Fully")
        }
        if resultantSet.contains(.beyondFully) {
            strings.append("Beyond Fully")
        }
        

        if resultantSet.contains(.beyondLeft) {
            strings.append("Beyond Left")
        }
        if resultantSet.contains(.overlapsLeft) {
            strings.append("Overlaps Left")
        }
        if resultantSet.contains(.beyondHorizontally) {
            strings.append("Beyond Horizontally")
        }
        if resultantSet.contains(.containedHorizontally) {
            strings.append("Contained Horizontally")
        }
        if resultantSet.contains(.overlapsHorizontally) {
            strings.append("Overlaps Horizontally")
        }
        if resultantSet.contains(.overlapsRight) {
            strings.append("Overlaps Right")
        }
        if resultantSet.contains(.beyondRight) {
            strings.append("Beyond Right")
        }

        if resultantSet.contains(.beyondTop) {
            strings.append("Beyond Top")
        }
        if resultantSet.contains(.overlapsTop) {
            strings.append("Overlaps Top")
        }
        if resultantSet.contains(.beyondVertically) {
            strings.append("Beyond Vertically")
        }
        if resultantSet.contains(.containedVertically) {
            strings.append("Contained Vertically")
        }
        if resultantSet.contains(.overlapsVertically) {
            strings.append("Overlaps Vertically")
        }
        if resultantSet.contains(.overlapsBottom) {
            strings.append("Overlaps Bottom")
        }
        if resultantSet.contains(.beyondBottom) {
            strings.append("Beyond Bottom")
        }
        if resultantSet.contains(.contact) {
            strings.append("Contact")
        }

        return strings.joined(separator:", ")
    }

    // The calculate function is responsible for positioning objects and setting any other values
    // for rendering but it may not render itself.
    // It's invoked by Scenes immediately prior to a render().
    override func calculate(canvasSize:Size) {
        // Position lines
        lineLeft   = Lines(from:Point(x:rectangle.rect.left, y:0), to:Point(x:rectangle.rect.left, y:canvasSize.height))
        lineRight  = Lines(from:Point(x:rectangle.rect.right, y:0), to:Point(x:rectangle.rect.right, y:canvasSize.height))
        lineTop    = Lines(from:Point(x:0, y:rectangle.rect.top), to:Point(x:canvasSize.width, y:rectangle.rect.top))
        lineBottom = Lines(from:Point(x:0, y:rectangle.rect.bottom), to:Point(x:canvasSize.width, y:rectangle.rect.bottom))

        let centerX = rectangle.rect.topLeft.x + rectangle.rect.size.width / 2
        let centerY = rectangle.rect.topLeft.y + rectangle.rect.size.height / 2

        // Left text box
        leftTextBox.location = Point(x:0, y:centerY)
        leftTextBox.text = containmentString(desiredSet:[.beyondLeft, .overlapsLeft, .overlapsHorizontally, .containedHorizontally, .beyondHorizontally, .containedFully, .overlapsFully, .beyondFully, .contact])

        // Right text box
        rightTextBox.location = Point(x:canvasSize.width, y:centerY)
        rightTextBox.text = containmentString(desiredSet:[.beyondRight, .overlapsRight, .overlapsHorizontally, .containedHorizontally, .beyondHorizontally, .containedFully, .overlapsFully, .beyondFully, .contact])

        // Top text box
        topTextBox.location = Point(x:centerX, y:0)
        topTextBox.text = containmentString(desiredSet:[.beyondTop, .overlapsTop, .overlapsVertically, .containedVertically, .beyondVertically, .containedFully, .overlapsFully, .beyondFully, .contact])

        // Bottom text box
        bottomTextBox.location = Point(x:centerX, y:canvasSize.height)
        bottomTextBox.text = containmentString(desiredSet:[.beyondBottom, .overlapsBottom, .overlapsVertically, .containedVertically, .beyondVertically, .containedFully, .overlapsFully, .beyondFully, .contact])
    }
    
    // The render() method is where the drawing to the canvas actually occurs.
    // Calculations should have occurred previously.
    override func render(canvas:Canvas) {
        canvas.render(lineStyle, lineWidth, lineLeft, lineRight, lineTop, lineBottom)
        canvas.render(fillStyle, rectangle, handleFillStyle, handleStrokeStyle, topHandle, rightHandle, bottomHandle, leftHandle)
        canvas.render(fontFillStyle, leftTextBox, rightTextBox, topTextBox, bottomTextBox)
    }

    // The boundingRect() is used by Scenes as the initial step for hitTesting.
    // It's required to be implemented if the object desires intereaction with the mouse.
    override func boundingRect() -> Rect {
        return rectangle.rect
    }

    // This method responds to dragging the mouse.
    // It either drags the entire object, or, if a click occurs on a handle,
    // adjusts the size of the boject appropriately.
    func onEntityMouseDrag(globalLocation:Point, movement:Point) {
        let localLocation = local(fromGlobal:globalLocation)
        switch (localLocation) {
        case (let location) where topHandle.rect.local(to:rectangle.rect).containment(target:location).contains(.containedFully):
            rectangle.rect.top += movement.y
            if (rectangle.rect.size.height < Box.handleSize.height * 2) {
                rectangle.rect.top -= (Box.handleSize.height * 2 - rectangle.rect.size.height)
            }
        case (let location) where bottomHandle.rect.local(to:rectangle.rect).containment(target:location).contains(.containedFully):
            rectangle.rect.bottom += movement.y
            if (rectangle.rect.size.height < Box.handleSize.height * 2) {
                rectangle.rect.bottom += (Box.handleSize.height * 2 - rectangle.rect.size.height)
            }
        case (let location) where leftHandle.rect.local(to:rectangle.rect).containment(target:location).contains(.containedFully):
            rectangle.rect.left += movement.x
            if (rectangle.rect.size.width < Box.handleSize.width * 2) {
                rectangle.rect.left -= (Box.handleSize.width * 2 - rectangle.rect.size.width)
            }
        case (let location) where rightHandle.rect.local(to:rectangle.rect).containment(target:location).contains(.containedFully):
            rectangle.rect.right += movement.x
            if (rectangle.rect.size.width < Box.handleSize.width * 2) {
                rectangle.rect.right += (Box.handleSize.width * 2 - rectangle.rect.size.width)
            }
        default:
            rectangle.rect.topLeft += movement
        }
        alignChildren()
    }

    // When this object is clicked upon, we'll move it to the front.
    func onEntityMouseDown(globalLocation:Point) {
        layer.moveZ(of:self, to:.front)
    }

}
