require 'test_helper'

class CreditCardServiceTest < ActiveSupport::TestCase
  test 'it creates charges' do
    params = {
      amount: 500,
      card: 'TOKEN'
    }
    Stripe::Charge.expects(:create).with(params).returns(true)
    # This will return false if it fails
    charge = CreditCardService.new(params).charge
    assert charge
  end

  test 'it creates customers' do
    params = {
      email: 'test@example.card',
      card: 'TOKEN'
    }
    Stripe::Customer.expects(:create).with(params).returns(true)
    # This will return false if it fails
    customer = CreditCardService.new(params).create_customer
    assert customer
  end
end