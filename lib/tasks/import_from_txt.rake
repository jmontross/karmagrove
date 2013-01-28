


namespace :import do

  desc "Import Pipe Delimted IRS 5013c Data "
  task :irs_data => :environment do

    require 'csv'

    txt_file_path = 'db/irs_5013cs.txt'
    results = File.open(txt_file_path).readlines do |line|
      line = line.split('|').each_slice(7)
    end

    # Order Field Notes
    # 1  EIN   Required
    # 2  Legal Name  Optional
    # 3  City  Optional
    # 4  State   Optional
    # 5  Deductibility Status  Optional
    # 6  Country   Optional - If Country is null, then Country is assumed to be United States
    # 7  Deductibility Status Description  Optional

    results.each do |row|
      row = row.split('|').each_slice(7).to_a.first
      #ID,Category,Sub Category,State Standard
      Charity.create!({
        :ein                              => row[0],
        :legal_name                       => row[1],
        :city                             => row[2],
        :state                            => row[3],
        :deductibility_status             => row[4],
        :country                          => row[5],
        :deductibility_status_description => row[6]
      })
    end
  end
end