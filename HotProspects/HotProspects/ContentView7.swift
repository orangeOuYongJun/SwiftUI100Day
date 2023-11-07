//
//  ContentView7.swift
//  HotProspects
//
//  Created by OrangeOu on 11/6/23.
//

import SwiftUI
import UserNotifications

struct ContentView7: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                UNUserNotificationCenter.current().add(request)
            }
            
        }
    }
}

struct ContentView7_Previews: PreviewProvider {
    static var previews: some View {
        ContentView7()
    }
}
