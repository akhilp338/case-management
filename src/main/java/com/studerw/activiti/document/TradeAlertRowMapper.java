package com.studerw.activiti.document;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.RowMapper;

import com.studerw.activiti.model.TradeAlerts;

/**
 * @author William Studer
 */
public class TradeAlertRowMapper implements RowMapper<TradeAlerts> {

    @Override
    public TradeAlerts mapRow(final ResultSet rs, final int rowNum) throws SQLException {
        Integer alertId = Integer.parseInt(rs.getString("alertId").toString());
        String alertTextId = StringUtils.trim(rs.getString("alertTextId")).substring(0, 25);
        String deskId = StringUtils.trim(rs.getString("deskId"));
        String deskName = StringUtils.trim(rs.getString("deskName"));
        String instrumentId = StringUtils.trim(rs.getString("instrumentId"));
        String partyId = StringUtils.trim(rs.getString("partyId"));
        String partyName = StringUtils.trim(rs.getString("partyName"));
        Integer processed = Integer.parseInt(StringUtils.trim(rs.getString("processed")).toString());
        String securityClass = StringUtils.trim(rs.getString("securityClass"));
        TradeAlerts tradeAlerts = new TradeAlerts();
        tradeAlerts.setAlertId(alertId);
        tradeAlerts.setAlertTextId(alertTextId);
        tradeAlerts.setDeskId(deskId);
        tradeAlerts.setDeskName(deskName);
        tradeAlerts.setInstrumentId(instrumentId);
        tradeAlerts.setPartyId(partyId);
        tradeAlerts.setPartyName(partyName);
        tradeAlerts.setProcessed(processed);
        tradeAlerts.setSecurityClass(securityClass);
        return tradeAlerts;

    }
}

