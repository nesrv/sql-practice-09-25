DO $$
DECLARE
 	-- сами операторы могут и отсутствовать
	foo integer NOT NULL := 0;
	bar CONSTANT text := 42;
	
BEGIN
	/* А это — многострочный.
       После каждого объявления ставится знак ';'.
       Этот же знак ставится после каждого оператора.
    */
   -- bar := bar + 1;
   RAISE NOTICE '%, %', foo, bar;
	
END
$$;