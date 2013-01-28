class Charity < ActiveRecord::Base
  # ein should be unique..

  # http://apps.irs.gov/app/eos/forwardToPub78DownloadLayout.do
  # http://apps.irs.gov/app/eos/forwardToPub78Download.do
  attr_accessible :city, :country, :deductibility_status, :deductibility_status_description, :ein, :legal_name, :state
end
