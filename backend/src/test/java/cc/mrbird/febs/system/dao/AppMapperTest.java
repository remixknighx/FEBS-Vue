package cc.mrbird.febs.system.dao;


import cc.mrbird.febs.system.domain.App;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

/**
 * @author wangjf
 * @date 2020/2/1 0001.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class AppMapperTest {

    @Autowired
    private AppMapper appMapper;

    @Test
    public void select(){
        App systemBO = new App();
        systemBO.setAppName("testApp");
        systemBO.setStatus(1);
        systemBO.setCreateTime(new Date());
        systemBO.setCreateUser("wangjianfeng");
        systemBO.setModifyTime(new Date());
        systemBO.setModifyUser("wangjianfeg");
        System.out.println(appMapper.insert(systemBO));
    }

    @Test
    public void deleteApp(){
        appMapper.deleteApp(1L);
    }

}
