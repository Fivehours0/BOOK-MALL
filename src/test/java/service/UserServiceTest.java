package service;

import domain.User;
import org.junit.Test;
import service.impl.UserServiceImpl;

import static org.junit.Assert.*;

public class UserServiceTest {

    UserService userService = new UserServiceImpl();

    @Test
    public void registUser() {
        userService.registUser(new User(null, "tt1", "tt1", "asdasd@qq.com"));
    }

    @Test
    public void login() {
        User user = userService.login(new User(null, "tt1", "tt1", null));
        if (user == null) {
            System.out.println("登录失败");
        } else {
            System.out.println(user.toString());
        }
    }

    @Test
    public void existsUsername() {
        System.out.println(userService.existsUsername("tt1"));
    }
}