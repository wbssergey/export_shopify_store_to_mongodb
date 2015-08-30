
APIKEY   = '################################'
PASSWORD = '###############################'
SHOPNAME = 'ukpowercases.myshopify.com'

CYCLE = 0.5 # seconds     # You can average 2 calls per second

require 'rubygems'    # Need this to use the shopify_api gem.
require 'shopify_api' # Tellement utile to speak to your shop.

# Telling your shop who's boss
#
  url="https://#{APIKEY}:#{PASSWORD}@#{SHOPNAME}/admin"

 ShopifyAPI::Base.site = url
#
# # How many.
  product_count = ShopifyAPI::Product.count
  nb_pages      = (product_count / 250.0).ceil
#
# # Do we actually have any work to do?
  puts "Yo man. You don't have any product in your shop. duh!" if 

product_count.zero?
#
# Initializing.
 start_time = Time.now
# While we still have products.

1.upto(nb_pages) do |page|
    unless page == 1
        stop_time = Time.now
      puts "Last batch processing started at #{start_time.strftime('%I:%M%p')}"
      puts "The time is now #{stop_time.strftime('%I:%M%p')}"
                   processing_duration = stop_time - start_time
      puts "The processing lasted #{processing_duration.to_i} seconds."
                          wait_time = (CYCLE - processing_duration).ceil
      puts "We have to wait #{wait_time} seconds then we will resume."
               sleep wait_time if wait_time > 0
                      start_time = Time.now
                end

     products = ShopifyAPI::Product.find( :all, :params => { :limit => 250, :page => page } )
       products.each do |product|
       puts "PRODUCT ID #{product.id} : "
       puts product.title
       puts product.body_html

       product.variants.each do |variant|
       puts "VARIANT ID #{variant.id} : "
       puts variant.price
       puts variant.option1
       end

       end
       end

                                                                                       
