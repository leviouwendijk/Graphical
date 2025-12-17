import Foundation
import Terminal

public enum GraphRenderer {
    public static func render(
        _ graph: GraphData,
        width: Int = 40,
        colorize: Bool = true,
        showValues: Bool = true
    ) {
        guard !graph.points.isEmpty else {
            print("(no data)")
            return
        }

        let maxVal = graph.maxValue
        let scale = maxVal > 0 ? Double(width) / maxVal : 1

        for point in graph.points {
            let barLen = Int(point.value * scale)
            let color: ANSIColor? = colorize ? pickColor(for: point.value, max: maxVal) : nil
            let bar = ANSIBar.render(barLen, color: color)
            let valStr = showValues ? String(format: "%.0f", point.value) : ""
            print("\(point.label.ansi(.dim)): \(bar) \(valStr)")
        }
    }

    private static func pickColor(for value: Double, max: Double) -> ANSIColor {
        let ratio = value / max
        switch ratio {
        case 0.8...1.0: return .green
        case 0.5..<0.8: return .yellow
        default: return .red
        }
    }
}
