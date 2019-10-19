CREATE TABLE scale_data (
   section NUMERIC NOT NULL,
   id1     NUMERIC NOT NULL,
   id2     NUMERIC NOT NULL,
   UNIQUE  (section, id1)
);

DECLARE @section INT
SET @section = 10

WHILE (@section >= 0) BEGIN

   WITH generate_series (n) AS (
      SELECT 1
      UNION ALL
      SELECT n + 1
        FROM generate_series
       WHERE N < 3000
   ), generate_series2 (n) AS (
      SELECT ROW_NUMBER() OVER(ORDER BY g1.n, g2.n)
        FROM generate_series g1
       CROSS JOIN generate_series g2
       WHERE g2.n <= @section
   )
   INSERT INTO scale_data
   SELECT @section, gen.*
        , CEILING(ABS(CAST(NEWID() AS BINARY(6)) %100))
     FROM generate_series2 gen
    WHERE gen.n <= @section * 3000
   OPTION(MAXRECURSION 32767);

   SET @section = @section -1
END;
GO
