//  Created by Axel Ancona Esselmann on 10/5/23.
//

import Foundation

internal struct DebugId: Hashable, Equatable, Identifiable {
    let name: String
    let instanceId: String?

    var id: String {
        "\(name)_\(instanceId ?? "0")"
    }

    init(name: String, instanceId: String? = nil) {
        self.name = name
        self.instanceId = instanceId
    }

    init?(_ instance: Any) {
        guard SwiftUIDebugManager.shared.isDebugging else {
            return nil
        }
        if let instanceId = (instance as? (any Identifiable))?.id ?? nil {
            self.init(name: "\(type(of: instance))", instanceId: "\(instanceId)")
        } else {
            self.init(name: "\(type(of: instance))")
        }
    }
}
