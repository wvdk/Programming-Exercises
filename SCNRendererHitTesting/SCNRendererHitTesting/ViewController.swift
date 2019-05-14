import UIKit
import MetalKit
import SceneKit

class ViewController: UIViewController {

    var renderer: SCNRenderer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the metal view
        let mtkView = MTKView(frame: .zero)
        view.addSubview(mtkView)
        mtkView.translatesAutoresizingMaskIntoConstraints = false
        mtkView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mtkView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mtkView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mtkView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        mtkView.device = MTLCreateSystemDefaultDevice()!
        mtkView.autoResizeDrawable = true
        mtkView.colorPixelFormat = .bgra8Unorm
        mtkView.delegate = self
        mtkView.clearColor = MTLClearColor(red: 81/255, green: 128/255, blue: 183/255, alpha: 1.0)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(mtkViewPressed(_:)))
        mtkView.addGestureRecognizer(tapGestureRecognizer)
        
        // Set up the scene
        let scene = SCNScene()
        let box = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.1)
        box.materials.first?.diffuse.contents = UIColor(red: 255/255, green: 216/255, blue: 134/255, alpha: 1.0)
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(0, 0, 0)
        scene.rootNode.addChildNode(boxNode)
        
        // Set up the camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 5)
        scene.rootNode.addChildNode(cameraNode)

        // Set up the renderer
        renderer = SCNRenderer(device: mtkView.device!, options: nil)
        renderer.scene = scene
        renderer.pointOfView = cameraNode
    }
    
    @objc func mtkViewPressed(_ sender: UITapGestureRecognizer) {
        let locationInView = sender.location(in: sender.view)
        print("\nMTKView was pressed at location in view: \(locationInView)")
        
        let nativeScale = UIScreen.main.nativeScale
        let scaledPoint = CGPoint(x: locationInView.x * nativeScale, y: locationInView.y * nativeScale)
        let hitTestResults = renderer.hitTest(scaledPoint, options: [SCNHitTestOption.boundingBoxOnly : true])
        
        print("Hit test results: \(hitTestResults)")
        
        // Question: How should one convert the locationInView point into something that can be passed into the hitTest(_:options:) method so that it will return expected results (e.g. a center of screen tap returns the box node)?
    }
    
}

extension ViewController: MTKViewDelegate {
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        print("MTKView drawable size will change to \(size)")
    }
    
    func draw(in view: MTKView) {
        let commandQueue = view.device!.makeCommandQueue()!
        let commandBuffer = commandQueue.makeCommandBuffer()!
        let renderPassDescriptor = view.currentRenderPassDescriptor!

        commandBuffer.pushDebugGroup("Renderer.SceneKit")
        renderer.render(atTime: 0,
                        viewport: UIScreen.main.nativeBounds,
                        commandBuffer: commandBuffer,
                        passDescriptor: renderPassDescriptor)
        commandBuffer.popDebugGroup()
        
        commandBuffer.present(view.currentDrawable!)
        commandBuffer.commit()
        commandBuffer.waitUntilCompleted()
    }
    
}