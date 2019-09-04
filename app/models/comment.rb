class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: :reject_posts

  def reject_posts(attributes)
    attributes['username'].blank?
  end
end

# When creating new comments, we should only create a new user if they filled in that input. 
# accepts_nested_attributes_for has a reject_if option that you can configure to 
# only create new records if all the fields aren't blank.

# Also, the select box that we use for the users needs
# to have a blank option –– check out the include_blank option for collection_select.
