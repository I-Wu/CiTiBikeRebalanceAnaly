-- 2015 Oct.
SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2015-10-01 00:00:00') AND unix_timestamp('2015-10-31 23:59:59')
AND cast(tripduration as int) < 900;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2015-10-01 00:00:00') AND unix_timestamp('2015-10-31 23:59:59')
AND cast(tripduration as int) BETWEEN 900 AND 1800;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2015-10-01 00:00:00') AND unix_timestamp('2015-10-31 23:59:59')
AND cast(tripduration as int) BETWEEN 1800 AND 2700;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2015-10-01 00:00:00') AND unix_timestamp('2015-10-31 23:59:59')
AND cast(tripduration as int) > 2700;

--2015 Nov.
SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2015-11-01 00:00:00') AND unix_timestamp('2015-11-30 23:59:59')
AND cast(tripduration as int) < 900;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2015-11-01 00:00:00') AND unix_timestamp('2015-11-30 23:59:59')
AND cast(tripduration as int) BETWEEN 900 AND 1800;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2015-11-01 00:00:00') AND unix_timestamp('2015-11-30 23:59:59')
AND cast(tripduration as int) BETWEEN 1800 AND 2700;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2015-11-01 00:00:00') AND unix_timestamp('2015-11-30 23:59:59')
AND cast(tripduration as int) > 2700;

-- 2015 Dec.
SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2015-12-01 00:00:00') AND unix_timestamp('2015-12-31 23:59:59')
AND cast(tripduration as int) < 900;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2015-12-01 00:00:00') AND unix_timestamp('2015-12-31 23:59:59')
AND cast(tripduration as int) BETWEEN 900 AND 1800;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2015-12-01 00:00:00') AND unix_timestamp('2015-12-31 23:59:59')
AND cast(tripduration as int) BETWEEN 1800 AND 2700;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2015-12-01 00:00:00') AND unix_timestamp('2015-12-31 23:59:59')
AND cast(tripduration as int) > 2700;

-- 2016 Jan.
SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-01-01 00:00:00') AND unix_timestamp('2016-01-31 23:59:59')
AND cast(tripduration as int) < 900;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-01-01 00:00:00') AND unix_timestamp('2016-01-31 23:59:59')
AND cast(tripduration as int) BETWEEN 900 AND 1800;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-01-01 00:00:00') AND unix_timestamp('2016-01-31 23:59:59')
AND cast(tripduration as int) BETWEEN 1800 AND 2700;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-01-01 00:00:00') AND unix_timestamp('2016-01-31 23:59:59')
AND cast(tripduration as int) > 2700;

-- 2016 Feb.
SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-02-01 00:00:00') AND unix_timestamp('2016-02-28 23:59:59')
AND cast(tripduration as int) < 900;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-02-01 00:00:00') AND unix_timestamp('2016-02-28 23:59:59')
AND cast(tripduration as int) BETWEEN 900 AND 1800;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-02-01 00:00:00') AND unix_timestamp('2016-02-28 23:59:59')
AND cast(tripduration as int) BETWEEN 1800 AND 2700;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-02-01 00:00:00') AND unix_timestamp('2016-02-28 23:59:59')
AND cast(tripduration as int) > 2700;

-- 2016 Mar.
SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-03-01 00:00:00') AND unix_timestamp('2016-03-31 23:59:59')
AND cast(tripduration as int) < 900;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-03-01 00:00:00') AND unix_timestamp('2016-03-31 23:59:59')
AND cast(tripduration as int) BETWEEN 900 AND 1800;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-03-01 00:00:00') AND unix_timestamp('2016-03-31 23:59:59')
AND cast(tripduration as int) BETWEEN 1800 AND 2700;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-03-01 00:00:00') AND unix_timestamp('2016-03-31 23:59:59')
AND cast(tripduration as int) > 2700;

--2016 Apr.
SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-04-01 00:00:00') AND unix_timestamp('2016-04-30 23:59:59')
AND cast(tripduration as int) < 900;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-04-01 00:00:00') AND unix_timestamp('2016-04-30 23:59:59')
AND cast(tripduration as int) BETWEEN 900 AND 1800;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-04-01 00:00:00') AND unix_timestamp('2016-04-30 23:59:59')
AND cast(tripduration as int) BETWEEN 1800 AND 2700;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-04-01 00:00:00') AND unix_timestamp('2016-04-30 23:59:59')
AND cast(tripduration as int) > 2700;

-- 2016 May.
SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-05-01 00:00:00') AND unix_timestamp('2016-05-31 23:59:59')
AND cast(tripduration as int) < 900;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-05-01 00:00:00') AND unix_timestamp('2016-05-31 23:59:59')
AND cast(tripduration as int) BETWEEN 900 AND 1800;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-05-01 00:00:00') AND unix_timestamp('2016-05-31 23:59:59')
AND cast(tripduration as int) BETWEEN 1800 AND 2700;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-05-01 00:00:00') AND unix_timestamp('2016-05-31 23:59:59')
AND cast(tripduration as int) > 2700;

--2016 Jun.
SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-06-01 00:00:00') AND unix_timestamp('2016-06-30 23:59:59')
AND cast(tripduration as int) < 900;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-06-01 00:00:00') AND unix_timestamp('2016-06-30 23:59:59')
AND cast(tripduration as int) BETWEEN 900 AND 1800;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-06-01 00:00:00') AND unix_timestamp('2016-06-30 23:59:59')
AND cast(tripduration as int) BETWEEN 1800 AND 2700;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-06-01 00:00:00') AND unix_timestamp('2016-06-30 23:59:59')
AND cast(tripduration as int) > 2700;

-- 2016 Jul.
SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-07-01 00:00:00') AND unix_timestamp('2016-07-31 23:59:59')
AND cast(tripduration as int) < 900;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-07-01 00:00:00') AND unix_timestamp('2016-07-31 23:59:59')
AND cast(tripduration as int) BETWEEN 900 AND 1800;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-07-01 00:00:00') AND unix_timestamp('2016-07-31 23:59:59')
AND cast(tripduration as int) BETWEEN 1800 AND 2700;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-07-01 00:00:00') AND unix_timestamp('2016-07-31 23:59:59')
AND cast(tripduration as int) > 2700;

-- 2016 Aug.
SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-08-01 00:00:00') AND unix_timestamp('2016-08-31 23:59:59')
AND cast(tripduration as int) < 900;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-08-01 00:00:00') AND unix_timestamp('2016-08-31 23:59:59')
AND cast(tripduration as int) BETWEEN 900 AND 1800;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-08-01 00:00:00') AND unix_timestamp('2016-08-31 23:59:59')
AND cast(tripduration as int) BETWEEN 1800 AND 2700;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-08-01 00:00:00') AND unix_timestamp('2016-08-31 23:59:59')
AND cast(tripduration as int) > 2700;

--2016 Sep.
SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-09-01 00:00:00') AND unix_timestamp('2016-09-30 23:59:59')
AND cast(tripduration as int) < 900;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-09-01 00:00:00') AND unix_timestamp('2016-09-30 23:59:59')
AND cast(tripduration as int) BETWEEN 900 AND 1800;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-09-01 00:00:00') AND unix_timestamp('2016-09-30 23:59:59')
AND cast(tripduration as int) BETWEEN 1800 AND 2700;

SELECT count(*) FROM Trip1015_0916
WHERE unix_timestamp(starttime, 'MM-dd-yyyy HH:mm:ss') BETWEEN unix_timestamp('2016-09-01 00:00:00') AND unix_timestamp('2016-09-30 23:59:59')
AND cast(tripduration as int) > 2700;


