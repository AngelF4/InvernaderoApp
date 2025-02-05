//
//  HomeView.swift
//  Invernadero
//
//  Created by Angel HG on 31/01/25.
//

import SwiftUI


struct HomeView: View {
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text("¡Hola!")
                        .font(.system(size: 50, weight: .bold, design: .default))
                    Spacer()
                }
                .padding()
                HStack{
                    Image("temp")
                    VStack{
                        Text("20" + "°")
                            .font(.system(size: 65, weight: .light , design: .default))
                        Text("Temperatura")
                            .font(.system(size: 14, design: .default))
                    }
                    Spacer()
                    Image(systemName: "drop.circle.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(Color.cyan)
                    VStack{
                        HStack{
                            Text("47")
                                .font(.system(size: 65, weight: .light , design: .default))
                            Text("%")
                                .font(.system(size: 35, weight: .light , design: .default))
                        }
                        
                        Text("Humedad")
                            .font(.system(size: 14,design: .default))
                    }
                }
                .padding()
                Text("Datos")
                    .font(.system(size: 32.56, weight: .semibold, design: .default))
                VStack{
                    HStack{
                        SensorCard(imageName: "humed", title: "Humedad\nde la tierra", value: "95%")
                        
                        Spacer()
                        
                        SensorCard(imageName: "temp", title: "Intensidad\nde la luz", value: "60°")
                    }
                    .padding()
                    HStack{
                        SensorCard(imageName: "humed", title: "Humedad\ndel cielo", value: "50%")
                        
                        Spacer()
                        
                        SensorCard(imageName: "temp", title: "Temperatura\ndel suelo", value: "21°")
                    }
                    .padding()
                    HStack{
                        SensorCard(imageName: "humed", title: "pH", value: "7.4%")
                        
                        Spacer()
                        
                        SensorCard(imageName: "temp", title: "Hola mundo", value: "Hola°")
                    }
                    .padding()
                }
                
            }
            .offset(y: -50)
        }
        .background(Color(.systemGray6))
        
    }
}

#Preview {
    HomeView()
}
