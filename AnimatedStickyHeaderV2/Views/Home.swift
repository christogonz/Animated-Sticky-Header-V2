//
//  Home.swift
//  AnimatedStickyHeaderV2
//
//  Created by Christopher Gonzalez on 2024-08-02.
//

import SwiftUI

struct Home: View {
    @State var currentType: String = "Popular"
    @State var _albums: [Album] = albums
    
    // MARK: For Smoth sliding effect
    @Namespace var animation
    
    @State var headerOffset: (CGFloat, CGFloat) = (0,0)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                HeaderView()
                
                // MARK: Pinned Header with Content
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        SongList(_albums: $_albums)
                    } header: {
                        PinnedHeaderView(currentType: $currentType, animation: animation)
                            .background(.black)
                            .offset(y: headerOffset.1 > 0 ? 0 : -headerOffset.1 / 8)
                            .modifier(OffsetModifier(offset: $headerOffset.0, returnFromStart: false))
                            .modifier(OffsetModifier(offset: $headerOffset.1))
                    }
                }
            }
        }
        .overlay(content: {
            Rectangle()
                .fill(.black)
                .frame(height: 50)
                .frame(maxHeight: .infinity, alignment: .top)
                .opacity(headerOffset.0 < 5 ? 1 : 0)
        })
        .coordinateSpace(name: "SCROLL")
        .ignoresSafeArea(.container, edges: .vertical)
        
    }
}


#Preview {
    ContentView()
}
