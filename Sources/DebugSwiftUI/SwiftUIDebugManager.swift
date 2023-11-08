//  Created by Axel Ancona Esselmann on 10/4/23.
//

import Foundation

public class SwiftUIDebugManager: ObservableObject {
    private init() {}

    public static let shared = SwiftUIDebugManager()

    public var showRandomBackground: Bool = false
    public var isDebugging: Bool = false
    public var showIds: Bool = false
    public var showViewNames: Bool = false

    public func update() {
        Task { @MainActor in
            self.objectWillChange.send()
        }
    }
}

public extension SwiftUIDebugManager {
    func increment(appearCountFor parent: Any) {
        guard let id = DebugId(parent) else { return }
        DebugStats.shared.increment(appearCountFor: id)
    }

    func increment(initCountFor parent: Any) {
        guard let id = DebugId(parent) else { return }
        DebugStats.shared.increment(initCountFor: id)
    }

    func incrementOnChangeCount<K, T>(for parent: Any, path: KeyPath<K, T>) {
        print("\(path)")
    }
}
