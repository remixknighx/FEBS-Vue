package cc.mrbird.febs.system.controller;

import cc.mrbird.febs.common.annotation.Log;
import cc.mrbird.febs.common.controller.BaseController;
import cc.mrbird.febs.common.domain.QueryRequest;
import cc.mrbird.febs.common.exception.FebsException;
import cc.mrbird.febs.system.dao.AppMapper;
import cc.mrbird.febs.system.domain.App;
import cc.mrbird.febs.system.service.AppService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

/**
 * @author wangjf
 * @date 2020/2/1 0001.
 */
@Slf4j
@Validated
@RestController
@RequestMapping("app")
public class AppController extends BaseController {

    @Autowired
    private AppService appService;
    @Autowired
    private AppMapper appMapper;

    private String message;

    @GetMapping("list")
    public Map<String, Object> appList(QueryRequest queryRequest, App app) {
        return getDataTable(this.appService.findApps(queryRequest, app));
    }

    @Log("新增应用")
    @PostMapping
    public void addApp(App app) throws FebsException {
        try {
            app.setCreateTime(new Date());
            appMapper.insert(app);
        } catch (Exception e) {
            message = "新增应用失败";
            log.error(message, e);
            throw new FebsException(message);
        }
    }

    @Log("编辑应用")
    @PutMapping
    public void editApp(App app) throws FebsException {
        try {
            app.setModifyTime(new Date());
            appMapper.updateById(app);
        } catch (Exception e) {
            message = "编辑应用失败";
            log.error(message, e);
            throw new FebsException(message);
        }
    }

    @Log("删除应用")
    @DeleteMapping("/{appIds}")
    public void deleteApp(@PathVariable String appIds) throws FebsException {
        try {
            Arrays.asList(appIds.split(",")).stream().map(appId -> Long.valueOf(appId))
                    .forEach(appId -> appMapper.deleteApp(appId));
        } catch (Exception e) {
            message = "删除应用失败";
            log.error(message + " id:" + appIds, e);
            throw new FebsException(message);
        }
    }

    @GetMapping("/{appId}")
    public Map<String, Object> menuList(@PathVariable(value = "appId")Long appId) {
        return appService.findMenusByAppId(appId);
    }

}
