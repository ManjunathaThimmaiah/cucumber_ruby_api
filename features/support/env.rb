require 'cucumber'
require 'httparty'
require 'sinatra'
require 'json'

# Include HTTParty in the global context of this script to extend its functionality
# across the entire application.
World(HTTParty)

# ACCESS_TOKEN: URL used for obtaining OAuth2 access tokens from Wikimedia.
ACCESS_TOKEN = "https://meta.wikimedia.org/w/rest.php/oauth2/access_token"

# PAGE_SEARCH_URL: Base URL for the Wikimedia API to search page titles.
# It is used in conjunction with search queries to fetch pages from Wikipedia.
PAGE_SEARCH_URL = "https://api.wikimedia.org/core/v1/wikipedia/en/search/title?q="

# PAGE_DETAILS: Base URL for accessing detailed information about specific Wikipedia pages.
# This URL is used to fetch detailed content, such as page content, revisions, and more.
PAGE_DETAILS = "https://api.wikimedia.org/core/v1/wikipedia/en/page/"

# USERNAME: API username/Client_id for Wikimedia API authentication.
USERNAME = "11605db21461baf0d56b30f2383bebee"

# PASSWORD: API password/Client_Secrete for Wikimedia API authentication.
PASSWORD = "f1412e280a48f63e3c2ef0dfb4bc83d6141f0c7f"

# CLIENT_ID: API Client_id for Wikimedia API authentication.
CLIENT_ID = "11605db21461baf0d56b30f2383bebee"

# CLIENT_SECRETE: API Client_Secrete for Wikimedia API authentication.
CLIENT_SECRETE = "f1412e280a48f63e3c2ef0dfb4bc83d6141f0c7f"

def basic_auth_credentials
  {
    username: USERNAME,
    password: PASSWORD
  }
end
