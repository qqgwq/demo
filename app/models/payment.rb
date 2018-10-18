class Payment < ActiveRecord::Base
  state_machine :state, initial: :pending do
    after_transition pending: :processing, do: :process_stripe_payment
    
    event :process do
      transition pending: :processing
    end

    event :failed do
      transition processing: :failed
    end

    event :success do
      transition processing: :successful
    end

    event :refund do
      transition successful: :refunded
    end
  end

  def process_stripe_payment
    if true
      success
    else
      failed
    end
  end

  def refunded_at
    raise StandardError if state != 'refunded'
    Time.zone.now
  end
end
