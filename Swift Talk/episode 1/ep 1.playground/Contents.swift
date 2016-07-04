// Written by WVDK, following along to https://talk.objc.io/episodes/S01E01-networking

import UIKit
import XCPlayground

typealias JSONDictionary = [String:AnyObject]

struct Episode {
    let id: String
    let title: String
}

extension Episode {
    init?(dictionary: JSONDictionary) {
        guard let id = dictionary["id"] as? String,
                  title = dictionary["title"] as? String else { return nil }
        self.id = id
        self.title = title
    }
}

struct Media {}

let url = NSURL(string: "http://localhost:8000/episodes.json")!

/// Holds everything that the Webservice.load will need to download this resource
struct Resourse<A> {
    let url: NSURL
    let parse: NSData -> A?
}

extension Resourse {
    init(url: NSURL, parseJSON: AnyObject -> A?) {
        self.url = url
        self.parse = { data in
            let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
            return json.flatMap(parseJSON)
        }
    }
}

extension Episode {
    static let all = Resourse<[Episode]>(url: url, parseJSON: { json in
        guard let dictionaries = json as? [JSONDictionary] else { return nil }
        return dictionaries.flatMap(Episode.init)
    })
}


final class Webservice {
    func load<A>(resource: Resourse<A>, completion: A? -> ()) {
        NSURLSession.sharedSession().dataTaskWithURL(resource.url) { data, _, _ in
            let result = data.flatMap(resource.parse)
            completion(result)
        }.resume()
    }
}

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

Webservice().load(Episode.all) { result in
    print(result)
}

