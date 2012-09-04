# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user

  validates :content,
              :presence => { :message => "can't be blank" },
              :length   => {
                             :maximum => 50000,
                             :message => "can't contain more than %{count} symbols"
                           }
end
