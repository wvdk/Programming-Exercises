import Foundation

public class File {
    public class func open(path: String, encoding: String.Encoding = String.Encoding.utf8) -> String? {
        if FileManager().fileExists(atPath: path) {
            do {
                return try String(contentsOfFile: path, encoding: encoding)
            } catch {
                print("Error: \(error)")
                
                return nil
            }
        }
        
        return nil
    }
    
    public class func save(path: String, content: String, encoding: String.Encoding = String.Encoding.utf8) -> Bool {
        do {
            try content.write(toFile: path, atomically: true, encoding: encoding)
            return true
        } catch {
            print(error)
            return false
        }
    }
}
