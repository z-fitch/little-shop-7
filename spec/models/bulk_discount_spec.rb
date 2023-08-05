require 'rails_helper'

RSpec.describe BulkDiscount, type: :model do 
  describe "relationships" do 
    it {should belong_to :merchant}
  end

  describe "validations" do
    it { should validate_numericality_of :quantity }
    it { should validate_numericality_of :percentage }
  end
end