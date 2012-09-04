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
              :presence => { :message => :presense_message },
              :length   => {
                             :maximum => 50000,
                             :message => :max_lenght_message
                           }
end
