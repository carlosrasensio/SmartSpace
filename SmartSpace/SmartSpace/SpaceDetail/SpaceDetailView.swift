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
    @Query private var trackedSpaces: [Space]
    
    // MARK: Internal Properties

    let space: Space
    
    // MARK: View

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Constants.spacing) {
                headerImageView
                
                VStack(alignment: .leading, spacing: Constants.spacing) {
                    titleView
                    descriptionView
                    
                    Divider()
                    
                    sensorVariablesView
                    
                    Divider()
                    
                    chartView
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    toggleTrackedSpace()
                } label: {
                    Image(systemName: viewModel.isTracked ? "bookmark.fill" : "bookmark")
                        .foregroundColor(viewModel.isTracked ? .accentColor : .primary)
                }
            }
        }
        .onAppear {
            viewModel.setupTrackedSpace(space, trackedSpaces: trackedSpaces)
        }
        .overlay(alignment: .top) {
            if viewModel.showTrackedToast {
                createToastView()
            }
        }
    }
}

// MARK: - Private Subviews

private extension SpaceDetailView {
    var headerImageView: some View {
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

    var titleView: some View {
        Text(space.name)
            .font(.title)
            .bold()
    }

    var descriptionView: some View {
        HStack {
            Label(space.building, systemImage: "mappin.circle")
            Spacer()
            Text(space.category)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }

    var sensorVariablesView: some View {
        HStack(spacing: Constants.spacing * 4) {
            makeSensorVariableView(.temperature(space.temperature))
            makeSensorVariableView(.consumption(space.consumption))
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    func makeSensorVariableView(_ type: SensorVarible) -> some View {
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
    
    func createToastView() -> some View {
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
        if viewModel.isTracked {
            if let managedSpace = trackedSpaces.first(where: { $0.id == space.id }) {
                modelContext.delete(managedSpace)
            }
        } else {
            modelContext.insert(space)
        }
        
        viewModel.toggleTrackedSpace()
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
    SpaceDetailView(space: Space.mockItem)
        .environment(SpaceFactory.makeSpaceDetailViewModel())
}
