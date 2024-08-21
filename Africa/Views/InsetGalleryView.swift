import SwiftUI

struct InsetGalleryView: View {
    //: MARK - PROPERTIES
    let animal: Animal
    
    
    //: MARK - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 210)
                    .cornerRadius(12)
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View{
        InsetGalleryView(animal: animals[1])
    }
}
