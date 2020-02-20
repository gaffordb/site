require 'open-uri'
require 'json'

module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Internet website"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def get_quote()
    if false
    begin
    content = open("https://quotes.rest/qod?language=en",
                      "X-TheySaidSo-Api-Secret" => "shoot")
    resp_err = false
    rescue OpenURI::HTTPError
      resp_err = true
      quote = "No more quotes today, sorry! There will be more tomorrow..."
    unless resp_err
      data = JSON.parse(content)['contents']
      quote = data['quotes']['quote'] + '\n' +
          data['quotes']['author']
    end
    end
    end
    quote = "No more quotes today, sorry! There will be more tomorrow..."
    junk = "Also, here's a random number: #{rand(100)}"
    quote + junk
    end
  end
