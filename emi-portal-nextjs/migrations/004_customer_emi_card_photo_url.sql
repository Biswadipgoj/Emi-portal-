-- Add EMI card image link support (ImgBB URL only)
ALTER TABLE customers
  ADD COLUMN IF NOT EXISTS emi_card_photo_url TEXT;
