//
//  RecycleMap_Map.swift
//  Gomi
//
//  Created by Sky on 2022/8/3.
//

import SwiftUI
import MapKit


struct RecycleMap_Map: View {

    var viewModel: ViewModel
    
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -37.71410156645469, longitude: 145.14838031223107),
        span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25))

    private let locations = [
      Location(
          coordinate: CLLocationCoordinate2D(latitude: -37.71403012349992, longitude: 145.14990344750103),
          mark: .text(label: "🪫")),
      Location(
          coordinate: CLLocationCoordinate2D(latitude: -37.71618382924889, longitude: 145.14595414465242),
          mark: .text(label: "🪫💻")),
      Location(
           coordinate: CLLocationCoordinate2D(latitude: -37.65445841223325, longitude: 145.12588789390205),
           mark: .text(label: "🪫💻🧃📜"))
    ]

    
    
    var body: some View {
        
        VStack{
            HStack{
                Text("Legend:")
            }
            
            HStack{
                Text("🪫 Batteries")
                Text("💻 E-waste")
            }
            HStack{
                Text("🧃 Bottles")
                Text("📜 Cardboard")
            }
            Map(coordinateRegion: $region,
                interactionModes: [.all],
                showsUserLocation: true,
                userTrackingMode: .constant(.follow),
                annotationItems: locations) { item in
                mark(for: item)
            }
                .ignoresSafeArea()
        }
    }
    
    
    private func mark(for location: Location) -> some MapAnnotationProtocol {
      switch location.mark {
      case .pin(tint: let tint):
        return AnyMapAnnotationProtocol(MapPin(coordinate: location.coordinate, tint: tint))
      case .marker(tint: let tint):
        return AnyMapAnnotationProtocol(MapMarker(coordinate: location.coordinate, tint: tint))
      case .flag(pricing: let pricing, tint: let tint):
        return AnyMapAnnotationProtocol(MapAnnotation(coordinate: location.coordinate) {
          Text(String.init(repeating: "$", count: pricing))
            .font(.system(size: 12))
            .fontWeight(.semibold)
            .background(tint.cornerRadius(4))
        })
      case .text(label: let label):
          return AnyMapAnnotationProtocol(MapAnnotation(coordinate: location.coordinate) {
              Button(label)
              {
                  let url = URL(string: "maps://?saddr=&daddr=\(location.coordinate.latitude),\(location.coordinate.longitude)")
                      if UIApplication.shared.canOpenURL(url!) {
                            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                      }
                  }
                .font(.system(size: 24))
                .background(Color.blue.cornerRadius(16))
            })

      }
   }
}

private struct Location: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let mark: MapMark
    
}

private enum MapMark {
    case pin(tint: Color),
         marker(tint: Color),
         flag(pricing: Int, tint: Color),
         text(label: String)
}

private struct AnyMapAnnotationProtocol: MapAnnotationProtocol {
    let _annotationData: _MapAnnotationData
    let value: Any

    init<WrappedType: MapAnnotationProtocol>(_ value: WrappedType) {
      self.value = value
      _annotationData = value._annotationData
    }
    
}








//
//Text("Here are some locations where you can recycle your items:\n")
//    .multilineTextAlignment(.center)
//
//Map(coordinateRegion: $region)
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////
////        Text("Select which items you would like to see on the map:")
////                .multilineTextAlignment(.center)
////
////
////
////
////
//Text("\n")

