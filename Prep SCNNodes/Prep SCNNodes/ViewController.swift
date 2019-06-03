import UIKit
import MetalKit
import SceneKit

class ViewController: UIViewController {

    var renderer: SCNRenderer!
    let mtkView = MTKView(frame: .zero)
    let renderingSize = CGSize(width: 720, height: 1280)
    let scene = SCNScene()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the metal view
        view.addSubview(mtkView)
        mtkView.translatesAutoresizingMaskIntoConstraints = false
        mtkView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mtkView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mtkView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mtkView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        mtkView.device = MTLCreateSystemDefaultDevice()!
        mtkView.autoResizeDrawable = false
        mtkView.contentMode = .scaleAspectFill
        mtkView.colorPixelFormat = .bgra8Unorm
        mtkView.delegate = self
        mtkView.clearColor = MTLClearColor(red: 81/255, green: 128/255, blue: 183/255, alpha: 1.0)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(mtkViewPressed(_:)))
        mtkView.addGestureRecognizer(tapGestureRecognizer)
        
//        // Set up the scene
//        let box = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.1)
//        box.materials.first?.diffuse.contents = UIColor(red: 255/255, green: 216/255, blue: 134/255, alpha: 1.0)
//        let boxNode = SCNNode(geometry: box)
//        boxNode.position = SCNVector3(0, 0, 0)
//        scene.rootNode.addChildNode(boxNode)
//

        
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
//        print("removing cards")
//        scene.rootNode.childNodes.forEach {
//            $0.removeFromParentNode()
//        }
        print("adding cards")
        
        for i in 0...100 {
            let card = Card()
            card.scale = SCNVector3(5, 5, 5)
            scene.rootNode.addChildNode(card)
        }
        
        print("added cards")
        print("\n")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mtkView.drawableSize = renderingSize
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
                        viewport: CGRect(x: 0, y: 0, width: renderingSize.width, height: renderingSize.height),
                        commandBuffer: commandBuffer,
                        passDescriptor: renderPassDescriptor)
        commandBuffer.popDebugGroup()
        
        commandBuffer.present(view.currentDrawable!)
        commandBuffer.commit()
        commandBuffer.waitUntilCompleted()
    }
    
}
