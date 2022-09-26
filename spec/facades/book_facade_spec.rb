require 'rails_helper'

   RSpec.describe BookFacade do
     it 'returns a result with the location, forecast, and books' do
       VCR.use_cassette('book results') do
         results = BookFacade.search_books("denver,co", 5)

         expect(results).to be_a(BookResults)
         expect(results.forecast).to be_a(Forecast)
         expect(results.books).to be_a(Array)
         expect(results.books.count).to eq(5)
         expect(results.destination).to eq('denver,co')
       end
     end
   end