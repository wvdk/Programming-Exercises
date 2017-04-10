struct Comment {
    let message: String
    let author: String
    let replies: [Comment]
}

let exampleComment6 = Comment(message: "jfgsfgsd", author: "d", replies: [])
let exampleComment5 = Comment(message: "fsfg", author: "jfsw", replies: [])
let exampleComment4 = Comment(message: "mrerg", author: "sd", replies: [exampleComment5, exampleComment6])
let exampleComment3 = Comment(message: "dfuje", author: "mrbob", replies: [])
let exampleComment2 = Comment(message: "woah", author: "adsfa", replies: [exampleComment4, exampleComment3])
let exampleComment = Comment(message: "Hello. Yay first comment!", author: "username100", replies: [exampleComment2])

var totalComments: Int = 0

func countComments(comment: Comment, runningCount: Int) -> Int {
    
    if comment.replies.isEmpty {
        return runningCount
    } else {
        for reply in comment.replies {
            totalComments += runningCount
            countComments(reply, runningCount: comment.replies.count)
        }
    }
    
    return 0
}

countComments(exampleComment, runningCount: 0)

print("Total comments: \(totalComments)")