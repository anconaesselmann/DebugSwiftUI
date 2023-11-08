//  Created by Axel Ancona Esselmann on 11/8/23.
//

import SwiftUI

public extension View {
    func debug_randomBackground() -> some View {
        VStack {
            if SwiftUIDebugManager.shared.showRandomBackground {
                self.background(Color.random.opacity(0.4))
            } else {
                self
            }
        }
    }
}
