package cc.mrbird.febs.system.service.impl;

import cc.mrbird.febs.common.domain.QueryRequest;
import cc.mrbird.febs.common.utils.SortUtil;
import cc.mrbird.febs.system.dao.AppMapper;
import cc.mrbird.febs.system.domain.App;
import cc.mrbird.febs.system.service.AppService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


/**
 * @author wangjf
 * @date 2020/2/1 0001.
 */
@Slf4j
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class AppServiceImpl  extends ServiceImpl<AppMapper, App> implements AppService{

    @Override
    public IPage<App> findApps(QueryRequest request, App app) {
        try {
            LambdaQueryWrapper<App> queryWrapper = new LambdaQueryWrapper<>();

            if (StringUtils.isNotBlank(app.getAppName())) {
                queryWrapper.eq(App::getAppName, app.getAppName());
            }

            Page<App> page = new Page<>();
            SortUtil.handlePageSort(request, page, true);
            return this.page(page, queryWrapper);
        } catch (Exception e) {
            log.error("查询应用信息失败", e);
            return null;
        }
    }

}
