require 'rails_helper'

   RSpec.describe WeatherFacade do
     it 'returns a weather object with the proper attributes' do
        results = WeatherFacade.full_weather("denver,co")

        expect(results).to be_a(Weather)
        expect(results.current_weather).to be_a(Current)
        expect(results.hourly_weather).to be_a(Array)
        expect(results.hourly_weather.count).to eq(8)
        expect(results.hourly_weather.first).to be_a(Hourly)
        expect(results.daily_weather).to be_a(Array)
        expect(results.daily_weather.count).to eq(5)
        expect(results.daily_weather.first).to be_a(Daily)
     end
   end