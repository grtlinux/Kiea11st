/*
 * Copyright 2001-2007 by HANWHA S&C Corp., 
 * All rights reserved.
 * 
 * This software is the confidential and proprietary information
 * of HANWHA S&C Corp. ("Confidential Information").  You
 * shall not disclose such Confidential Information and shall use
 * it only in accordance with the terms of the license agreement
 * you entered into with HANWHA S&C Corp.
 */
/** 
 * @fileoverview 환경설정
 *
 * @author 박성수 <a href="mailto:ghbpark@hanwha.co.kr">ghbpark@hanwha.co.kr</a>
 * @version 5.0 
 */
/**
 * 전자결재 에이전트 버전
 */
var agentVer = "5.0";

/**
 * 전자결재 에이전트 종류
 */
var agentType = "JAVA";

/**
 * 전자결재 에이전트 설치 경로
 */
var agentRoot = "/apagent";

/**
 * 그룹웨어 전자결재 서버 Host
 */
/**
 * 그룹웨어 전자결재 서버 Port
 */
//var approvalHost = '172.16.223.245';
//var approvalPort = "80";

var approvalHost = 'hanwha.eagleoffice.co.kr';
var approvalPort = "80";


//var approvalHost = '172.16.223.126';
//var approvalPort = "30091";

//var approvalHost = '172.16.223.127';
//var approvalPort = "30091";

//var approvalHost = '127.0.0.1';
//var approvalPort = "8080";

/**
 * agent 사용 회사 설정
 */
var agentCompanyId = "405";
var agentCompanyAlias = "hgc";

/**
 * 클라이언트 구분 (기본 PRD)
 */
var client = "PRD";
//var client = "DEV";

/**
 * 클라이언트 debug 구분 (기본 false)
 */
var debugFlag = false;

/**
 * 중복시 알람 여부
 */
var alarmYn = "Y";

/**
 * 중복시 뷰 페이지 전환 여부
 */
var viewYn = "Y";

/**
 * 임시저장 사용여부
 */
var saveTempYn = "N";
