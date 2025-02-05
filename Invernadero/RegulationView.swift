import SwiftUI

struct RegulationView: View {
    @State private var updateDirtyH = 70
    @State private var humidity = 30
    @State private var lightIntensity = 100
    @State private var ph: Double = 7.4 // Cambio de Float16 a Double
    let stepPh: Double = 0.1
    let rangePh: ClosedRange<Double> = 4.0...8.5 // Asegurar el mismo tipo
    let step = 10
    let range = 0...100

    var body: some View {
        List {
            Section(header: Text("modificadores")) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Humedad")
                        Text("\(humidity) %")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Stepper(value: $humidity, in: range, step: step) {}
                }

                HStack {
                    VStack(alignment: .leading) {
                        Text("Humedad de la tierra")
                        Text("\(updateDirtyH) %")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Stepper(value: $updateDirtyH, in: range, step: step) {}
                }

                HStack {
                    VStack(alignment: .leading) {
                        Text("Intensidad lumínica") // Corregido "Intencidad"
                        Text("\(lightIntensity) %")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Stepper(value: $lightIntensity, in: range, step: step) {}
                }

                HStack {
                    VStack(alignment: .leading) {
                        Text("pH de la planta")
                        Text(String(format: "%.1f", ph)) // Formatear a 1 decimal
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Stepper(value: $ph, in: rangePh, step: stepPh) {}
                }
            }
        }
    }
}

#Preview {
    RegulationView()
}
