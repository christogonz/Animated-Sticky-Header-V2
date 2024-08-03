//
//  PinnedHeaderView.swift
//  AnimatedStickyHeaderV2
//
//  Created by Christopher Gonzalez on 2024-08-03.
//

import SwiftUI

struct PinnedHeaderView: View {
    @Binding var currentType: String
    var animation: Namespace.ID
    
    @Namespace static var animation
    
    var body: some View {
        let types: [String] = ["Popular", "Albums", "Song", "Fans also like", "About"]
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 25) {
                ForEach(types, id: \.self) { type in
                    VStack(spacing: 5) {
                        Text(type)
                            .fontWeight(.semibold)
                            .foregroundStyle(currentType == type ? .white : .gray)
                        
                        ZStack {
                            if currentType == type {
                                RoundedRectangle(cornerRadius: 4, style: .continuous)
                                    .fill(.white)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            } else {
                                RoundedRectangle(cornerRadius: 4, style: .continuous)
                                    .fill(.clear)
                            }
                        }
                        .padding(.horizontal, 8)
                        .frame(height: 4)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            currentType = type
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical)
            .padding(.top, 10)
            .padding(.bottom)
            
        }
    }
}
// MARK: Preview
struct PinnedHeaderView_Previews: PreviewProvider {
    @Namespace static var animation
    
    static var previews: some View {
        PinnedHeaderView(currentType: .constant("Popular"), animation: animation)
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}
