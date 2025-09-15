DO $$
<<outer_block>>
DECLARE 
	foo text := 'Hello';
BEGIN
	<<inner_block>>
	DECLARE
		foo text := 'World';
	BEGIN	
   		RAISE NOTICE '%, %', outer_block.foo, inner_block.foo;	
	END inner_block;
END outer_block
$$;