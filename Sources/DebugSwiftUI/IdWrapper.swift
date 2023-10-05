//  Created by Axel Ancona Esselmann on 10/5/23.
//

import Foundation

struct IdWrapper<ID> where ID: Identifiable {
    private let internalId = UUID()
    let id: ID
}
