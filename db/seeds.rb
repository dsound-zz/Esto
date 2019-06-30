# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Address.destroy_all 
Company.destroy_all
CompanyProject.destroy_all 
Contact.destroy_all 
EmployeeProject.destroy_all 
Employee.destroy_all 
Image.destroy_all 
Invoice.destroy_all 
ProjectContact.destroy_all 
ProjectImage.destroy_all 
Project.destroy_all 


    addresses = CSV.foreach('public/OldCSVFiles/esto - address - esto - address.csv', headers: true).map do |row|                                                                 
      Address.new(
        old_address_id: row['Addr_AddressId'],
        line1: row['Addr_Address1'],
        line2: row['Addr_Address2'],
        city: row['Addr_City'],
        state: row['Addr_State'],
        country: row['Addr_Country'],
        zipcode: row['Addr_PostCode'],
        address_type: 'business', 
      )
    end
    Address.import(addresses)

    

