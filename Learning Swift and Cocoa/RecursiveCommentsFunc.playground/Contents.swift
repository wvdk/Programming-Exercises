import UIKit

struct Comment {
    let author: String
    let body: String
    let children: [Comment]?
}

let subComment4 = Comment(author: "user a", body: "hello world", children: nil)
let subComment5 = Comment(author: "user b", body: "testing 123", children: nil)
let subComment6 = Comment(author: "user c", body: "is this thing on?", children: nil)

let thirdLevelComments = [subComment4, subComment5, subComment6]

let subComment1 = Comment(author: "john smith", body: "nice...", children: thirdLevelComments)
let subComment2 = Comment(author: "jfk", body: "wat", children: thirdLevelComments)
let subComment3 = Comment(author: "hemingway", body: "lolz", children: thirdLevelComments)

let secondLevelComments = [subComment1, subComment2, subComment3]

let topLevelComments = [Comment(author: "wes", body: "First!!!", children: secondLevelComments)]

// The goal is to write a recursive function that turns all these comments into a single depth array, with tags for the depth on each item.

func flattenChildrenOf(comment: Comment, currentDepth: Int) -> [(comment: Comment, depth: Int)] {

    if (comment.children != nil) && !(comment.children!.isEmpty) {
        
        var flattened: [(comment: Comment, depth: Int)] = []
        
        flattened.append((comment, currentDepth))
        
        for child in comment.children! {
            flattened.append(contentsOf: flattenChildrenOf(comment: child, currentDepth: currentDepth+1))
        }
        
        return flattened
    } else {
        return [(comment, currentDepth)]
    }
}

let allCommentsFlattened: [(comment: Comment, depth: Int)] = flattenChildrenOf(comment: topLevelComments[0], currentDepth: 0)

for commentPair in allCommentsFlattened {
    print("Author: \(commentPair.comment.author)\nDepth: \(commentPair.depth)\n")
}

