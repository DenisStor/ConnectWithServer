import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    EmployeesView()
                } label: {
                    HStack {
                        Text ("Employees")
                            .font (.headline)
                        Spacer ()
                        Image (systemName: "chevron.right")
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                }
                
                Spacer ()
            }
                .navigationTitle("Fetching Data")
        }
    }
}
