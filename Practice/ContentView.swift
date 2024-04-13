//
//  ContentView.swift
//  Practice
//
//  Created by Jai  on 13/04/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    @State private var users: [User] = []
    @State private var products:[Product] = []
    var body: some View {
        ScrollView{
            VStack {
                ForEach(products){product  in
                    Text(product.title )
                    
                    
                }
            }
            .padding()
            .task {
                await getData()
            }
        }
    }
    private func getData() async{
        do{
            users = try await DatabaseHelper().getUser()
            products = try await DatabaseHelper().getProduct()
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
