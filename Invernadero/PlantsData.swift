//
//  PlantsData.swift
//  Invernadero
//
//  Created by Angel HG on 06/02/25.
//

import Foundation
import SwiftUI

struct Plant: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let longDescription: String
    let color: Color
}

let plants: [Plant] = [
    Plant(
        imageName: "cactus",
        title: "OPUNTIA MICRODASYS",
        description: "Pequeño pero resistente, este cactus está lleno de vida y espinas.",
        longDescription: "La Opuntia microdasys, también conocida como nopalillo o cactus orejas de conejo, es una especie de cactus originaria de México. Su estructura distintiva está formada por almohadillas ovaladas cubiertas de diminutas espinas llamadas gloquidios, que pueden desprenderse fácilmente al tacto. A diferencia de otros cactus, este no tiene espinas largas y afiladas, pero sus gloquidios pueden causar irritación en la piel si no se maneja con cuidado. Este cactus es altamente resistente a la sequía y puede prosperar en climas cálidos con luz solar intensa. Se adapta bien a suelos arenosos y requiere un drenaje excelente para evitar el exceso de humedad en las raíces. Durante la primavera y el verano, puede desarrollar pequeñas flores amarillas, seguidas de frutos rojos que sirven de alimento para la fauna silvestre. Ideal para jardines xerófilos o como planta de interior en espacios bien iluminados, la Opuntia microdasys no solo añade un toque exótico a cualquier ambiente, sino que también requiere un mantenimiento mínimo, lo que la convierte en una opción perfecta para quienes buscan una planta llamativa y de fácil cuidado.",
        color: .green
    ),
    Plant(
        imageName: "orquidea",
        title: "PHALAENOPSIS APHRODITE",
        description: "Una orquídea elegante con pétalos hermosos y vibrantes.",
        longDescription: "La Phalaenopsis aphrodite es una orquídea elegante y sofisticada, ampliamente apreciada por sus flores grandes y simétricas que evocan la belleza y delicadeza de la naturaleza. Originaria del sudeste asiático, esta especie florece con pétalos de tonos blancos o rosados, a menudo con un centro amarillo vibrante y detalles púrpuras, lo que la hace una de las variedades más populares en la horticultura ornamental. A diferencia de muchas otras orquídeas, la Phalaenopsis aphrodite tiene un período de floración prolongado, que puede durar varios meses si se le brindan los cuidados adecuados. Prefiere ambientes cálidos y húmedos, con una iluminación indirecta que imite las condiciones de las selvas tropicales donde crece de manera natural. Sus raíces aéreas le permiten absorber la humedad del ambiente, por lo que es recomendable regarla con moderación y asegurarse de que el sustrato tenga un buen drenaje. Esta orquídea simboliza la elegancia, la belleza y la longevidad, siendo un regalo ideal para ocasiones especiales. Con los cuidados adecuados, puede florecer año tras año, convirtiéndose en una joya viva que embellece cualquier espacio.",
        color: .purple
    ),
    Plant(
        imageName: "aloe-vera",
        title: "ALOE VERA",
        description: "Una suculenta con propiedades medicinales y estéticas.",
        longDescription: "La Aloe vera, también conocida como sábila, es una planta suculenta reconocida por sus múltiples propiedades medicinales y cosméticas. Originaria de regiones áridas del norte de África y la península arábiga, esta planta ha sido utilizada durante siglos por sus beneficios para la piel, la digestión y la salud en general. Sus hojas gruesas y carnosas contienen un gel transparente rico en vitaminas, minerales y compuestos bioactivos con propiedades hidratantes, cicatrizantes y antiinflamatorias. De fácil mantenimiento, el Aloe vera prospera en climas cálidos y secos, requiriendo poca agua y una exposición moderada al sol. Su capacidad de almacenar agua en las hojas la convierte en una planta resistente a la sequía, ideal para interiores y jardines de bajo mantenimiento. Aunque rara vez florece en interiores, en su hábitat natural puede producir largos tallos con flores tubulares de tonos amarillos o anaranjados. Además de su atractivo ornamental, el Aloe vera es conocido por su uso en la medicina natural. Su gel es ampliamente utilizado para tratar quemaduras, irritaciones cutáneas y heridas menores, mientras que su jugo, en dosis controladas, se emplea como suplemento digestivo. Ya sea como elemento decorativo, remedio natural o ingrediente en productos de belleza, esta planta versátil es una de las más apreciadas en el mundo.",
        color: .green
    )
]
