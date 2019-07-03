# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# This file should contain all the record creation needed to seed the database with its default values.
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
Phones.destroy_all 

require 'csv'

def addresses 

    addresses = []
    columns = 
        [
            :old_address_id, 
            :line1, 
            :line2, 
            :city, 
            :state, 
            :country, 
            :zipcode
        ]

        CSV.foreach('public/OldCSVFiles/esto - address - esto - address.csv', headers: true) do |row|   
            if row['Addr_Address1'] != 'NULL'                                                             
                addresses.push(
                    {
                        old_address_id: row['Addr_AddressId'],
                        line1: row['Addr_Address1'],
                        line2: row['Addr_Address2'],
                        city: row['Addr_City'],
                        state: row['Addr_State'],
                        country: row['Addr_Country'],
                        zipcode: row['Addr_PostCode'],
                        address_type: true 
                    })
            end
        end
        Address.import columns, addresses, validate: false
       
end 

def companies 
    companies = []
    columns = 
    [
        :old_company_id,
        :name, 
        :website, 
        :company_status,
        :library_dir
    ]

    CSV.foreach('public/OldCSVFiles/esto company 122118 - esto company 122118.csv', headers: true) do |row|
        if row['Comp_Name'] != 'NULL'
            companies.push(
                {
                    old_company_id: row['Comp_Company'],
                    name: row['Comp_Name'],
                    website: row['Comp_WebSite']
                }
                if row['Comp_Status'] == 'active'
                    website: 'active'
                else 
                    website: 'unactive'
                end 
                    library_dir: ['Comp_LibraryDir'],
                    legacy_comp_id: ['comp_legacycompid']
        end 
            )
        Company.import column, companies, validate: false 
end 

def contacts

    contacts = []
    columns = 
    [
        :old_contact_id,
        :title,
        :first_name, 
        :last_name, 
        :office_email, 
        :personal_email, 
        :company_id,
    ]

    CSV.foreach('public/OldCSVFiles/esto - person - esto - person.csv', headers: true) do |row| 
        if row['Pers_FirstName'] || row['Pers_LastName']
            first_name: row['Pers_FirstName'],
            last_name: row['Pers_LastName']
            title: row['Pers_Title'],
            source: row['Pers_Source'],
            department: row['Pers_Department']
        end 
            )
        Contact.import column, contacts, validates: false 
end

def phones 
    area_code = nil
    phones = []
    columns = 
    [
        :old_phone_id,
        :phone_type,
        :phone_country_code, 
        :phone_area_code,
        :phone_num,
        :phone_initid, 
        :contact_id 
    ]

    CSV.foreach('public/OldCSVFiles/Esto - Phone - Esto - Phone.csv', headers: true) do |row|
        if row['Phon_Number'] 
            phone_type: 'Office Phone'
            if row['Phon_CountryCode'] 
                phone_country_code: row['Phon_CountryCode']
            else  
                phone_country_code: '01'
            end 
            if row['Phon_Area_Code']
                phone_area_code: row['Phon_AreaCode']
            else  
                area_code = row['Phone_AreaCode'][0..2]
                phone_area_code: area_code 
            end 
            fixed_phone_num = row['Phon_Number'].gsub(" ", "")
            if fixed_phone_num.size > 7 
                fixed_phone_num = fixed_phone_num.split('').shift(3).join('')
                    
                




    
end 

addresses
companies 
contacts 

    

