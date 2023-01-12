# frozen_string_literal: true

require_relative 'swag.rb'
require_relative 'vars.rb'
require 'psych'
require 'net/http'

module SwagGenerator
  class SwagHelper
    PATH_CONTRACT_API = "./app/controllers/swag_generator/swag_contract/api.yml"
    PATH_CONTRACT_CONFIG = "./app/controllers/swag_generator/swag_contract/config.yml"

    def initialize
    end

    def setupApi
      doc = File.open(PATH_CONTRACT_API, 'w')
      config = Psych.load_file(PATH_CONTRACT_CONFIG)
      puts "Loaded config info from swag/config.yml"
      doc << config.to_yaml
      puts "Wrote config info to swag/api.yml"
      doc.close
    end

    def doGet(fullPath)
      puts "Sending an http get request to #{fullPath}. Returning a hash."
      return $DEFAULT_GET
    end

    def doPath(arg, api)
      input = {
        "#{arg}" => {
          "get" => $DEFAULT_GET,
          "post" => $DEFAULT_POST,
          "patch" => {},
          "delete" => $DEFAULT_DELETE,
        },
      }
      # fullPath = "#{api["host"]}#{api["basepath"]}#{arg}"
      fullPath = "full path teste"

      input["#{arg}"]["get"] = doGet(fullPath)

      # api["paths"]["#{arg}"] = input["#{arg}"]
      api = input

      begin
        doc = File.open(PATH_CONTRACT_API, 'w')
        doc << api.to_yaml
            puts "Wrote api info to swag/api.yml"
        doc.close
      rescue Errno::ENOENT => e
        puts "Error creating file: swag/api.yml"
        puts e
      rescue IOError => e
        puts "Error writing to file: swag/api.yml"
        puts e
      end
    end
  end
end
