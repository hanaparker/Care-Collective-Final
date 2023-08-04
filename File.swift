//
//  File.swift
//  Skin App 2.0
//
//  Created by Sarayu Veluri on 10/22/23.
//

import Foundation
import SwiftUI

struct ProfileInfo: Hashable, Codable {
    var name: String
    var skinType: String
    var skinColor: String
    var skinConditions: String
    var imageName: String
}



struct SkinConcernOptionsView: View {
    let skinConcernOptions = ["acne/blemishes", "hyperpigmentation", "dark circles", "uneven texture", "large pores", "aging", "redness", "puffiness", "uneven skintone", "none"]
    
    @Binding var selectedSkinConcerns: Set<String>
    @Binding var isShowingSkinConcernOptions: Bool
    
    var body: some View {
        NavigationView{
            List(skinConcernOptions, id: \.self, selection: $selectedSkinConcerns) { skinConcern in
                HStack{
                    Text(skinConcern)
                    Spacer()
                    Toggle("", isOn: Binding(get: {selectedSkinConcerns.contains(skinConcern)},
                                             set: {isSelected in
                        if isSelected {
                            selectedSkinConcerns.insert(skinConcern)
                        } else{
                            selectedSkinConcerns.remove(skinConcern)
                        }
                        if selectedSkinConcerns.contains("none"){
                            selectedSkinConcerns.remove("acne/blemishes")
                            selectedSkinConcerns.remove("hyperpigmentation" )
                            selectedSkinConcerns.remove("dark circles" )
                            selectedSkinConcerns.remove("uneven texture" )
                            selectedSkinConcerns.remove("large pores" )
                            selectedSkinConcerns.remove("aging" )
                            selectedSkinConcerns.remove("redness" )
                            selectedSkinConcerns.remove("puffiness" )
                            selectedSkinConcerns.remove("uneven skintone" )

                        }
                    }
                ))
                }
                .listStyle(InsetListStyle())
                .navigationTitle("select skin concerns")
                .navigationBarItems(trailing: Button("Submit"){
                    isShowingSkinConcernOptions = false
                })
            }
        }
    }
}

struct SelectedSkinConcernsModifier: ViewModifier {
    let isSelected: Bool
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity) // Expand to full width
            .padding(10)
            .background(isSelected ? Color.blue.opacity(0.3) : Color.clear)
    }
}
