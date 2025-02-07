//
//  SensorCard.swift
//  Invernadero
//
//  Created by Angel HG on 01/02/25.
//

import SwiftUI

struct SensorCard: View {
    let imageName: String
    let title: String
    let value: String

    var body: some View {
        VStack {
            HStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                Text(title)
            }
            Text(value)
                .font(.system(size: 40, weight: .heavy))
        }
        .frame(width: 140, height: 140)
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 13))
        
    }
}

#Preview {
    SensorCard(imageName: "humed", title: "Humedad\nde la tierra", value: "##%")
}
