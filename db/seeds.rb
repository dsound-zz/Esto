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
Phone.destroy_all 

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
        :library_dir,
        :old_address_id, 
        :company_status
    ]

    CSV.foreach('public/OldCSVFiles/esto company 122118 - esto company 122118.csv', headers: true) do |row|
        if row['Comp_Name'] != 'NULL'
            companies.push(
                {
                    old_company_id: row['Comp_CompanyId'],
                    name: row['Comp_Name'],
                    website: (row['Comp_WebSite'] if row['Comp_WebSite']),
                    library_dir: row['Comp_LibraryDir'],
                    legacy_comp_id: row['omp_legacycompid'],
                    old_address_id: row['Comp_PrimaryAddressId'],
                    **(['Comp_Status'] == 'Active' ? {company_status: 'Active'} : {company_status: 'Inactive'}) 
                }
             )
        end 
    end  
    Company.import columns, companies, validate: false 
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
            contacts.push(
            {
                first_name: row['Pers_FirstName'],
                last_name: row['Pers_LastName'],
                title: row['Pers_Title'],
                source: row['Pers_Source'],
                department: row['Pers_Department']
            })
        end 
    end
            
        Contact.import column, contacts, validate: false 
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
            phones.push({
                phone_type: 'Office Phone'
            **(['Phon_CountryCode'] ? { phone_country_code: row['Phon_CountryCode'] } : { phone_country_code: '01'}),
            if row['Phon_Area_Code'] 
             phones.push({  phone_area_code: row['Phon_AreaCode'] && row['Phon_AreaCode'].size == 3 })
            else 
                if row['Phon_Number'].size > 7
               phones.push({ phone_area_code: row['Phon_Number'][0..2] })
                end 
            end
            if row['Phon_Number'] > 7
               phone_num_ary = row['Phon_Number'].split('')
                phone_num_ary.each do |num| 
                    while phone_num_ary > 7 
                        phone_num_ary.shift()
                    end
                end 
            end 
                phones.push({phone_num: fixed_number(row['Phon_Number'])[0]})
                phones.push({phone_ext: fixed_number(row['Phon_Number'])[1]}) 
            else 
                phones.push({phone_num: row['Phon_Number']}) 
            end 
        end   
    end    
    Phone.import column, phones, validate: false
end 


def fix_number(num)
  fixed_phone = []
  fixed = num.gsub(' ', '').split('')
  extension = ''
  fixed.reverse.each do |n| 
    fixed.pop()
    extension += n 
      if n == 'x' 
      fixed_phone = extension.reverse, fixed.join('') 
      end 
  end 
  
end 


    

# addresses
companies 
# contacts
# phones  

