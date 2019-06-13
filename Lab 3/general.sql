ALTER TABLE Customers ADD CONSTRAINT owed_is_not_negative CHECK (amountOwed >= 0);

ALTER TABLE Sales ADD CHECK (paidPrice*quantity >= 10.00);

ALTER TABLE Customers ADD CHECK (lastPaidDate IS NOT NULL OR status = 'L');

