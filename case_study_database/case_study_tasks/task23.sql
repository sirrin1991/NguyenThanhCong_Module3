DELIMITER //

CREATE PROCEDURE delete_customer_by_id ( id int  )

BEGIN
	delete from customers
    where customer_id = id;
END; //

DELIMITER ;


call delete_customer_by_id (12);

