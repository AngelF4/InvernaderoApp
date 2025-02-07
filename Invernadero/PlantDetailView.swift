//
//  PlantDetailView.swift
//  Invernadero
//
//  Created by Angel HG on 06/02/25.
//

import SwiftUI

struct PlantDetailView: View {
    let plant: Plant
    let namespace: Namespace.ID // Se recibe aquí

    
    var body: some View {
        ScrollView(.vertical){
            ZStack{
                Image(plant.imageName)
                    .resizable()
                    .scaledToFit()
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.1), Color(.systemBackground)]),
                    startPoint: .center,
                    endPoint: .bottom
                )
            }
            
                
            Text(plant.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading) //Esto es para aliniar el texto a la izquierda
                .padding()
            
            Text(plant.longDescription)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading) //Esto es para aliniar el texto a la izquierda
                .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    @Previewable @Namespace var namespace
    PlantDetailView(plant: .init(imageName: "aloe-vera", title: "Aloe Vera", description: "Planta suculenta muy refrescante.", longDescription: "Hola", color: .green), namespace: namespace)
}
