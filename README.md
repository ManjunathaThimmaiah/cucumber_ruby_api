
# Wikimedia API Test Project

This project demonstrates how to interact with the Wikimedia API using Cucumber and Ruby.

## Setup Instructions

### Prerequisites

- Ruby installed on your system ([installation instructions](https://www.ruby-lang.org/en/documentation/installation/))
- Bundler gem installed (`gem install bundler`)

### Getting Started

1. Clone the repository to your local machine:

   ```bash
   git clone git@github.com:ManjunathaThimmaiah/cucumber_ruby_api.git
   ```

2. Navigate to the project directory:

   ```bash
   cd cucumber_ruby_api
   ```

3. Install dependencies using Bundler:

   ```bash
   bundle install
   ```

4. Set up environment variables:
   
   - Open the `env.rb` file located in the `features/support` directory.
   - Set the values for `CLIENT_ID`, `CLIENT_SECRET`, `USERNAME`, and `PASSWORD` according to your Wikimedia API credentials.

5. Run the Cucumber tests:

   ```bash
   bundle exec cucumber
   ```
   or
   
    ```bash
   bundle exec cucumber -f pretty -f html -o report.html
   ```
6. Report will be generated and stored under cucumber_ruby_api folder


## Additional Information

- Replace `CLIENT_ID`, `CLIENT_SECRET`, `USERNAME`, and `PASSWORD` in the `env.rb` file with your actual Wikimedia API credentials.
- The `api_wikimedia_page_details_steps.rb`, `api_wikimedia_page_search_steps.rb` and `api_common_steps` file contains step definitions for interacting with the Wikimedia API.
- You can modify the feature files in the `features` directory to add or update test scenarios.
