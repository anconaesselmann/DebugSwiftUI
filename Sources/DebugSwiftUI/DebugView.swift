//  Created by Axel Ancona Esselmann on 10/4/23.
//

import SwiftUI

public struct DebugView: View {

    @StateObject
    var debugMangar = SwiftUIDebugManager.shared

    private let newId: IdWrapper<DebugId>

    var id: DebugId {
        newId.id
    }

    internal init?(_ id: DebugId?) {
        guard let id = id, SwiftUIDebugManager.shared.isDebugging else {
            return nil
        }
        DebugStats.shared.increment(viewDrawFor: id)
        self.newId = IdWrapper(id: id)
    }

    public init?(_ instance: Any) {
        self.init(DebugId(instance))
    }

    public var body: some View {
        if SwiftUIDebugManager.shared.isDebugging {
            Text(Self.description(for: id))
                .padding(4)
                .background(.blue.opacity(0.2))
                .cornerRadius(5)
                .onTapGesture {
                    printStats()
                }
                .onLongPressGesture {
                    DebugStats.shared.reset()
                    SwiftUIDebugManager.shared.update()
                    print("\n\nReset debug counts.")
                }
        }
    }

    private func printStats() {
        var header = "\n\nDebug stats for \(id.name)"
        if let instanceId = id.instanceId {
            header += ", id: \(instanceId)"
        }
        let appearCount = DebugStats.shared.appearCount(for: id)
        let initCount = DebugStats.shared.initCount(for: id)
        print(header)
        print("\tRedraw count: \(DebugStats.shared.viewDrawCounts(for: id))")
        print("\tAppear count: \(appearCount > 0 ? "\(appearCount)" : "not tracked")")
        print("\tInit count  : \(initCount > 0 ? "\(initCount)" : "not tracked")")
    }

    static func description(for id: DebugId) -> String {
        var result: String = String(DebugStats.shared.viewDrawCounts(for: id))
        if SwiftUIDebugManager.shared.showIds, let instanceId = id.instanceId {
            result = "\(instanceId)_\(result)"
        }
        if SwiftUIDebugManager.shared.showViewNames {
            result = "\(id.name)_\(result)"
        }
        return result
    }
}
