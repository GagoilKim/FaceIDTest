//
//  ContentView.swift
//  FaceIDTeset
//
//  Created by Donghyun Kim on 2021/05/23.
//

import SwiftUI
import LocalAuthentication


struct ContentView: View {
    @State private var isUnlocked = false
    var body: some View {
        VStack{
            if isUnlocked{
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: {
            authentication()
        })
    }
    func authentication(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "We need to unlock your data"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){ success, authenticationError in
                DispatchQueue.main.async {
                    if success{
                        isUnlocked = true
                    }else{
                        
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
