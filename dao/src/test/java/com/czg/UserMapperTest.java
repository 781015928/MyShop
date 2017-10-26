package com.czg;

import com.czg.myshop.common.utils.date.DateUtils;
import com.czg.myshop.common.utils.security.MD5;
import com.czg.myshop.dao.ProductMapper;
import com.czg.myshop.dao.UserMapper;
import com.czg.myshop.model.entiy.Product;
import com.czg.myshop.model.entiy.User;
import com.czg.myshop.model.page.Page;
import com.czg.myshop.model.page.PageBean;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class UserMapperTest {

    private ApplicationContext applicationContext;

    //在setUp这个方法得到spring容器
    @Before
    public void setUp() throws Exception {
        applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext-dao.xml");
    }

    @Test
    public void testFindUserById() throws Exception {

        UserMapper userDao = (UserMapper) applicationContext.getBean("productMapper");

        //调用userDao的方法
        User user = userDao.selectByPrimaryKey(1);
        user = new User();
        user.setAccount("222222");
        user.setPassword(MD5.md5_salt("1111"));
        user.setEmail("111");
        user.setPhone("111");
        user.setCreatetime(DateUtils.currentTime());
        user.setUpdatetime(DateUtils.currentTime());
        userDao.insertSelective(user);
        System.out.println(user);

    }
    @Test
    public void testPage() throws Exception {
        ProductMapper productMapper = (ProductMapper) applicationContext.getBean("productMapper");
        PageHelper.startPage(2,10);
        List<Product> products = productMapper.selectByExample(null);
        PageInfo pageResult = new PageInfo(products);
        System.out.println(pageResult);

        Page.startPage(4,5);
        List<Product> productsa = productMapper.selectByExample(null);
        PageBean<Product> page = Page.getPage(productsa);
        System.out.println(page);
    }
}
