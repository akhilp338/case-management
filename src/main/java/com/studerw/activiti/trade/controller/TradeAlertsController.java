package com.studerw.activiti.trade.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.studerw.activiti.model.TradeAlerts;
import com.studerw.activiti.trade.alert.service.TradeAlertService;
import com.studerw.activiti.web.BaseController;

/**
 * @author William Studer
 * Date: 5/18/14
 */
@Controller
public class TradeAlertsController extends BaseController {
    private static final Logger LOG = LoggerFactory.getLogger(TradeAlertsController.class);

    @Autowired protected TradeAlertService tradeAlertService;

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }

    @RequestMapping(value = "/alert-page.htm", method = RequestMethod.GET)
    public String index(ModelMap model, HttpServletRequest request) {
        List<TradeAlerts> tradeAlerts = this.tradeAlertService.findAlerts();
        model.addAttribute("tradeAlerts", tradeAlerts);
        return "alert-page";
    }
    
    @RequestMapping(value = "/alert-page-1.htm", method = RequestMethod.GET)
    public String index1(ModelMap model, HttpServletRequest request) {
        List<TradeAlerts> tradeAlerts = this.tradeAlertService.findAlerts();
        model.addAttribute("tradeAlerts", tradeAlerts);
        return "alert-page-1";
    }

    /*@RequestMapping(value = "/tasks", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Response<List<CandidateTask>>> getTasks(HttpServletRequest request) {
        String userName = currentUserName();
        LOG.debug("TaskController: tasks for user: " + userName);
        List<CandidateTask> tasks = tradeAlertService.findCandidateTasks(userName);
        LOG.debug("returning json response of: " + tasks.size() + " for user : " + userName);
        Response res = new Response(true, "tasks for user: " + userName, tasks);
        return new ResponseEntity<Response<List<CandidateTask>>>(res, HttpStatus.OK);
    }*/

    /*@RequestMapping(value = "/tasks/approve", method = RequestMethod.POST)
    public String approve(@Valid @ModelAttribute TaskApprovalForm approvalForm,
                          BindingResult result,
                          final RedirectAttributes redirectAttributes){
        LOG.debug("task approval: {}", approvalForm.toString());

        if (result.hasFieldErrors()) {
            return "tasks";
        }

        this.taskService.approveOrRejectDoc(approvalForm);

        redirectAttributes.addFlashAttribute("msg", "The task has been completed.");
        return "redirect:/tasks.htm";
    }

    @RequestMapping(value = "/tasks/collaborate", method = RequestMethod.POST)
    public String approve(@Valid @ModelAttribute TaskCollaborationForm collaborationForm,
                          BindingResult result,
                          final RedirectAttributes redirectAttributes){
        LOG.debug("task collaboration: 6{}", collaborationForm.toString());

        if (result.hasFieldErrors()) {
            return "tasks";
        }

        this.tradeAlertService.collaborateTask(collaborationForm.getTaskId(), collaborationForm.getComment());
        redirectAttributes.addFlashAttribute("msg", "The task has been completed.");
        return "redirect:/tasks.htm";
    }*/



}
