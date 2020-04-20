require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module Insta
  class Application < Rails::Application
    class Application < Rails::Application
      config.load_defaults 5.2
      config.time_zone = 'Tokyo'
      config.active_record.default_timezone = :local
      #日本語化辞書入れるとVagrantに不具合あるのでコメントアウト
      #config.i18n.default_local = :ja
      #config.load_defaults 5.1
      #config.generators do |g|
      #  g.assets false
      #  g.helper false
      #end
    end
  end
end
