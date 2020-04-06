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

  def get_quote(content = nil, ind = nil)
    # Read in quotefile if not already provided
    if(content == nil)
      content = IO.readlines("app/assets/static/quotes.txt")
    end

    # Pick a random line
    if(ind == nil)
      ind = rand(content.size)
    else
      ind = ind % content.size
    end

    # Find the nearby quote
    until (content[ind] == "----\n")
      ind -= 1
    end

    # Align appropriately
    ind += 1
    quote = ""

    # Get the quote
    until (content[ind] == "----\n")
      quote += content[ind] + "\n"
      ind += 1
    end

    # Get a new quote if this one is too big or has a weird formatting thing
    if(quote.length > 500 or quote.include?("<"))
      return get_quote(content)
    end

    return quote
  end

  def get_body?()
    fingerprint = params[:fingerprint]
    if(fingerprint == nil)
      raise("fingerprint not found...")
    end
    user = User.find_by_fingerprint(fingerprint)

    if(user == nil)
      User.create!([{fingerprint:fingerprint}])
    end

    if not user_exists?
        return "Hi! Welcome to my website! Please fill out the form below."
    else
        return "Hi #{user.name}! Welcome back! You first visited on " + user.created_at.to_formatted_s(:long_ordinal)
    end
    return
  end

  def fingerprint_exists?()
    return User.find_by_fingerprint(params[:fingerprint]) != nil
  end

  def user_exists?()
    return User.find_by_fingerprint(params[:fingerprint]).username != nil
  end
end

