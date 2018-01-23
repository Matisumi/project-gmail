require 'google_drive' #gem for accessing google sheet
require 'rubygems'
require 'nokogiri'   #gems to open pages and get nodes
require 'open-uri'


def get_all_the_urls_of_seine_saint_denis() #methode that gets all the town's url of the 93's page and put in the sheet town name and email

	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/seine-saint-denis.html")) #opening page of all cities of 93
	cities = "" #initializing 
	page.css('a.lientxt').each do |town| #for each <a> with a class "lientxt" ...
		site = "https://annuaire-des-mairies.com" + town['href'][1..-1] # the variable site starts with "htt...." and add the href and from it removing the . before the /
		cities = town.text #take the content of <a> </a> and turn it into a str
		$ws[$i, 1] = cities #in the cell line i (counter) column 1 write what in the variable cities (alias the town name)
		$ws[$i, 2] = get_the_email_of_a_townhal_from_its_webpage(site) #in line i column 2 write the email by calling the get email methode with the rebuild site as argument
		$i += 1 #add 1 to  the counter so it goes to the next line in the sheet
		puts "writting :  #{cities} => #{get_the_email_of_a_townhal_from_its_webpage(site)}" #displays what city and what email its taking care of
	
	end


end

def get_all_the_urls_of_val_doise_townhalls()#does quite the same as the methode above
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	
	cities = ""
	page.css('a.lientxt').each do |town|
		site = "https://annuaire-des-mairies.com" + town['href'][1..-1]
		cities = town.text
		$ws[$i, 1] = cities
		$ws[$i, 2] = get_the_email_of_a_townhal_from_its_webpage(site)
		$i += 1
		puts "writting :  #{cities} => #{get_the_email_of_a_townhal_from_its_webpage(site)}"
		  
	end
end


def get_the_email_of_a_townhal_from_its_webpage (adresse) #methode that use the "rebuilt" link as argument to get the email of a town
	page = Nokogiri::HTML(open(adresse))  #opens the page of the link given in argument 
	
	return page.css('td.style27 p.Style22 font')[6].text #returns the 6th value found => email into str
end

def get_all_data_to_google()  #starting method

	session = GoogleDrive::Session.from_config("config.json") #initialize a googleDrive session via the config.json file
	$ws = session.spreadsheet_by_key("1M1vJ2XhdkrV2JvmHb5RauwYmHlHWv1k-AbdXTFx7Ti8").worksheets[0] #put into a cross funtion variable the  1st page of the google sheet given


	$i = 1 #initialize counter
	get_all_the_urls_of_seine_saint_denis() #fetch the first area's email addresses
	get_all_the_urls_of_val_doise_townhalls()#fetch the second area's email addresses
	$ws.save #save what's been previously written
	puts "saved!" #tells us that it saved

end


get_all_data_to_google() #calls the starting function
