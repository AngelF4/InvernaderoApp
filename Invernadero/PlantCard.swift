//
//  PlantCard.swift
//  Invernadero
//
//  Created by Angel HG on 06/02/25.
//

import SwiftUI

struct PlantCard: View {
    let plant: Plant
    @State private var showSheet = false
    let namespace: Namespace.ID // Se recibe el namespace
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            NavigationLink {
                PlantDetailView(plant: plant, namespace: namespace)
                    .navigationTransition(.zoom(sourceID: plant.id, in: namespace))
            } label: {
                Image(plant.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 190)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black.opacity(0.1), plant.color.opacity(0.8)]),
                            startPoint: .center,
                            endPoint: .bottom
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    )
            }
            .matchedTransitionSource(id: plant.id, in: namespace)
            
            VStack(alignment: .leading, spacing: 5) {
                Spacer()
                Text(plant.title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                HStack {
                    Text(plant.description)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.8))
                    
                    
                }
            }
            .padding()
        }
        .shadow(radius: 8)
        .frame(height: 190)
        .padding(.horizontal)
        .sheet(isPresented: $showSheet) {
            PlantDetailView(plant: plant, namespace: namespace)
                .presentationSizing(.form)
        }
    }
}


#Preview {
    @Previewable @Namespace var namespace
    PlantCard(plant: .init(imageName: "aloe-vera", title: "Aloe Vera", description: "Planta suculenta muy refrescante.", longDescription: "Hola", color: .green), namespace: namespace)
}
