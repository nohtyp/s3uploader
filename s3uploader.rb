require 'rubygems'
require 'fog'

connection = Fog::Storage.new({
  :provider                => 'AWS',
  :aws_access_key_id       => '',
  :aws_secret_access_key   => '' 
  })
  
#sc = connection.directories.get('petergriffin1')
#connection.put_bucket_website(sc.key , 'index.htm')
#puts "#{sc.key}"

sc = connection.directories.get('petergriffin1')
#sct = connection.directories
#sct = connection.files
#connection.put_bucket_website(sc.key , 'index.html')
test = connection.files(options = {directory: sc})
puts "Changing permissions on #{test[0].key}"
connection.put_object_acl(sc.key, test[0].key, 'public-read')
