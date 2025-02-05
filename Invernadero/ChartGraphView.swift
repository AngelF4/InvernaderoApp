import SwiftUI
import Charts

struct DataPoint: Identifiable {
    let id = UUID()
    let time: Date
    let value: Double
}

struct ChartGraphView: View {
    @State var isOnTemp: Bool = true
    @State var isOnHum: Bool = true
    @State var isOnHumT: Bool = false
    @State var isOnInte: Bool = false

    let data1: [DataPoint] = (0..<20).map { i in
        DataPoint(
            time: Calendar.current.date(byAdding: .minute, value: -i, to: Date()) ?? Date(),
            value: Double.random(in: 10...35)
        )
    }.reversed()

    let data2: [DataPoint] = (0..<20).map { i in
        DataPoint(
            time: Calendar.current.date(byAdding: .minute, value: -i, to: Date()) ?? Date(),
            value: Double.random(in: 50...85)
        )
    }.reversed()
    
    @State private var selectedValue: (time: Date, temp: Double?, hum: Double?)?

    var body: some View {
        VStack {
            Chart {
                ForEach(data1) { point in
                    LineMark(
                        x: .value("Tiempo", point.time),
                        y: .value("Temperatura", point.value),
                        series: .value("Dato", "Temperatura")
                    )
                    .foregroundStyle(.red)
                    .opacity(isOnTemp ? 1 : 0)
                }

                ForEach(data2) { point in
                    LineMark(
                        x: .value("Tiempo", point.time),
                        y: .value("Humedad", point.value),
                        series: .value("Dato", "Humedad")
                    )
                    .foregroundStyle(.cyan)
                    .opacity(isOnHum ? 1 : 0)
                }

                // 🔥 Línea vertical en la posición seleccionada
                if let selected = selectedValue {
                    RuleMark(x: .value("Tiempo", selected.time))
                        .lineStyle(StrokeStyle(lineWidth: 2, dash: [5]))
                        .foregroundStyle(.gray)
                }
            }
            .chartXAxis {
                AxisMarks(format: .dateTime.hour().minute())
            }
            .frame(height: 250)
            .padding()
            .chartScrollableAxes(.horizontal)
            .chartXVisibleDomain(length: 300)
            .chartOverlay { proxy in
                GeometryReader { geo in
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    let touchLocation = value.location
                                    if let selectedTime = proxy.value(atX: touchLocation.x) as Date? {
                                        let nearestTemp = data1.min(by: { abs($0.time.timeIntervalSince(selectedTime)) < abs($1.time.timeIntervalSince(selectedTime)) })
                                        let nearestHum = data2.min(by: { abs($0.time.timeIntervalSince(selectedTime)) < abs($1.time.timeIntervalSince(selectedTime)) })
                                        selectedValue = (selectedTime, nearestTemp?.value, nearestHum?.value)
                                    }
                                }
                                .onEnded { _ in
                                    selectedValue = nil
                                }
                        )
                }
            }

            // 🔥 Muestra los valores seleccionados
            if let selected = selectedValue {
                VStack {
                    Text("Tiempo: \(selected.time.formatted(date: .omitted, time: .shortened))")
                        .font(.headline)
                    
                    if let temp = selected.temp, isOnTemp {
                        Text("Temperatura: \(String(format: "%.2f", temp))°C")
                            .foregroundColor(.red)
                    }
                    if let hum = selected.hum, isOnHum {
                        Text("Humedad: \(String(format: "%.2f", hum))%")
                            .foregroundColor(.cyan)
                    }
                }
                .padding()
            }

            List {
                Section(header: Text("Datos mostrados")) {
                    Toggle(isOn: $isOnTemp) {
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundStyle(Color.red)
                            Text("Temperatura")
                        }
                    }

                    Toggle(isOn: $isOnHum) {
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundStyle(Color.cyan)
                            Text("Humedad")
                        }
                    }

                    Toggle(isOn: $isOnHumT) {
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundStyle(Color.brown)
                            Text("Humedad de la tierra")
                        }
                    }
                    .disabled(true)

                    Toggle(isOn: $isOnInte) {
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundStyle(Color.orange)
                            Text("Intensidad lumínica")
                        }
                    }
                    .disabled(true)
                }
            }
        }
    }
}

#Preview {
    ChartGraphView()
}
