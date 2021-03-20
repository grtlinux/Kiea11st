package com.skplanet.sascm._apagent.apagent;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.sql.DataSource;

public class BeanCampaign {

	private StringBuilder sb;
	private StringBuilder sb1;
	private StringBuilder sb2;
	private StringBuilder sb3;
	// private StringBuilder sb4;
	private String campaignId;
	private String M1_00;
	private String M1_01;
	private String M1_02;
	private String M1_03;
	private String M1_04;
	private String M1_05;
	private String M1_06;
	private String M1_07;
	private String M1_08;
	private String M1_09;
	private String M1_10;
	private String M1_11;
	private String M1_12;
	private String M1_13;
	private String M1_14;
	private String M1_15;
	private String M1_16;
	private String M1_17;
	private String M1_18;
	private String M1_19;
	private String M1_20;

	private String instanceId;
	private String tempYn;
	private String agentResultCode;

	public BeanCampaign() {

		ResourceBundle rb = ResourceBundle.getBundle("apagent.sqls");
		sb = new StringBuilder(rb.getString("detailCP_CMPGN_REQ"));
		sb1 = new StringBuilder(rb.getString("insertCP_CMPGN_REQ"));
		sb2 = new StringBuilder(rb.getString("insertCP_CMPGN_REQ_TARGET_GRP"));
		sb3 = new StringBuilder(rb.getString("insertCP_CMPGN_REQ_TARGET_CHNL"));
		// sb4 = new StringBuilder(rb.getString("insertCP_CMPGN_APPRVL"));
	}

	public void saveCampaignInfo(String campaignId) {
		String command = "APPROVE_CAMPAIGN.bat " + campaignId;
		System.out.println("SAVE CAMPAIGN INFORMATION :::" + command);
		try {
			Process p = Runtime.getRuntime().exec(command);
			p.waitFor();
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("SAVE CAMPAIGN INFORMATION ERROR (IOException) :::" + e.getMessage());
		} catch (InterruptedException e) {
			e.printStackTrace();
			System.out.println("SAVE CAMPAIGN INFORMATION ERROR (InterruptedException) :::" + e.getMessage());
		}
	}

	public void saveCampaignInfoOld(String campaignId) {
		this.campaignId = campaignId;
		try {
			InitialContext ctx = new InitialContext();
			DataSource pool = (DataSource) ctx.lookup("java:comp/env/jdbc/Teradata");
			if (pool == null)
				throw new ServletException("Unknown DataSource 'jdbc/Teradata'");
			Connection conn = pool.getConnection();
			Statement stmt = conn.createStatement();
			System.out.println("===========0 >>>" + campaignId + ":::" + instanceId);
			System.out.println("===========1 >>>"
					+ new String(sb1.toString().getBytes("8859_1"), "UTF-8").replaceAll("VAR", campaignId));
			System.out.println("===========2 >>>"
					+ new String(sb2.toString().getBytes("8859_1"), "UTF-8").replaceAll("VAR", campaignId));
			System.out.println("===========3 >>>"
					+ new String(sb3.toString().getBytes("8859_1"), "UTF-8").replaceAll("VAR", campaignId));
			// System.out.println("===========3 >>>" + sb4.toString().replaceAll("VAR1",
			// campaignId).replaceAll("VAR2", instanceId));

			stmt.executeUpdate(new String(sb1.toString().getBytes("8859_1"), "UTF-8").replaceAll("VAR", campaignId));
			stmt.executeUpdate(new String(sb2.toString().getBytes("8859_1"), "UTF-8").replaceAll("VAR", campaignId));
			stmt.executeUpdate(new String(sb3.toString().getBytes("8859_1"), "UTF-8").replaceAll("VAR", campaignId));
			// stmt.executeUpdate(sb4.toString().replaceAll("VAR1",
			// campaignId).replaceAll("VAR2", instanceId));

			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("[SQLException]" + e.getMessage());
		} catch (NamingException e) {
			e.printStackTrace();
			System.out.println("[NamingException]" + e.getMessage());
		} catch (ServletException e) {
			e.printStackTrace();
			System.out.println("[ServletException]" + e.getMessage());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			System.out.println("[UnsupportedEncodingException]" + e.getMessage());
		}
	}

