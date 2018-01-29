package com.example.demo;

import org.junit.Test;

import static org.junit.Assert.*;

public class DemoControllerTest {

    @Test
    public void helloReturnsDefaultName() {
        DemoController controller = new DemoController();
        assertEquals("Hello World\n", controller.hello(null));
    }
}