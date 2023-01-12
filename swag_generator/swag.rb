# frozen_string_literal: true

require_relative 'swag_helper.rb'
require_relative 'vars.rb'

module SwagGenerator
	class Swag
		PATH_CONTRACT = "./app/controllers/swag_generator/swag_contract"
		PATH_CONTRACT_CONFIG = "./app/controllers/swag_generator/swag_contract/config.yml"
		PATH_CONTRACT_API = "./app/controllers/swag_generator/swag_contract/api.yml"

		@helper = SwagGenerator::SwagHelper.new

		def self.config
			puts "Starting configuration..."
			if File.exist?(PATH_CONTRACT_CONFIG)
				puts "Config file already exists."
			else
				begin
					Dir.mkdir(PATH_CONTRACT) unless Dir.exists?("swag_contract")

					config = File.open(PATH_CONTRACT_CONFIG, 'w')
					config << $DEFAULT_CONFIG.to_yaml
					config.close
				rescue Errno::ENOENT => e
					puts "Error while making swag_contract/config.yml"
					puts e
					puts e.backtrace
				end
			end
		end

		def self.merge
			begin
				doc = File.open(PATH_CONTRACT_API, 'w')
				doc.close
			rescue Errno::ENOENT => e
				puts "Error opening file."
				puts e
			rescue IOError => e
				puts "Error writing to file."
				puts e
			end
		end

		def self.path(arg)
			@helper.setupApi unless File.exist?(PATH_CONTRACT_API)
			begin
				api = YAML.load_file(PATH_CONTRACT_API)
				puts api
				# puts "Path to explore: #{api["host"]}#{api["basepath"]}#{arg}"
			rescue Errno::ENOENT => e
				puts "Error loading swag_contract/api.yml. Make sure it is configured properly."
				puts e
				puts e.backtrace
			end
			puts "Is this correct? [y/n]:"
			answer = STDIN.gets.chomp
			if answer.downcase == "y"
				@helper.doPath(arg, api)
			elsif answer == ""
				puts "yes"
				@helper.doPath(arg, api)
			elsif answer.downcase == "n"
				puts "Please try again."
			else
				puts "Please try again."
			end
		end
	end
end

