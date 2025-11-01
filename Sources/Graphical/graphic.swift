import Foundation

public enum Graphic {
    public static func quickRender(
        _ values: [(String, Double)],
        width: Int = 40,
        colorize: Bool = true
    ) {
        let data = GraphData(points: values.map { GraphDataPoint(label: $0.0, value: $0.1) })
        GraphRenderer.render(data, width: width, colorize: colorize)
    }
}
