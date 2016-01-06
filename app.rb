require 'rubygems'
require 'bundler'


# require gems via bundler
Bundler.require



module TwoMatch
  class App < Sinatra::Application
    configure do
      disable :method_override
      disable :static

      set :sessions,
          :httponly => true,
          :secure => production?,
          :expire_after => 31557600, # 1 year
          :secret => ENV['SESSION_SECRET']
    end

    use Rack::Deflater
  end
end

require_relative 'routes/all'
