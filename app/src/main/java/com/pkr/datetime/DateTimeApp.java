package com.pkr.datetime;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateTimeApp {

    public static void main(String[] args) {
        String env = System.getProperty("env", "dev");

        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter =
                DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        System.out.println("=================================");
        System.out.println("PKR Date-Time Application");
        System.out.println("Environment : " + env);
        System.out.println("Current Time: " + now.format(formatter));
        System.out.println("=================================");
    }
}

