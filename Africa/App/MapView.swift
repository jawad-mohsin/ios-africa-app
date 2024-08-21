import SwiftUI
import MapKit

struct MapView: View {
    // MARK - PROPERTIES
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    @State private var region: MapCameraPosition = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return .region(mapRegion)
    }()
    
    var body: some View {
        Map(position: $region){
            ForEach(locations) { location in
                Annotation("", coordinate: location.location) {
                    ZStack {
                        Circle()
                            .fill(.accent)
                            .frame(height: 32)
                        
                        Circle()
                            .frame(height: 28)
//

                        
                        Image(location.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 27)
                            .cornerRadius(16)

                            
                    }
                }
            }
        }
    }
}


#Preview {
    MapView()
}
