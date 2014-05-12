# could just make buddha inherit from product.. 
class Buddha < ActiveRecord::Base
  attr_accessible :file_location, :media_type, :product

  def self.create_links
  	#!/usr/bin/env ruby

     require 'rubygems'
     require 'aws-sdk'
     
     AWS.config(
       :access_key_id => '*** Provide access key ***', 
       :secret_access_key => '*** Provide secret key ***'
     )
     
     bucket_name = '*** Provide bucket name ***'
     source_key = '*** Provide source key ***'
     target_key = '*** Provide target key ***'
     
     # Get an instance of the S3 interface.
     s3 = AWS::S3.new
     
     # Copy the object.
     s3.buckets[bucket_name].objects[target_key].copy_from(source_key) 
     
     puts "Copying file #{source_key} to #{target_key}."   

     # aws-sdk http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectExpiration.html  
     # fog http://stackoverflow.com/questions/21461143/use-fog-with-ruby-to-generate-a-pre-signed-url-to-put-a-file-in-amazon-s3
  end

end
