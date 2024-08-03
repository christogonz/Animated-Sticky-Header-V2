//
//  HeaderView.swift
//  AnimatedStickyHeaderV2
//
//  Created by Christopher Gonzalez on 2024-08-03.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let size = proxy.size
            let height = (size.height + minY)
            
            Image("ElMichael")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: height > 0 ? height : 0, alignment: .top)
                .overlay(content: {
                    ZStack(alignment: .bottom) {
                        
                        // Dimming out the text content
                        LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("ARTIST")
                                .font(.callout)
                                .foregroundStyle(.gray)
                            
                            HStack(alignment: .center, spacing:  10){
                                Text("Michael Jacksson")
                                    .foregroundStyle(.white)
                                    .font(.title.bold())
                                
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundStyle(.blue.gradient)
                                    .background {
                                        Circle()
                                            .fill(.white)
                                            .padding(3)
                                    }
                            }
                            
                            Label {
                                Text("Monthly Listeners")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white.opacity(0.7))
                            } icon: {
                                Text("62,354,659")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                            }
                            .font(.caption)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 25)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                })
                .clipShape(.rect(cornerRadius: 0))
                .offset(y: -minY)
        }
        .frame(height: 350)
    }
}

#Preview {
    HeaderView()
}
