package com.skplanet.sascm.util;

public class ExceptionHandler {

    public static String getMessage(Exception e) {
        e.printStackTrace();
        StackTraceElement[] trace = e.getStackTrace();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < trace.length; i++) {
            sb.append(trace[i].toString() + "<br/>");
        }
        return sb.toString();
    }
    
}
