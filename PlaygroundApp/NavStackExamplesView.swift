//
//  NavStackExamplesView.swift
//  PlaygroundApp
//
//  Created by Leonardo Kiszewski on 12/01/24.
//

import SwiftUI

struct Car: Identifiable, Hashable {
    let id =  NSUUID().uuidString
    let name: String
}

struct Brand: Identifiable, Hashable {
    let id =  NSUUID().uuidString
    let name: String
}

struct NavStackExamplesView: View {
    
    let cars = [
        Car(name: "Punto"),
        Car(name: "Celta"),
        Car(name: "Corsa"),
    ]
    
    let brands = [
        Brand(name: "GM"),
        Brand(name: "BMW"),
        Brand(name: "Audi")
    ]
    
    @State private var navPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navPath) {
            List {
                Section("Cars List") {
                    ForEach(cars) { car in
                        NavigationLink(value: car) {
                            Text(car.name)
                        }
                    }
                }
                
                Section("Brands List") {
                    ForEach(brands) { brand in
                        NavigationLink(value: brand) {
                            Text(brand.name)
                        }
                    }
                }
                
                Button(action: { navPath = NavigationPath(brands) }) {
                    Text("Navigate all brands")
                }
            }
            .navigationDestination(for: Car.self) { car in
                Text("Details of \(car.name)")
            }
            .navigationDestination(for: Brand.self) { brand in
                VStack {
                    Spacer()
                    viewForBrand(brand)
                    Spacer()
                    Button(action: { navPath = NavigationPath() }) {
                        Text("Back to root")
                    }
                }
            }
        }
    }
    
    func viewForBrand(_ brand: Brand) -> some View {
        switch(brand.name) {
        case "Audi":
            Text(brand.name + " " + brand.id).foregroundColor(.blue)
        default:
            Text(brand.name)
        }
    }
 }

#Preview {
    NavStackExamplesView()
}
