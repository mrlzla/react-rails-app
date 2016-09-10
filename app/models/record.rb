class Record < ActiveRecord::Base
	validates :amount, :title, :date, presence: true
end
