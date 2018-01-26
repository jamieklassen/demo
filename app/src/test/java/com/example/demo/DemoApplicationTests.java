package com.example.demo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertEquals;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = {DemoApplication.class, H2JpaConfig.class})
@ActiveProfiles("test")
public class DemoApplicationTests {

    @Test
    public void contextLoads() {
    }

    @Test
    public void shouldFail() {
        assertEquals(1, 1);
    }

}
