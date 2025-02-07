import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 2 {
        didSet {
            if !(0...4).contains(selectedTab) {
                selectedTab = 2 // Valor seguro por defecto
            }
        }
    }
    
    @Namespace private var namespace // Namespace compartido
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $selectedTab) {
                    PlantsView(namespace: namespace)
                        .tabItem {
                            Label("Plantas", systemImage: "leaf.fill")
                        }
                        .tag(0)
                    
                    RegulationView()
                        .tabItem {
                            Label("Regulación", systemImage: "slider.horizontal.3")
                        }
                        .tag(1)
                    
                    HomeView()
                        .tabItem {
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
                .navigationTitle(
                    selectedTab == 0 ? "Plantas" :
                    selectedTab == 1 ? "Regulación" :
                    selectedTab == 2 ? "" :
                    selectedTab == 3 ? "Grafica" :
                    "Configuración"
                )
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("invernaderoLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 43)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
