require 'pry'
require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  attr_accessor :mission_links

  # def initialize
  #   @@all = []
  # end

  #def get_page
    #html = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')


  def get_page
    html = open("https://www.jpl.nasa.gov/missions/active-cavity-irradiance-monitor-satellite-acrimsat/")
    doc = Nokogiri::HTML(html)

    full_name = doc.css('h1.media_feature_title').text.strip
    description = doc.css('div.wysiwyg_content p').text.strip#needs formatting
    # mission_events = doc.css###
    # key_discoveies = doc.css###
    # scientific_instruments = doc.css('h[h3.text = "Scientific Instrument(s)"]')

    array = doc.css('ul.fast_facts li').text.delete("\t").delete("\n").delete("\r").split("  ")
    # => "Acronym: AcrimSatType: OrbiterStatus: PastLaunch Date: December 20, 1999, Launch Location: Vandenberg Air Force #Base, CaliforniaMission End Date: August 08, 2014Target: EarthCurrent Location: Earth Orbit\r\nAltitude: 713 km #(apogee), #672 km (perigee)"
    #binding.pry
    new = array.map {|el| el.split(":")}
    #binding.pry
    new.each do |el|
      binding.pry
      k = el[0].to_sym
      v = el[1].delete(": ")
      attributes[k] = v
      #binding.pry
    end



    attributes = {}



  end

  # def get_courses
  #   self.get_page.css("section#course-grid article")
  #   #binding.pry
  # end

  # def make_courses
  #   self.get_courses.map do |el|
  #     course = Course.new
  #     course.title = el.css("h2").text
  #     course.schedule = el.css("date").text
  #     course.description = el.css("p").text
  #     #binding.pry
  #   end
  # end
  #
  # def print_courses
  #   self.make_courses
  #   Course.all.each do |course|
  #     binding.pry
  #     if course.title
  #       puts "Title: #{course.title}"
  #       puts "  Schedule: #{course.schedule}"
  #       puts "  Description: #{course.description}"
  #     end
  #   end
  # end

end
