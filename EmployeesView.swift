//
//  EmployeesView.swift
//  Api
//
//  Created by Денис Сторожев on 10.05.2023.
//

import SwiftUI

struct EmployeesView: View {
    
    @StateObject var  networkManager = NetworkManager.shared
    
  //  @State private var employees = [Employee]()
    
    var body: some View {
        
        ZStack{
            
            List(networkManager.employees, id: \.self) { employee in
                HStack{
                    Text(employee.employee_name)
                    Spacer()
                    Text(employee.employee_salary,format: .number)
                }
            }
            .onAppear{networkManager.fetchEmployees()   }
        }
    }
}


struct EmployeesView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesView()
    }
}
