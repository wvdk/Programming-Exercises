import UIKit

let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

myLabel.text = "Test"


let attrString = NSAttributedString(
    string: "title-title-title",
    attributes: NSDictionary(
        object: UIFont(name: "Times", size: 12.0)!,
        forKey: NSFontAttributeName) as? [String : AnyObject])

myLabel.attributedText = attrString


let text = NSMutableAttributedString(string: "This is a test")

let attrs = [NSUnderlineStyleAttributeName:NSUnderlineStyle.PatternDash]

text.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.rawValue, range: NSMakeRange(0, text.length))

myLabel.attributedText = text

// Okay, cool. For real now:
// Goal: "By signing up you agree to our __Terms of Use__ and __Privacy Policy__."

let disclamerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 500, height: 30))

let completeLine = NSMutableAttributedString(string: "By signing up you agree to our ")

let underlinedTerms = NSMutableAttributedString(string: "Terms of Use", attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue])
completeLine.appendAttributedString(underlinedTerms)

let a = NSMutableAttributedString(string: " & ")
completeLine.appendAttributedString(a)

let underlinedPrivacy = NSMutableAttributedString(string: "Privacy Policy", attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue])
completeLine.appendAttributedString(underlinedPrivacy)

let endDot = NSMutableAttributedString(string: ".")
completeLine.appendAttributedString(endDot)

disclamerLabel.attributedText = completeLine

