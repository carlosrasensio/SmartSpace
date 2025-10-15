//
//  SpaceMapView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//



import SwiftUI
import MapKit

struct SpaceMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.4168, longitude: -3.7038),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        NavigationStack {
            ZStack {
                Map(
                    position: .constant(
                        .region(
                            MKCoordinateRegion(
                                center: region.center,
                                span: region.span
                            )
                        )
                    )
                )
                .ignoresSafeArea(edges: .bottom)
                
                // Modal centrado
                VStack {
                    Spacer()
                    
                    VStack(spacing: 12) {
                        Image(systemName: "map.circle")
                            .font(.system(size: 48))
                            .foregroundColor(.secondary)
                        
                        Text("Funcionalidad por implementar")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text("Próximamente podrás ver los espacios en el mapa")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(24)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.systemBackground))
                            .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 8)
                    )
                    .padding(.horizontal, 40)
                    
                    Spacer()
                }
            }
            .navigationTitle("Mapa")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    SpaceMapView()
}
