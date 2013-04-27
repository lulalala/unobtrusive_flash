# encoding: utf-8
module UnobtrusiveFlash
  class InstallGenerator < Rails::Generators::Base
    desc "Copies unobtrusive_flash.css and .js to their corresponding locations"

    source_root File.expand_path('../../../templates', __FILE__)

    def copy_files
      if Rails::VERSION::STRING.starts_with?('3') && Rails.application.config.respond_to?(:assets)
        base_folder = 'vendor/assets'
      else
        base_folder = 'public'
      end
      empty_directory "#{base_folder}/stylesheets"
      template 'unobtrusive_flash.css', "#{base_folder}/stylesheets/unobtrusive_flash.css"
      empty_directory "#{base_folder}/javascripts"
      template 'unobtrusive_flash.js', "#{base_folder}/javascripts/unobtrusive_flash.js"
    end
  end
end
