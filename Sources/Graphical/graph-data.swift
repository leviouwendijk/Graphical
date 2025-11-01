import Foundation

public struct GraphDataPoint: Sendable, Codable {
    public let label: String
    public let value: Double

    public init(label: String, value: Double) {
        self.label = label
        self.value = value
    }
}

public struct GraphData: Sendable {
    public let points: [GraphDataPoint]

    public init(points: [GraphDataPoint]) {
        self.points = points
    }

    public var maxValue: Double {
        points.map(\.value).max() ?? 0
    }

    public var minValue: Double {
        points.map(\.value).min() ?? 0
    }

    public var total: Double {
        points.map(\.value).reduce(0, +)
    }

    public var average: Double {
        guard !points.isEmpty else { return 0 }
        return total / Double(points.count)
    }
}
