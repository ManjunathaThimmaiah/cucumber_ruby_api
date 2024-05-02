
```ruby create_page.rb
require 'httparty'
require 'json'

# API endpoint
url = 'https://api.wikimedia.org/core/v1/wikipedia/en/page'

# Request data
request_data = {
  source: 'Lotto24',
  title: 'Lotto24 Company',
  comment: 'Creating a test page with the Wikimedia API'
}

# Headers with authorization token
headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
  'User-Agent': 'YOUR_APP_NAME (YOUR_EMAIL_OR_CONTACT_PAGE)'
}

# Send POST request
response = HTTParty.post(url, headers: headers, body: request_data.to_json)

# Parse and print response
output = JSON.parse(response.body)
puts output
```

### Setup Instructions:

1. **Clone the Repository**: Clone the repository containing the Ruby code to your local machine.

   ```bash
   git clone git@github.com:ManjunathaThimmaiah/cucumber_ruby_api.git
   ```

2. **Install Dependencies**: Ensure you have Ruby installed on your system. You can install dependencies using Bundler.

   ```bash
   cd cucumber_ruby_api
   bundle install
   ```

4. **Run the Script**: Execute the Ruby script to send a POST request to create a page via the Wikimedia API.

   ```bash
   ruby create_page.rb
   ```
   
5. **Run the feature file**: Execute the below feature file by configuring the page names and validate the report.

  ```bash
   https://github.com/ManjunathaThimmaiah/cucumber_ruby_api/blob/master/features/api_wm_page_details_search_tc.feature
   ```
   
   

