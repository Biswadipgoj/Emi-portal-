ALTER TABLE payment_requests
  ADD COLUMN IF NOT EXISTS upi_utr TEXT;
