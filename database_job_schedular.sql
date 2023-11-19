BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB
    (
       job_name        => 'BOTTOMERP.PROD_DB_DATAS_JOB'
      ,start_date      => TO_TIMESTAMP_TZ('2020/01/01 17:38:00.000000 +06:00','yyyy/mm/dd hh24:mi:ss.ff tzr')
      ,repeat_interval => 'FREQ=MINUTELY;INTERVAL=1'
      ,end_date        => NULL
      ,job_class       => 'DEFAULT_JOB_CLASS'
      ,job_type        => 'PLSQL_BLOCK'
      ,job_action      => 'DECLARE 
                           P_YEAR         DATE := SYSDATE;
                           OUT_ERROR_CODE VARCHAR2(300);
                           BEGIN
                                  BOTTOMERP.PR_DB_CONTENT_UPDATE(P_YEAR,OUT_ERROR_CODE);
                           END;'
      ,comments        => NULL
    );
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'BOTTOMERP.PROD_DB_DATAS_JOB'
     ,attribute => 'RESTARTABLE'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'BOTTOMERP.PROD_DB_DATAS_JOB'
     ,attribute => 'LOGGING_LEVEL'
     ,value     => SYS.DBMS_SCHEDULER.LOGGING_RUNS);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'BOTTOMERP.PROD_DB_DATAS_JOB'
     ,attribute => 'MAX_FAILURES');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'BOTTOMERP.PROD_DB_DATAS_JOB'
     ,attribute => 'MAX_RUNS');
  BEGIN
    SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
      ( name      => 'BOTTOMERP.PROD_DB_DATAS_JOB'
       ,attribute => 'STOP_ON_WINDOW_CLOSE'
       ,value     => FALSE);
  EXCEPTION
    -- could fail if program is of type EXECUTABLE...
    WHEN OTHERS THEN
      NULL;
  END;
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'BOTTOMERP.PROD_DB_DATAS_JOB'
     ,attribute => 'JOB_PRIORITY'
     ,value     => 3);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'BOTTOMERP.PROD_DB_DATAS_JOB'
     ,attribute => 'SCHEDULE_LIMIT'
     ,value     => '+000 00:02:00');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'BOTTOMERP.PROD_DB_DATAS_JOB'
     ,attribute => 'AUTO_DROP'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'BOTTOMERP.PROD_DB_DATAS_JOB'
     ,attribute => 'RAISE_EVENTS'
     ,value     => SYS.DBMS_SCHEDULER.JOB_STARTED);
END;
/