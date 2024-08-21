import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                    .padding(.horizontal, -23)
                    .padding(.vertical, 1)
                
                ForEach(animals){animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)){
                        AnimalListItemView(animal: animal)
                    }//: LINK
                }//: LOOP
                
            }//: LIST
            .navigationBarTitle("Africa", displayMode: .large)
            .padding(.horizontal, -30)
        }
    }
}

#Preview {
    ContentView()
}
