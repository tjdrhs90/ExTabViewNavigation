//
//  ContentView.swift
//  ExTabViewNavigation
//
//  Created by ssg on 11/20/23.
//

import SwiftUI

/// iOS 16 이상 버전
struct ContentView: View {
    
    @State private var isDetailViewPresented = false
    @State private var selectedTabIndex = 0
    
    var body: some View {
        
        NavigationStack {
            TabView(selection: $selectedTabIndex) {
                
                Text("Tab 0 Content")
                    .tabItem {
                        Image(systemName: "0.circle.fill")
                        Text("Tab 0")
                    }
                    .tag(0)
                Text("Tab 1 Content")
                    .tabItem {
                        Image(systemName: "1.circle.fill")
                        Text("Tab 1")
                    }
                    .tag(1)
                Text("Tab 2 Content")
                    .tabItem {
                        Image(systemName: "2.circle.fill")
                        Text("Tab 2")
                    }
                    .tag(2)
            }
            .onChange(of: selectedTabIndex) { oldValue, newValue in
                if newValue == 2 {
                    self.selectedTabIndex = oldValue
                    isDetailViewPresented = true
                }
            }
            .navigationDestination(isPresented: $isDetailViewPresented) {
                Text("navigationDestination")
            }
        }
    }
}

#Preview {
    ContentView()
}
