# == Schema Information
#
# Table name: deposits
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  club_id    :integer
#  amount     :decimal(, )
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Deposit do
  pending "add some examples to (or delete) #{__FILE__}"
end
