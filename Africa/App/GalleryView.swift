import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var selectedAnimal: String = "lion"
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            //: IMAGE
            
            Image(selectedAnimal)
                .resizable()
                .scaledToFit()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.white, lineWidth: 8))
            
            
            //SLIDER
            Slider(value: $gridColumn, in: 2...4, step: 1)
                .padding(.horizontal)
                .onChange(of: gridColumn) { oldValue, newValue in
                    gridSwitch()
                }
            
            
            
            
            //: GRID
            VStack(alignment: .center, spacing: 30) {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(style: StrokeStyle()))
                            .onTapGesture {
                                selectedAnimal = animal.image
                            }
                    }//: LOOP
                }//: GRID
                .animation(.easeOut)
                .onAppear(perform: {
                    gridSwitch()
                })
            }//: VSTACK
            .padding(.vertical, 50)
            .padding(.horizontal, 10)
        }//: SCROLL
    }
}

#Preview {
    GalleryView()
}
