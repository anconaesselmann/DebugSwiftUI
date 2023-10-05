//  Created by Axel Ancona Esselmann on 10/4/23.
//

import Foundation

internal class DebugStats: ObservableObject {

    static let shared = DebugStats()

    private var viewDrawCounts: [DebugId: Int] = [:]
    private var appearCounts: [DebugId: Int] = [:]
    private var initCounts: [String: Int] = [:]

    func increment(viewDrawFor id: DebugId) {
        viewDrawCounts[id, default: 0] += 1
    }

    func viewDrawCounts(for id: DebugId) -> Int {
        viewDrawCounts[id, default: 0]
    }

    func increment(appearCountFor id: DebugId) {
        appearCounts[id, default: 0] += 1
    }

    func appearCount(for id: DebugId) -> Int {
        appearCounts[id, default: 0]
    }

    func increment(initCountFor id: DebugId) {
        initCounts[id.name, default: 0] += 1
    }

    func initCount(for id: DebugId) -> Int {
        initCounts[id.name, default: 0]
    }

    func reset() {
        viewDrawCounts = [:]
        appearCounts = [:]
        initCounts = [:]
        self.objectWillChange.send()
    }
}
