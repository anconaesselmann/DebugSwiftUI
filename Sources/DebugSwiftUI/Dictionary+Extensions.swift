//  Created by Axel Ancona Esselmann on 10/5/23.
//

import Foundation

extension Dictionary where Value == Int {
    subscript(index: Key, default defaultValue: Int) -> Value {
        self[index] ?? 0
    }
}
