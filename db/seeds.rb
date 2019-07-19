# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# This file should contain all the record creation needed to seed the database with its default values.
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Address.destroy_all 
Company.destroy_all
ProjectContact.destroy_all 
Contact.destroy_all 
Email.destroy_all
EmployeeProject.destroy_all 
Employee.destroy_all 
# Image.destroy_all 
Invoice.destroy_all 
ProjectImage.destroy_all 
# Project.destroy_all 
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
            :zipcode,
            :address_type
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
        :old_company_id,
        :old_address_id,
        :title,
        :first_name, 
        :last_name, 
    ]

    CSV.foreach('public/OldCSVFiles/esto - person - esto - person.csv', headers: true) do |row| 
        if row['Pers_FirstName'] || row['Pers_LastName']
            contacts.push(
            {
                old_contact_id: row['Pers_PersonId'],
                old_company_id: row['Pers_CompanyId'],
                old_address_id: row['Pers_PrimaryAddressId'],
                first_name: row['Pers_FirstName'],
                last_name: row['Pers_LastName'],
                title: row['Pers_Title'],
                source: row['Pers_Source'],
                department: row['Pers_Department']
            })
        end 
    end
            
    Contact.import columns, contacts, validate: false 
end


def phones 
    fixedCounryCode = nil 
    area_code = nil
    phones = []
    columns = 
    [
        :old_phone_id,
        :old_company_id,
        :old_address_id,
        :phone_type,
        :phone_country_code, 
        :phone_area_code,
        :phone_num,
        :phone_ext, 
        :phone_initid, 
        :phone_foreign_id
        
    ]
  
    CSV.foreach('public/OldCSVFiles/Esto - Phone - Esto - Phone.csv', headers: true) do |row|
        if row['Phon_Number'] 
            row['Phon_CountryCode'] = "1" if row['Phon_CountryCode'] == nil || row['Phon_CountryCode'].to_i == 0
          
                if !row['Phon_AreaCode']
                row['Phon_AreaCode'] = row['Phon_Number'][0..2]
                end 
            phone_number = row['Phon_CountryCode'] + row['Phon_AreaCode'] + row['Phon_Number']
            phone_number = phone_number.gsub(' ', '')
            phone_number = phone_number.sub('x', ';')
            phone = Phonelib.parse(phone_number)
                    
          
         
             phones.push({
                old_phone_id: row['Phon_PhoneId'],
                phone_type: 'Office Phone',
                phone_country_code: phone.country_code,
                phone_area_code: phone.area_code,
                phone_num: phone.local_number,
                phone_ext: (phone.extension if phone.extension),
                phone_initid: row['phon_intid'],
                phone_foreign_id: row['phon_intforeignid']
             }) 
           
        end  
        
    end  
    
    Phone.import columns, phones, validate: false
end 


def emails
    emails = []
    columns = 
    [
        :email_link_id,
        :email_address, 
        :email_type,
        :email_deleted,
        :email_intforeignid,
        :email_intid
    ]

    CSV.foreach('public/OldCSVFiles/Esto - Email MAP.xlsx - Esto - Email.csv', headers: true) do |row| 
        if row['Emai_EmailAddress']
            emails.push({
                email_link_id: row['Emai_EmailId'],
                email_address: row['Emai_EmailAddress'],
                email_type: 'temporary',
                email_deleted: (true if row['Emai_Deleted'] == '1'),
                email_intforeignid: row['emai_intforeignid'],
                email_intid: row['emai_intid']
            })
        end
    end
    Email.import columns, emails, validate: false 
end


def projects
    projects = []
    columns = 
    [
        :old_company_id,
        :old_contact_id,
        :old_project_id,
        :old_assigned_userid,
        :description, 
        :project_type, 
        :project_status,
        :location,
        :job_number,
        :old_notes
    ]

    CSV.foreach('public/OldCSVFiles/esto-projects - esto-projects.csv', headers: true) do |row|
        projects.push({
            old_project_id: row['Oppo_OpportunityId'],
            old_contact_id: (row['Oppo_PrimaryPersonId'] if row['Oppo_PrimaryPersonId']),
            old_company_id: row['Oppo_PrimaryCompanyId'],
            old_assigned_userid: row['Oppo_AssignedUserId'],
            description: row['Oppo_Description'],
            project_type: (row['Oppo_Type'] if row['Oppo_Type']),
            project_status: row['Completed'],
            location: row['oppo_location'],
            job_number: row['oppo_jobnumber'], 
            old_notes: row['Oppo_Note']
        }) 
        
    end
    Project.import columns, projects, validate: false 

end


def images 
    images = []
    columns =
    [
       :caption,
       :photographer,
       :image_number,
       :file_size,
       :keywords 
    ]

    CSV.foreach('/Users/demiansims/Development/Esto/public/OldCSVFiles/esto-online_archive-DL - esto-online_archive .csv', headers: true) do |row|
        images.push({
            caption: row['Caption'],
            photographer: row['Photographer'],
            image_number: row['image_number (with job number as prefix)'],
            file_size: row['File Size'],
            keywords: row['Keywords']
        })
    end
    Image.import columns, images, validates: false 
end 


def old_relation_creation
    old_project_ids = Project.pluck(:old_project_id)
    old_company_ids = Company.pluck(:old_company_id)
    old_contact_ids = Contact.pluck(:old_contact_id)
    
    old_project_ids.each do |op| 
        CompanyProject.create(:project_id => op )
        ProjectContact.create(:project_id => op )
    end
    
    old_company_ids.each { |pc| CompanyProject.create(:company_id => pc)}
    old_contact_ids.each { |pc| ProjectContact.create(:contact_id => pc)}
end



 


    

# addresses
companies 
# contacts
# phones  
# emails
# projects
# images 
# old_relation_creation




