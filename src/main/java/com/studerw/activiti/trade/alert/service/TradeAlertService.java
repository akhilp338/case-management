package com.studerw.activiti.trade.alert.service;

import java.util.List;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studerw.activiti.alert.AlertService;
import com.studerw.activiti.document.dao.TradeAlertsDao;
import com.studerw.activiti.model.TradeAlerts;
import com.studerw.activiti.user.UserService;
import com.studerw.activiti.workflow.WorkflowService;

/**
 * @author William Studer
 *         Date: 5/18/14
 */
@Service("tradeAlertService")
public class TradeAlertService {
    private static final Logger LOG = LoggerFactory.getLogger(TradeAlertService.class);
    @Autowired protected IdentityService identityService;
    @Autowired protected RuntimeService runtimeService;
    @Autowired protected TaskService taskService;
    @Autowired protected UserService userService;
    @Autowired protected TradeAlertsDao tradeAlertsDao;
    @Autowired protected WorkflowService workflowService;
    @Autowired protected AlertService alertService;



	public List<TradeAlerts> findAlerts() {
           return  this.tradeAlertsDao.readAll();
	}
}
