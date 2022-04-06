//
//  StarterScreen.swift
//  FirePerfect
//
//  Created by Xasan Xasanov on 06/04/22.
//

import SwiftUI

struct StarterScreen: View {
    @EnvironmentObject var session: SessionStore
    var body: some View {
        VStack {
            if self.session.session != nil {
                HomeScreen()
            } else {
                SigninScreen()
            }
        }.onAppear {
            session.listen()
        }
    }
}

struct StarterScreen_Previews: PreviewProvider {
    static var previews: some View {
        StarterScreen()
    }
}
