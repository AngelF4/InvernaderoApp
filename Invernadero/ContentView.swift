//
//  ContentView.swift
//  Invernadero
//
//  Created by Angel HG on 31/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 2 {
        didSet {
            if !(0...4).contains(selectedTab) {
                selectedTab = 2 // Valor seguro por defecto
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack{
                TabView(selection: $selectedTab){
                    PlantsView()
                        .tabItem{
                            Label("Plantas", systemImage: "leaf.fill")
                        }
                        .tag(0)
                                    
                    RegulationView()
                        .tabItem {
                            Label("Regulación", systemImage: "slider.horizontal.3")
                        }
                        .tag(1)
                                    
                    HomeView()
                        .tabItem{
                            Label("Inicio", systemImage: "house.fill")
                        }
                        .tag(2)
                                    
                    ChartGraphView()
                        .tabItem {
                            Label("Grafica", systemImage: "chart.xyaxis.line")
                        }
                        .tag(3)
                                    
                    SettingsView()
                        .tabItem {
                            Label("Configuración", systemImage: "gear")
                        }
                        .tag(4)
                }
                .tabViewStyle(DefaultTabViewStyle()) // 🔥 Evita el problema con SideBarAdaptableTabViewStyle
                    
                .navigationTitle(
                    selectedTab == 0 ? "Plantas" :
                    selectedTab == 1 ? "Regulación" :
                    selectedTab == 2 ? "" :
                    selectedTab == 3 ? "Grafica" :
                        "Configuración"
                )
                .toolbar {
                    ToolbarItem(placement: .principal) { // Coloca el título o imagen en el centro
                        Image("invernaderoLogo") // Usa una imagen como título
                            .resizable()
                            .scaledToFit()
                            .frame(height: 43) // Ajusta el tamaño de la imagen
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
