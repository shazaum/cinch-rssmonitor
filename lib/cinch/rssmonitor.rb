require "cinch/rssmonitor/version"
require 'cinch'
require 'simple-rss'
require 'open-uri'
require 'yaml'

module Cinch
	module Plugins
		class RssMonitor
			include Cinch::Plugin
	    
			match %r{addrss (.+) (.+)},         :method => :add_rss
			match %r{rss (.+)},                 :method => :read_rss

			def initialize(*args)
				super

				@rss_file = config[:rss_file]
			end

			def add_rss(m, rss, link)

				rss_name = get_rss
				rss_name = rss_name.find{|q| q["rss"] == rss }

				if rss_name.nil?
				  feed_base = "nothing"
				else
				  feed_base = rss_name["rss"]
				end

				if feed_base == rss
				  m.reply "#{rss} has already been added"  
				else      

				  #get title
				  get_title = SimpleRSS.parse open("#{link}")
				  title = get_title.items.first.title
				  m.reply title

				  # add rss link and last/first title
				  new_rss = { "rss" => rss, "link" => link, "deleted" => false, "title" => title}

				  # add it to the list
				  existing_rss = get_rss  || []
				  existing_rss << new_rss

				  new_rss_index = existing_rss.index(new_rss)
				  existing_rss[new_rss_index]["id"] = new_rss_index + 1

				  # write it to the file
				  output = File.new(@rss_file, 'w')
				  output.puts YAML.dump(existing_rss)
				  output.close

				  m.reply "Added rss #{rss}"
				end
			end

			def read_rss(m, rss)
				rss_name = get_rss
				rss_name = rss_name.detect{|q| q["rss"] == rss } 

				if rss_name.nil?
				  m.reply "RSS not found"
				else
				  link = rss_name["link"]
				  rss = SimpleRSS.parse open("#{rss_name["link"]}")
				  m.reply "#{rss.items.first.title} - #{rss.items.first.link}"
				end
			end

			#--------------------------------------------------------------------------------
			# Protected
			#--------------------------------------------------------------------------------

			protected

			def get_rss
				output = File.new(@rss_file, 'r')
				rss = YAML.load(output.read)
				output.close
				rss
			end
		end
	end
end
