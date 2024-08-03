//
//  SongList.swift
//  AnimatedStickyHeaderV2
//
//  Created by Christopher Gonzalez on 2024-08-03.
//

import SwiftUI

struct SongList: View {
    @Binding var _albums: [Album] 
    
    func getIndex(album: Album) -> Int {
        return _albums.firstIndex { currentAlbum in
            return album.id == currentAlbum.id
        } ?? 0
    }
    
    var body: some View {
        VStack(spacing: 25) {
            ForEach($_albums) { $album in
                
                HStack(spacing: 15) {
                    
                    Text("#\(getIndex(album: album) + 1)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    
                    Image(album.albumImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55, height: 55)
                        .clipShape(.rect(cornerRadius: 10))
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(album.albumName)
                            .fontWeight(.semibold)
                        
                        Label {
                            Text("65,856,655")
                        } icon: {
                            Image(systemName: "beats.headphones")
                                .foregroundStyle(.white)
                        }
                        .foregroundStyle(.gray)
                        .font(.caption)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        album.IsLiked.toggle()
                        
                    } label: {
                        Image(systemName: album.IsLiked ? "suit.heart.fill" : "suit.heart")
                            .font(.title3)
                    }
                    .foregroundStyle(album.IsLiked ? Color("MyGreen") : .white)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.title3)
                            .foregroundStyle(.white)
                    }
                }
            }
        }
        .padding()
        .padding(.bottom, 150)
    }
}

#Preview {
    SongList(_albums: .constant(albums))
        .background(.black)

}