	public void setCampaignId(String campaignId) {
		this.campaignId = campaignId;
		try {
			InitialContext ctx = new InitialContext();
			DataSource pool = (DataSource) ctx.lookup("java:comp/env/jdbc/Teradata");
			if (pool == null)
				throw new ServletException("Unknown DataSource 'jdbc/Teradata'");
			Connection conn = pool.getConnection();

			Statement stmt = conn.createStatement();
			System.out.println("==========Z0 >>>" + campaignId + ":::" + instanceId);
			System.out.println("==========Z1 >>>"
					+ new String(sb.toString().getBytes("8859_1"), "UTF-8").replaceAll("VAR", campaignId));
			ResultSet rs = stmt
					.executeQuery(new String(sb.toString().getBytes("8859_1"), "UTF-8").replaceAll("VAR", campaignId));
			if (rs.next()) {
				M1_00 = rs.getString("M1_00").replaceAll("\n", "<br/>").trim();
				M1_02 = rs.getString("M1_02").replaceAll("\n", "<br/>").trim();
				M1_03 = rs.getString("M1_03").replaceAll("\n", "<br/>").trim();
				M1_04 = rs.getString("M1_04").replaceAll("\n", "<br/>").trim();
				M1_05 = rs.getString("M1_05").replaceAll("\n", "<br/>").trim();
				M1_06 = rs.getString("M1_06").replaceAll("\n", "<br/>").trim();
				M1_07 = rs.getString("M1_07").replaceAll("\n", "<br/>").trim();
				M1_08 = rs.getString("M1_08").replaceAll("\n", "<br/>").trim();
				M1_09 = rs.getString("M1_09").replaceAll("\n", "<br/>").trim();
				M1_10 = rs.getString("M1_10").replaceAll("\n", "<br/>").trim();
				M1_11 = rs.getString("M1_11").replaceAll("\n", "<br/>").trim();
				M1_12 = rs.getString("M1_12").replaceAll("\n", "<br/>").trim();
				M1_13 = rs.getString("M1_13").replaceAll("\n", "<br/>").trim();
				M1_14 = rs.getString("M1_14").replaceAll("\n", "<br/>").trim();
				M1_15 = rs.getString("M1_15").replaceAll("\n", "<br/>").trim();
				M1_16 = rs.getString("M1_16").replaceAll("\n", "<br/>").trim();
				M1_17 = rs.getString("M1_17").replaceAll("\n", "<br/>").trim();
				M1_18 = rs.getString("M1_18").replaceAll("\n", "<br/>").trim();
				M1_19 = rs.getString("M1_19").replaceAll("\n", "<br/>").trim();
				M1_20 = rs.getString("M1_20").replaceAll("\n", "<br/>").trim();
			} else {
				System.out.println("No campaign is found.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("[SQLException]" + e.getMessage());
		} catch (NamingException e) {
			e.printStackTrace();
			System.out.println("[NamingException]" + e.getMessage());
		} catch (ServletException e) {
			e.printStackTrace();
			System.out.println("[ServletException]" + e.getMessage());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			System.out.println("[UnsupportedEncodingException]" + e.getMessage());
		}
	}

	public String getM1_00() {
		return M1_00;
	}

	public void setM1_00(String m1_00) {
		M1_00 = m1_00;
	}

	public String getM1_01() {
		return M1_01;
	}

	public void setM1_01(String m1_01) {
		M1_01 = m1_01;
	}

	public String getM1_02() {
		return M1_02;
	}

	public void setM1_02(String m1_02) {
		M1_02 = m1_02;
	}

	public String getM1_03() {
		return M1_03;
	}

	public void setM1_03(String m1_03) {
		M1_03 = m1_03;
	}

	public String getM1_04() {
		return M1_04;
	}

	public void setM1_04(String m1_04) {
		M1_04 = m1_04;
	}

	public String getM1_05() {
		return M1_05;
	}

	public void setM1_05(String m1_05) {
		M1_05 = m1_05;
	}

	public String getM1_06() {
		return M1_06;
	}

	public void setM1_06(String m1_06) {
		M1_06 = m1_06;
	}

	public String getM1_07() {
		return M1_07;
	}

	public void setM1_07(String m1_07) {
		M1_07 = m1_07;
	}

	public String getM1_08() {
		return M1_08;
	}

	public void setM1_08(String m1_08) {
		M1_08 = m1_08;
	}

	public String getM1_09() {
		return M1_09;
	}

	public void setM1_09(String m1_09) {
		M1_09 = m1_09;
	}

	public String getM1_10() {
		return M1_10;
	}

	public void setM1_10(String m1_10) {
		M1_10 = m1_10;
	}

	public String getM1_11() {
		return M1_11;
	}

	public void setM1_11(String m1_11) {
		M1_11 = m1_11;
	}

	public String getM1_12() {
		return M1_12;
	}

	public void setM1_12(String m1_12) {
		M1_12 = m1_12;
	}

	public String getM1_13() {
		return M1_13;
	}

	public void setM1_13(String m1_13) {
		M1_13 = m1_13;
	}

	public String getM1_14() {
		return M1_14;
	}

	public void setM1_14(String m1_14) {
		M1_14 = m1_14;
	}

	public String getM1_15() {
		return M1_15;
	}

	public void setM1_15(String m1_15) {
		M1_15 = m1_15;
	}

	public String getM1_16() {
		return M1_16;
	}

	public void setM1_16(String m1_16) {
		M1_16 = m1_16;
	}

	public String getM1_17() {
		return M1_17;
	}

	public void setM1_17(String m1_17) {
		M1_17 = m1_17;
	}

	public String getM1_18() {
		return M1_18;
	}

	public void setM1_18(String m1_18) {
		M1_18 = m1_18;
	}

	public String getM1_19() {
		return M1_19;
	}

	public void setM1_19(String m1_19) {
		M1_19 = m1_19;
	}

	public String getM1_20() {
		return M1_20;
	}

	public void setM1_20(String m1_20) {
		M1_20 = m1_20;
	}

	public String getCampaignId() {
		return campaignId;
	}

	public String getInstanceId() {
		return instanceId;
	}

	public void setInstanceId(String instanceId) {
		this.instanceId = instanceId;
	}

	public String getTempYn() {
		return tempYn;
	}

	public void setTempYn(String tempYn) {
		this.tempYn = tempYn;
	}

	public String getAgentResultCode() {
		return agentResultCode;
	}

	public void setAgentResultCode(String agentResultCode) {
		this.agentResultCode = agentResultCode;
	}
}
