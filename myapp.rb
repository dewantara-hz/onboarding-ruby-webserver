# myapp.rb
require 'sinatra'
require 'sinatra/reloader'
require 'onboarding'

get '/' do
    'hello world'
end

get '/validate' do
    onboarding = Onboarding.new
    onboarding.url = params[:url]
    content = onboarding.access
    
    type = params[:type]
    result = false

    if type == 'json'
        result = onboarding.is_valid_json(content)
    elsif type == 'xml'
        result = onboarding.is_valid_xml(content)
    elsif type == 'html'
        result = onboarding.is_valid_html(content)
    end

    result.to_s

end

get '/content' do 
    onboarding = Onboarding.new
    onboarding.url = params[:url]
    onboarding.access
end

