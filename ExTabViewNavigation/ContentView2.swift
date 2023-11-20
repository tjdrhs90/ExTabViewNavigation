//
//  ContentView2.swift
//  ExTabViewNavigation
//
//  Created by ssg on 11/20/23.
//

import SwiftUI

/// iOS 16 미만 버전
struct ContentView2: View {
    
    @State private var isDetailViewPresented = false
    @State private var selectedTabIndex = 0
    
    var body: some View {
        
        NavigationView {
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
            .onChange(of: selectedTabIndex) { [selectedTabIndex] newTab in
                if newTab == 2 {
                    self.selectedTabIndex = selectedTabIndex
                    isDetailViewPresented = true
                }
            }
            .background(
                NavigationLink(
                    destination: Text("NavigationLink"),
                    isActive: $isDetailViewPresented
                ) {
                    EmptyView()
                }
                .hidden()
            )
        }
    }
}

#Preview {
    ContentView2()
}
