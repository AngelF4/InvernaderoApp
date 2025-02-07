import SwiftUI



struct PlantsView: View {
    let namespace: Namespace.ID // Se recibe aquí
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 15) {
                ForEach(plants) { plant in
                    PlantCard(plant: plant, namespace: namespace)
                }
            }
            .padding()
        }
        .background(Color(.systemGray6))
        .navigationTitle("Plantas")
    }
}




#Preview {
     @Previewable @Namespace var namespace
    NavigationStack {
        PlantsView(namespace: namespace)
    }
}
