# When a search for pages containing a specified title is executed via the API
When("A search for pages containing for {string} is executed") do |title|
  # Encode the title for URL compatibility and construct the full API URL
  url = "#{PAGE_SEARCH_URL}#{URI.encode_www_form_component(title)}"

  # Send a GET request to the API with basic authentication
  @response = HTTParty.get(url, basic_auth: basic_auth_credentials)
end

# Then the API response should contain any titles in its data structure
Then("the response should contain titles") do
  # Parse the JSON response from the API
  parsed_response = JSON.parse(@response.body)

  # Check if the 'title' key is present in the parsed response
  expect(parsed_response.key?('title')).to be true, "Response does not contain 'title' key."
end

# Then a page with a specific expected title should be found in the API response
Then("A page with the title {string} is found") do |expected_title|
  # Parse the response and extract titles from the 'pages' array
  parsed_response = JSON.parse(@response.body)
  titles = parsed_response['pages'].map { |page| page['title'] }

  # Assert that the titles array includes the expected title
  expect(titles).to include(expected_title), "Title '#{expected_title}' not found in the response."
end

# Then the API response should specifically contain the title provided
Then("the response should contain title {string}") do |title|
  # Parse the JSON response and check if any 'page' has the specified title
  parsed_response = JSON.parse(@response.body)
  title_found = parsed_response['pages'].any? { |page| page['title'] == title }

  # Assert that at least one page contains the specified title
  expect(title_found).to be true, "No page with the title '#{title}' was found in the response."
end
