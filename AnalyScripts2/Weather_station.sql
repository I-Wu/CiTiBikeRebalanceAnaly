CREATE TABLE tripwea10_v1 AS SELECT a.row_num, a.tripd, a.startt, a.stopt,
         b.newtime, b.wtype, b.temp
            FROM  triptable10_v2 a
            JOIN 201510_wea_v4 b
            WHERE b.newtime  >= a.startt
             AND  b.newtime  <= a.stopt;
