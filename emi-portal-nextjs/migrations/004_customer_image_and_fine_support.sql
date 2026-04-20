-- Add missing EMI card image URL field (URL string only)
ALTER TABLE customers
  ADD COLUMN IF NOT EXISTS emi_card_photo_url TEXT;

-- Ensure disburse_amount is never NULL for customer creation/updates
UPDATE customers
SET disburse_amount = COALESCE(disburse_amount, GREATEST(COALESCE(purchase_value, 0) - COALESCE(down_payment, 0), 0))
WHERE disburse_amount IS NULL;

ALTER TABLE customers
  ALTER COLUMN disburse_amount SET DEFAULT 0;
