#This step is not used, can used for enhancement
Given("A client of the API") do
  # No need to implement, as we're using basic authentication
  @basic_auth_credentials_details = basic_auth_credentials
end

# Then the response status should match the specified status code
Then("the response status should be {int}") do |status|
  # Check if the response status code matches the expected status
  expect(@response.code).to eq(status), "Expected HTTP status #{status}, but got #{@response.code}."
end

# This step is not used and can be used for enhancement
# When sending a POST request to obtain an access token via curl
When("I send a curl request to get the access token") do
  command = "curl -X POST -F 'grant_type=client_credentials' " \
    "-F 'client_id=#{CLIENT_ID}' " \
    "-F 'client_secret=#{CLIENT_SECRETE}' " \
    "#{ACCESS_TOKEN}"

  # Execute the curl command and capture its output
  stdout, stderr, status = Open3.capture3(command)

  # Check if the command executed successfully
  raise "Failed to execute curl command: #{stderr}" unless status.success?

  # Parse the JSON response
  response_data = JSON.parse(stdout)

  # Store the access token
  @access_token = response_data['access_token']
end

# This method is not working, it needs a fix
# When sending a GET request to the Wikimedia API with a specified title using an access token
When("I send a GET request to the Wikimedia API with title {string} using the access token") do |title|
  url = "#{BASE_URL}#{URI.encode_www_form_component(title)}"
  headers = {
    'Authorization' => "Bearer #{@access_token}",
    'User-Agent' => 'ProjectLotto'
  }

  @response = HTTParty.get(url, headers: headers)
end