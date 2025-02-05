import SwiftUI

struct SettingsView: View {
    @State private var updateFrequency = 3 // Para controlar la frecuencia en segundos
        let step = 1
        let range = 1...10

    var body: some View {
        List {
            Section(header: Text("GENERAL")) {
                
                // Dispositivo conectado
                NavigationLink(destination: Text("Lista de dispositivos")) {
                    VStack(alignment: .leading) {
                        Text("Dispositivo conectado")
                            
                        Text("Conectado")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .navigationTransition(.automatic)
                
                // Frecuencia de actualización
                HStack {
                    VStack(alignment: .leading) {
                        Text("Frecuencia de actualización")
                            
                        Text("\(updateFrequency) segundos")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    HStack {
                        Stepper(
                            value: $updateFrequency,
                            in: range,
                            step: step
                        ) {}
                        
                    }
                }
                
                // Cambiar imagen de inicio
                NavigationLink(destination: Text("Seleccionar imagen")) {
                    HStack {
                        Image(systemName: "photo") // Puedes cambiar esto por una imagen real
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .cornerRadius(8)
                        Text("Cambiar imagen de inicio")
                    }
                }
                
            }
        }
    }
}

#Preview {
    SettingsView()
}
