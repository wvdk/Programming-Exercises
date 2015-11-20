import UIKit

var gameState: GameState = .XTurn
var moves: [Move] = []

func isThisMoveOkay(checkThisTile: BoardPosition) -> Bool {
    var r = true
    for m in moves {
        if m.position.x == checkThisTile.x && m.position.y == checkThisTile.y {
            r = false
        } else {
            r = true
        }
    }
    return r
}

class ViewController: UIViewController {

    @IBAction func someBoardButtonPressed(sender: UIButton) {
        var tile = whichTileIsThis(buttonTag: sender.tag) // returns BoardPosition object
        
        if isThisMoveOkay(tile) {
            if gameState == .XTurn {
                sender.setImage(UIImage(named: "x"), forState: UIControlState.Normal)
                gameState = .OTurn
                moves.append(Move(thePlayer: "x", thePosition: tile))
            } else if gameState == .OTurn {
                sender.setImage(UIImage(named: "o"), forState: UIControlState.Normal)
                gameState = .XTurn
                moves.append(Move(thePlayer: "o", thePosition: tile))
            }
        }
    }

    @IBAction func clearGameBoard(sender: UIButton) {
        for view in self.view.subviews as [UIView] {
            if let btn = view as? UIButton {
                btn.setImage(nil, forState: UIControlState.Normal)
            }
        }
        gameState = .XTurn
        moves = []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

