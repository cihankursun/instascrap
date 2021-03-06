require 'watir'
require 'nokogiri'
require 'fileutils'
require 'mechanize'

class Instagram
  def initialize(url = nil)
    $url = url 
    @mechanize = Mechanize.new
  end

  def download_img
    unless $url.nil? 
      puts "download from #{$url}"
      puts "========== DOWNLOADING IMAGE =========="

      browser = Watir::Browser.new(:phantomjs)
      browser.goto($url)

               # parsing with nokogiri
      document = Nokogiri::HTML(browser.html)
      link = document.search("div._4rbun img")[0]["src"]
      photo = browser.goto(link)
      FileUtils.mkdir_p 'ig_photos'
      FileUtils.cd 'ig_photos'
      pwd = FileUtils.pwd 

      getting_photo = @mechanize.get photo 
      unless File.exists?("#{pwd}/#{photo.to_s.split(".jpg").first + ".jpg" }")
        begin
          getting_photo.save!
        rescue
        end
      else
        puts "file already exist"
      end
    end

    puts "images: #{pwd}/#{getting_photo.filename}/"
  end

  def download_videos
    unless $url.nil? 
      puts "download from #{$url}"
      puts "========== DOWNLOADING VIDEO =========="

      browser = Watir::Browser.new(:phantomjs)
      browser.goto($url)

      # parsing with nokogiri
      document = Nokogiri::HTML(browser.html)
      link = document.search("video._l6uaz")[0]["src"]
      video = browser.goto(link)
      FileUtils.mkdir_p 'ig_movies'
      FileUtils.cd 'ig_movies'
      pwd = FileUtils.pwd 

      getting_video = @mechanize.get video
      unless File.exists?("#{pwd}/#{video.to_s.split(".mp4").first + ".mp4" }")
        begin
          getting_video.save!
        rescue
        end
      else
        puts "file already exist"
      end
    end

    puts "videos: #{pwd}/#{getting_video.filename}"
  end
end

instagram = Instagram.new(ARGV[0])
puts "What you want? img or mp4 \n"
STDOUT.flush
val = gets.chomp
if val == "img" 
  puts "Please push image link"
  $url= gets.chomp
  instagram.download_img
elsif val == "mp4" 
  puts "Please push video link"
  $url = gets.chomp
  instagram.download_videos
else
  puts "Please push correct link"
end

