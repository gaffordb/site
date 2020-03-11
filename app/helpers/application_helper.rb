require 'open-uri'
require 'json'
require 'execjs'

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
    # Read in quotefile
    content = IO.readlines("app/assets/static/quotes.txt")

    # Pick a random line
    ind = rand(content.size)

    # Find the nearby quote
    until (content[ind] == "----\n")
      ind -= 1
    end

    ind += 1
    quote = ""

    # Get the quote
    until (content[ind] == "----\n")
      quote += content[ind] + "\n"
      ind += 1
    end
    return quote
  end

  def user_exists?()
    fingerprint = params[:fingerprint]
    user = User.find_by_fingerprint(fingerprint)
    if(user == nil)
        User.create!([{fingerprint:fingerprint}])
        return "Hi! Welcome to my website!"
    else
        return "Hi! You've been here before! You first visited on " + user.created_at.to_formatted_s(:long_ordinal)
    end
    return
  end
end

