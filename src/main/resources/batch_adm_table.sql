CREATE TABLE `tn_batch` (
  `BATCH_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  `BATCH_NM` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_DC` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `JOB_DLBRT_NO` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_AT` char(1) COLLATE utf8_bin DEFAULT NULL,
  `ONLINE_EXECUT_AT` char(1) COLLATE utf8_bin DEFAULT NULL,
  `JOB_SE_CODE` char(6) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`BATCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin


CREATE TABLE `tn_batch_atch_file` (
  `BATCH_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  `ATCH_FILE_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  `BATCH_FILE_NM` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `WDTB_PATH` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `ATCH_SE_CODE` char(1) COLLATE utf8_bin DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`BATCH_ID`,`ATCH_FILE_ID`),
  CONSTRAINT `tn_batch_atch_file_ibfk_1` FOREIGN KEY (`BATCH_ID`) REFERENCES `tn_batch` (`BATCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin


CREATE TABLE `tn_batch_bean` (
  `BEAN_ID` varchar(255) COLLATE utf8_bin NOT NULL,
  `BATCH_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`BEAN_ID`,`BATCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin

CREATE TABLE `tn_batch_execut` (
  `BATCH_EXECUT_NO` varchar(20) COLLATE utf8_bin NOT NULL,
  `EXECUT_MTHD_CODE` char(2) COLLATE utf8_bin DEFAULT NULL,
  `EXECUT_TIME` varchar(14) COLLATE utf8_bin DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `JOB_INSTANCE_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  `JOB_EXECUTION_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`BATCH_EXECUT_NO`,`BATCH_ID`),
  KEY `BATCH_ID` (`BATCH_ID`),
  CONSTRAINT `tn_batch_execut_ibfk_1` FOREIGN KEY (`BATCH_ID`) REFERENCES `tn_batch` (`BATCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin

CREATE TABLE `tn_batch_execut_paramtr` (
  `BATCH_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  `PARAMTR_NM` varchar(255) COLLATE utf8_bin NOT NULL,
  `PARAMTR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_EXECUT_NO` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`BATCH_EXECUT_NO`,`BATCH_ID`,`PARAMTR_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin

CREATE TABLE `tn_batch_paramtr` (
  `BATCH_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  `PARAMTR_NM` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`BATCH_ID`,`PARAMTR_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin

CREATE TABLE `tn_data_load_shell_hist` (
  `WORK_DATE` varchar(8) COLLATE utf8_bin NOT NULL,
  `TABLE_NM` varchar(50) COLLATE utf8_bin NOT NULL,
  `FILE_NM` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `STATUS` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`WORK_DATE`,`TABLE_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin

CREATE TABLE `tn_file` (
  `ATCH_FILE_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  `CREAT_DT` datetime DEFAULT NULL,
  `USE_AT` char(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin

CREATE TABLE `tn_filedetail` (
  `ATCH_FILE_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  `FILE_SN` decimal(10,0) NOT NULL,
  `FILE_SIZE` decimal(8,0) DEFAULT NULL,
  `FILE_CN` mediumtext COLLATE utf8_bin,
  `FILE_EXTSN` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ORIGNL_FILE_NM` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `STRE_FILE_NM` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FILE_STRE_COURS` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ATCH_FILE_ID`,`FILE_SN`),
  CONSTRAINT `tn_filedetail_ibfk_1` FOREIGN KEY (`ATCH_FILE_ID`) REFERENCES `tn_file` (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin

CREATE TABLE `tn_ftp_intrlck` (
  `FTP_INTRLCK_NO` varchar(20) COLLATE utf8_bin NOT NULL,
  `FTP_INTRLCK_NM` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `FTP_ADRES` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_WDTB_PATH` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `CFG_WDTB_PATH` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `PROCESS_SE_CODE` char(3) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`FTP_INTRLCK_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin

CREATE TABLE `tn_ntcn` (
  `NTCN_NO` varchar(20) COLLATE utf8_bin NOT NULL,
  `BATCH_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  `SCHDUL_NO` varchar(20) COLLATE utf8_bin NOT NULL,
  `NTCN_SJ` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `EVENT_CODE` char(2) COLLATE utf8_bin DEFAULT NULL,
  `MSSAGE_NM` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `MSSAGE_DC` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `REMARK` varchar(2500) COLLATE utf8_bin DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `NTCN_CODE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`NTCN_NO`,`BATCH_ID`,`SCHDUL_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin

CREATE TABLE `tn_ntcn_recptn` (
  `NTCN_NO` varchar(20) COLLATE utf8_bin NOT NULL,
  `RECPTN_USER_ID` char(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`NTCN_NO`,`RECPTN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin

CREATE TABLE `tn_rehndn` (
  `BATCH_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  `REHNDN_NO` varchar(20) COLLATE utf8_bin NOT NULL,
  `JOB_INSTANCE_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `JOB_EXECUTION_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `REHNDN_RESN` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `REHNDN_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`REHNDN_NO`,`BATCH_ID`),
  KEY `BATCH_ID` (`BATCH_ID`),
  CONSTRAINT `tn_rehndn_ibfk_1` FOREIGN KEY (`BATCH_ID`) REFERENCES `tn_batch` (`BATCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin

CREATE TABLE `tn_scdul_svr_info` (
  `SVR_NM` varchar(20) NOT NULL,
  `SVR_PATH` varchar(50) NOT NULL,
  `EXE_SVR_YN` varchar(1) NOT NULL,
  `REF_TEXT_1` varchar(50) DEFAULT NULL,
  `REF_TEXT_2` varchar(50) DEFAULT NULL,
  `REF_TEXT_3` varchar(50) DEFAULT NULL,
  `TRTR_ID` varchar(20) DEFAULT NULL,
  `TRT_DATE` datetime DEFAULT NULL,
  `SYS_CRET_DATE` datetime DEFAULT NULL,
  `SYS_CHG_DATE` datetime DEFAULT NULL,
  `SYS_SVC_NM` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SVR_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE `tn_schdul` (
  `SCHDUL_NO` varchar(20) COLLATE utf8_bin NOT NULL,
  `SCHDUL_NM` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `BATCH_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  `EXECUT_CYCLE` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `EXECUT_SCHDUL_DE` char(20) COLLATE utf8_bin DEFAULT NULL,
  `EXECUT_SCHDUL_HOUR` char(2) COLLATE utf8_bin DEFAULT NULL,
  `EXECUT_SCHDUL_MNT` char(2) COLLATE utf8_bin DEFAULT NULL,
  `EXECUT_SCHDUL_SECND` char(2) COLLATE utf8_bin DEFAULT NULL,
  `PARAMTR` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `PARAMTRIN` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARAMTROUT` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`SCHDUL_NO`,`BATCH_ID`),
  KEY `BATCH_ID` (`BATCH_ID`),
  CONSTRAINT `tn_schdul_ibfk_1` FOREIGN KEY (`BATCH_ID`) REFERENCES `tn_batch` (`BATCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin

CREATE TABLE `tn_schdul_paramtr` (
  `SCHDUL_NO` varchar(20) COLLATE utf8_bin NOT NULL,
  `BATCH_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  `PARAMTR_NM` varchar(255) COLLATE utf8_bin NOT NULL,
  `PARAMTR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`SCHDUL_NO`,`BATCH_ID`,`PARAMTR_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin

CREATE TABLE `tn_schdul_result` (
  `SCHDUL_NO` varchar(20) COLLATE utf8_bin NOT NULL,
  `SCHDUL_RESULT_NO` varchar(20) COLLATE utf8_bin NOT NULL,
  `JOB_EXECUTION_ID` char(18) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME` char(14) COLLATE utf8_bin DEFAULT NULL,
  `END_TIME` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_RESULT` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ERROR_CN` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `SERVER_NAME` varchar(15) COLLATE utf8_bin DEFAULT 'WAS1' COMMENT 'JOB실행서버',
  PRIMARY KEY (`SCHDUL_NO`,`SCHDUL_RESULT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin

CREATE TABLE `tn_schdul_target_info` (
  `SCHDUL_NO` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '스케쥴번호',
  `BATCH_ID` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '배치아이디',
  `SVR_NM` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '타겟서버명',
  `SYS_CRET_DATE` datetime DEFAULT NULL COMMENT '시스템생성일자',
  `SYS_CHG_DATE` datetime DEFAULT NULL COMMENT '시스템변경일자',
  `SYS_SVC_NM` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '시스템서비스명',
  PRIMARY KEY (`SCHDUL_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='배치스케쥴타겟서버정보'