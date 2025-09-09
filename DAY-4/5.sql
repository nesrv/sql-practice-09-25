CREATE TYPE currency AS (
	amount numeric,
    code   text
);

CREATE TABLE transactions(
    account_id   integer,
    debit        currency,
    credit       currency,
	date_entered date DEFAULT current_date
);

INSERT INTO transactions VALUES (1, NULL, '(100.00,"RUB")');

INSERT INTO transactions VALUES (2, ROW(80.00,'RUB'), NULL);

INSERT INTO transactions VALUES (3, (20.00,'RUB'), NULL);

TABLE transactions;
SELECT t.account_id FROM transactions t;
SELECT (t.debit).amount, (t.credit).amount FROM transactions t;


 SELECT ((10.00,'RUB')::currency).amount;
 SELECT (10.00,'RUB')::record;