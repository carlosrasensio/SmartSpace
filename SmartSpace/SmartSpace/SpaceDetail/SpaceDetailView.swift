//
//  SpaceDetailView.swift
//  SmartSpace
//
//  Created by Carlos Rodriguez Asensio on 14/10/25.
//

import SwiftUI
import SwiftData

struct SpaceDetailView: View {
    
    // MARK: - Private Properties
    
    @Environment(SpaceDetailViewModel.self) private var viewModel
    @Environment(\.modelContext) private var modelContext
    
    // MARK: Internal Properties

    let space: SpaceItem
    
    // MARK: View

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Constants.spacing) {
                headerImage
                
                VStack(alignment: .leading, spacing: Constants.spacing) {
                    title
                    description
                    
                    Divider()
                    
                    sensorVariables
                    
                    Divider()
                    
                    otherVariables
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    Task { await viewModel.toggleTracked() }
                } label: {
                    Image(systemName: viewModel.isTracked ? "bookmark.fill" : "bookmark")
                        .foregroundColor(viewModel.isTracked ? .accentColor : .primary)
                }
            }
        }
        .overlay(alignment: .top) {
            if viewModel.showTrackedToast {
                createToast()
            }
        }
    }
}

// MARK: - Private Subviews

private extension SpaceDetailView {
    var headerImage: some View {
        Rectangle()
            .fill(Color(.systemGray5))
            .frame(height: 180)
            .overlay(
                Image(systemName: space.iconName)
                    .font(.system(size: 48))
                    .foregroundColor(.secondary)
            )
            .frame(height: 250)
            .clipped()
    }

    var title: some View {
        Text(space.name)
            .font(.title)
            .bold()
    }

    var description: some View {
        HStack {
            Label(space.building, systemImage: "mappin.circle")
            Spacer()
            Text(space.category)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }

    var sensorVariables: some View {
        HStack(spacing: Constants.spacing * 4) {
            makeSensorVariable(.temperature(space.temperature))
            makeSensorVariable(.consumption(space.consumption))
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    func makeSensorVariable(_ type: SensorVarible) -> some View {
        VStack(alignment: .center, spacing: Constants.spacing / 4) {
            Text(type.title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(type.valueFormatted)
                .font(.title2)
                .bold()
                .foregroundColor(type.valueColor)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }

    var otherVariables: some View {
        Text("Gráficas y detalles próximamente...")
            .foregroundColor(.secondary)
            .padding(.vertical)
    }
    
    func createToast() -> some View {
        Text(viewModel.isTracked ? "Espacio guardado en Destacados" : "Espacio eliminado de Destacados")
            .padding()
            .background(viewModel.isTracked ? Color.green.opacity(0.8) : Color.red.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(10)
            .transition(.opacity.combined(with: .move(edge: .top)))
            .animation(.easeInOut, value: viewModel.showTrackedToast)
            .padding(.top, 10)
    }
}

// MARK: - Private Functions

private extension SpaceDetailView {
    func toggleTrackedSpace() {
        viewModel.isTracked.toggle()
        
        if viewModel.isTracked {
            modelContext.insert(space)
        } else {
            modelContext.delete(space)
        }
        
        showTrackedToast()
    }
    
    func showTrackedToast() {
        viewModel.showTrackedToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            viewModel.showTrackedToast = false
        }
    }
}

// MARK: - Constants

private extension SpaceDetailView {
    enum Constants {
        static let spacing: CGFloat = 16
    }
}

// MARK: - Preview

#Preview {
    SpaceDetailView(space: SpaceItem.mockItem)
        .environment(SpaceFactory.makeSpaceDetailViewModel())
}
