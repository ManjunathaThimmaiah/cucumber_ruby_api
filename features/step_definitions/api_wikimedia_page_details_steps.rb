# When the page details for a specific title are requested
When("The page details for {string} are requested") do |title|
  # format the title and construct the request URL
  title = title.gsub(' ', '_')
  url = "#{PAGE_DETAILS}#{URI.encode_www_form_component(title)}/bare"

  # Execute the GET request using basic authentication
  @response = HTTParty.get(url, basic_auth: basic_auth_credentials)
end

# Then the timestamp in the response should be greater than the specified date
Then("the timestamp should be greater than {string}") do |date|
  # Parse the JSON response to extract relevant data
  parsed_response = JSON.parse(@response.body)

  # Extract and convert the timestamp from the response
  timestamp = DateTime.parse(parsed_response['latest']['timestamp'])

  # Assert that the timestamp is greater than the given date
  expect(timestamp).to be > DateTime.parse(date), "Expected the timestamp to be greater than #{date}, but it was #{timestamp}."
end
