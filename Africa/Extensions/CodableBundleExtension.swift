import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String ) -> T {
        
        //Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in the bundle")
        }
        
        //Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in the bundle")
        }
        
        //Create a decoder
        let decoder = JSONDecoder()
        
        //Create a property for decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) in the bundle")
        }
        
        //return the loaded file
        return loaded
    }
}
