# app.rb
require 'sinatra'
require 'pg'

get '/' do
  '<HEAD><TITLE>ICESI</TITLE></HEAD>
   <BODY><H1>Sistemas Distribuidos</H1>
   <H3>Parcial 1</H3>
   Estudiante : Andres Felipe Ortiz <br />
   Codigo: 10207000 | A00222584<br />
   <br />
   <H3>Servicios</H3>
   /<br />
   /test<br />
   /devices<br />
   /brands
   </BODY>'
end

get '/test' do
  'Restfull working !'
end

get '/devices' do  
  begin
    "DEVICES<br />"
    con = PGconn.connect("192.168.56.102", 5432, '', '', "swn", "userandres", "passortiz") 

    rs = con.exec("SELECT * FROM devices")

    rs.map do |row|
      "#{row['id']} - #{row['device_name']}<br />"
  end

  rescue PG::Error => e
    puts e.message     
  ensure
    con.close if con    
  end
end

get '/brands' do  
  begin
    "BRANDS<br />"
    con = PGconn.connect("192.168.56.102", 5432, '', '', "swn", "userandres", "passortiz")

    rs = con.exec("SELECT * FROM brands")

    rs.map do |row|
      "#{row['id']} - #{row['brand_name']}<br />"
  end        
    
  rescue PG::Error => e
    puts e.message     
  ensure
    con.close if con    
  end
end