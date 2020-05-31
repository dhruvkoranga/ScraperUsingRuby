require 'httparty'
require 'nokogiri'
require 'byebug'

def scraper
	url = "https://internshala.com/internships/work-from-home-jobs"
	unparsed_page = HTTParty.get(url)
	parsed_page = Nokogiri::HTML(unparsed_page)
	job_listings = parsed_page.css('div.internship_meta')
	job_listings.each do |job_listings|
		job = {
			title:job_listings.css('a')[0].text,
			company:job_listings.css('a')[1].text.strip,
			location:job_listings.css('a')[2].text,
			URL: "https://internshala.com" + job_listings.css('a')[0].attributes["href"].value
		}
		byebug
	end
end

scraper