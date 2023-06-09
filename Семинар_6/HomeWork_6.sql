DROP DATABASE IF EXISTS h_work_6;
 
CREATE DATABASE h_work_6;
 
use h_work_6;
 
/*
1) Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
Drop procedure if EXISTS format_time;
Delimiter \\
Create PROCEDURE format_time
(
	In num Int,
    Out format_time_text Varchar(70)
)
Begin 
  Declare days int default 0;
  Declare hours int default 0;
  Declare minutes int default 0;
  Declare seconds int default 0;
  
  SET format_time_text = "";
  
  If num > 0 THEN
	SET days = FLOOR(num / (24 * 60 * 60));
	SET num = num - days * 24 * 60 * 60;
  END IF;
    
  If num > 0 THEN
	SET hours = FLOOR(num / (60 * 60));
	SET num = num - hours * 60 * 60;
  END IF;    
    
  If num > 0 THEN
	SET minutes = FLOOR(num / 60);
	SET num = num - minutes * 60;
  END IF;
     
  If num > 0 THEN 
	SET seconds = num;
  END IF;
  
  IF days > 0 THEN
	SET format_time_text = concat(format_time_text, concat(days, " days"), " ");
  END IF;
    
  IF hours > 0 THEN
	SET format_time_text = concat(format_time_text, concat(hours, " hours"), " ");
  END IF;
    
  IF minutes > 0 THEN
	SET format_time_text = concat(format_time_text, concat(minutes, " minutes"), " ");
  END IF;
    
  IF seconds > 0 THEN
	SET format_time_text = concat(format_time_text, concat(seconds, " seconds"), " ");
  END IF;
    
END\\
 
Call format_time(123456, @result);
Select @result;
 
 /*
2) Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 
*/

DROP FUNCTION IF EXISTS get_nums;
DELIMITER //
CREATE FUNCTION get_nums()
RETURNS VARCHAR(50) DETERMINISTIC 
BEGIN

  DECLARE res VARCHAR(50) DEFAULT "";
  DECLARE min_value INT DEFAULT 1;
  DECLARE max_value INT DEFAULT 10;
  DECLARE n INT DEFAULT 0;
  
  SET n = IF(min_value % 2 = 0, min_value, min_value + 1);
  IF n <= max_value THEN 
	REPEAT
	  IF LENGTH(res) > 0 THEN
		SET res = CONCAT(res, ",");
		  END IF;
		  SET res = CONCAT(res, n);
		  SET n = n + 2;
		  UNTIL n > max_value
		END REPEAT;
	  END IF;
	RETURN res;
END//

SELECT get_nums();