//
//  MapView.swift
//  Africa
//
//  Created by Ashish Dutt on 29/08/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoom = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoom)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        //Map(coordinateRegion: $region)
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {item in
            //MapPin(coordinate: item.location, tint: .accentColor) //Static pin
            
            //MapMarker(coordinate: item.location, tint: .accentColor) //Marker New style
            
//            MapAnnotation(coordinate: item.location){    //Custom Annotation, Could be interactive
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 30, height: 30)
//            }
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(locations: item)
            }
        })
        .overlay(
            HStack(alignment: .center) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48,height: 48, alignment: .center)
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }

                }
                
            }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding(),alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
