package com.studerw.activiti.document.dao;

import java.sql.Types;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.google.common.collect.ImmutableMap;
import com.studerw.activiti.document.TradeAlertRowMapper;
import com.studerw.activiti.model.TradeAlerts;
import com.studerw.activiti.web.PagingCriteria;

/**
 * Implementation of {@link BookReportDao} using Spring / JDBC
 *
 * @author William Studer
 */
@Repository
@Component("tradeAlertsDao")
public class JdbcTradeAlertsDao implements TradeAlertsDao {
    private static final Logger LOG = LoggerFactory.getLogger(JdbcTradeAlertsDao.class);
    protected DataSource ds;
    protected NamedParameterJdbcTemplate namedJdbcTemplate;

    public DataSource getDataSource() {
        return this.ds;
    }

    @Autowired
    @Qualifier("dataSource")
    public void setDataSource(DataSource datasource) {
        this.ds = datasource;
        this.namedJdbcTemplate = new NamedParameterJdbcTemplate(this.ds);
    }

    @Override
    public int getCount() {
        String sql = "SELECT count(*) FROM TRADE_ALERTS";
        @SuppressWarnings("unchecked")
        int count = this.namedJdbcTemplate.queryForObject(sql, Collections.EMPTY_MAP, Integer.class);
        LOG.debug("Got count: {} of trade alerts", count);
        return count;
    }

    @Override public List<TradeAlerts> readAll() {
        String sql = "SELECT * FROM TRADE_ALERTS ORDER BY AlertId ASC";
        List<TradeAlerts> reports = this.namedJdbcTemplate.query(sql, new TradeAlertRowMapper());
        LOG.debug("got all TRADE_ALERTS reports: {}", reports.size());
        return reports;
    }


    @Override public List<TradeAlerts> readPage(PagingCriteria criteria) {
        LOG.debug("reading page with criteria: {}", criteria);
        if (criteria == null || criteria.getLimit() == null || criteria.getStart() == null) {
            LOG.warn("criteria invalid - reading all instead of subset");
            return readAll();
        }
        String sql = "SELECT LIMIT :start :limit * FROM TRADE_ALERTS ORDER BY created_date ASC";
        BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(criteria);

        List<TradeAlerts> documents = this.namedJdbcTemplate.query(sql, source, new TradeAlertRowMapper());
        LOG.debug("{} reports returned using criteria: {}", documents.size(), criteria);

        return documents;

    }

    @Override public String create(TradeAlerts obj) {
        /*LOG.debug("Inserting Document into SQL backend: {}",obj);
        checkArgument(StringUtils.isBlank(obj.getId()), "Document id cannot be already set");

        String id = UUID.randomUUID().toString();
        obj.setId(id);
        String sql = "INSERT INTO TRADE_ALERTS (id, author, title, content, summary, group_id, doc_type, doc_state, created_date, book_author, book_title) " +
                "VALUES (:id, :author, :title, :content, :summary, :groupId, :docType, :docState, :createdDate, :bookAuthor, :bookTitle)";

        BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(obj);
        source.registerSqlType("docState", Types.VARCHAR);
        source.registerSqlType("docType", Types.VARCHAR);
        int results = this.namedJdbcTemplate.update(sql, source);
        LOG.debug("Got: {} results", results);
        obj.setId(id);
        return id;*/
    	return null;
    }

    @Override public void createWithId(TradeAlerts obj) {
        throw new UnsupportedOperationException("not supported");
    }

    @Override public void update(TradeAlerts obj) {
        String sql = "UPDATE TRADE_ALERTS SET processed=:processed WHERE AlertId=:AlertId";

        BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(obj);
        source.registerSqlType("docState", Types.VARCHAR);
        int results = this.namedJdbcTemplate.update(sql, source);
    }

    @Override public void delete(String id) {
        String sql = "DELETE FROM TRADE_ALERTS WHERE AlertId=:AlertId";
        Map<String, String> params = ImmutableMap.of("AlertId", id);
        int deleted = this.namedJdbcTemplate.update(sql, params);
        LOG.debug("Deleted: {} BookReports", deleted);
    }

    @Override public TradeAlerts read(String AlertId) {
        String sql = "SELECT * FROM TRADE_ALERTS where AlertId = :AlertId";
        Map<String, String> params = ImmutableMap.of("AlertId", AlertId);
        TradeAlerts tradeAlerts = this.namedJdbcTemplate.queryForObject(sql, params, new TradeAlertRowMapper());
        return tradeAlerts;
    }
}
