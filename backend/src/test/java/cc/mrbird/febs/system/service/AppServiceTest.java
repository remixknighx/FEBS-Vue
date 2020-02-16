package cc.mrbird.febs.system.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

/**
 * @author wangjf
 * @date 2020/2/13 0013.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class AppServiceTest {

    @Autowired
    private AppService appService;

    @Test
    public void testFindAppById() throws Exception {
        appService.findAppById("abc");
    }


}
