package com.studerw.activiti.model;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

/**
 * Priority might coorespond to bootstrap helper CSS classes:
 * 1 = primary
 * 2 = success
 * 3 = info
 * 4 = warning
 * 5 = danger
 * @author William Studer
 * Date: 5/20/14
 */
public class TradeAlerts implements Comparable<TradeAlerts>, Serializable {
    public final static int SUCCESS = 1;
    public final static int INFO = 2;
    public final static int WARNING = 3;
    public final static int DANGER = 4;

    @NotNull
    private Integer alertId;
    @NotNull
    private String securityClass;
    @NotNull
    private String deskId;
    @NotNull
    private String deskName;
    @NotNull
    private String alertTextId;
    @NotNull
    private String instrumentId;
    private String partyId;
    private String partyName;
    private Integer processed;
    
	public Integer getProcessed() {
		return processed;
	}
	public void setProcessed(Integer processed) {
		this.processed = processed;
	}
	public Integer getAlertId() {
		return alertId;
	}
	public void setAlertId(Integer alertId) {
		this.alertId = alertId;
	}
	public String getSecurityClass() {
		return securityClass;
	}
	public void setSecurityClass(String securityClass) {
		this.securityClass = securityClass;
	}
	public String getDeskId() {
		return deskId;
	}
	public void setDeskId(String deskId) {
		this.deskId = deskId;
	}
	public String getDeskName() {
		return deskName;
	}
	public void setDeskName(String deskName) {
		this.deskName = deskName;
	}
	public String getAlertTextId() {
		return alertTextId;
	}
	public void setAlertTextId(String alertTextId) {
		this.alertTextId = alertTextId;
	}
	public String getInstrumentId() {
		return instrumentId;
	}
	public void setInstrumentId(String instrumentId) {
		this.instrumentId = instrumentId;
	}
	public String getPartyName() {
		return partyName;
	}
	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}
	public String getPartyId() {
		return partyId;
	}
	public void setPartyId(String partyId) {
		this.partyId = partyId;
	}
	@Override
	public int compareTo(TradeAlerts o) {
		 return this.partyName.compareTo(o.partyName);// TODO Auto-generated method stub
	}

}

