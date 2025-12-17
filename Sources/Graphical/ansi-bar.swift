import Foundation
import Terminal

public enum ANSIBar {
    public static func render(_ count: Int, color: ANSIColor? = nil, char: String = "▇") -> String {
        let bar = String(repeating: char, count: count)
        if let color {
            return bar.ansi(color)
        } else {
            return bar
        }
    }
}
