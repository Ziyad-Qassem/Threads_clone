//
//  ThreadCell.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 12) {
                
                CircularUserImage(user: nil)
                VStack(alignment: .leading, spacing: 4){
                    HStack {
                        Text("User Name")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        Button {
                            
                        }label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }
                    }
                        Text("user Content")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }.padding(.vertical , 8)
                        .foregroundStyle(.black)
                    }
                }
            Divider()
        }.padding()
        }
    }


#Preview {
    ThreadCell()
}
