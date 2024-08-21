import SwiftUI

struct ExternalWebLlnkView: View {
    
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                
                Text("Wikipedia")
                
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.accentColor)
                    
                    Link(animal.name, destination: (URL(string: animal.link) ??
                                                    URL(string: "https://wikipedia.org"))!)
                   
                    
                }
            }
        }
        .padding(.bottom, 20)
    }
}

struct ExternalWebLlnkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View{
        ExternalWebLlnkView(animal: animals[1])
    }
}
