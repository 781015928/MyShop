package com.czg;

import com.alibaba.fastjson.JSON;
import com.czg.myshop.common.utils.date.DateUtils;
import com.czg.myshop.dao.ProductMapper;
import com.czg.myshop.dao.RegionMapper;
import com.czg.myshop.model.entiy.Product;
import com.czg.myshop.model.entiy.Region;
import com.czg.myshop.model.page.Page;
import com.czg.myshop.model.page.PageBean;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.EncodedResource;
import org.springframework.util.FileCopyUtils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.LineNumberReader;
import java.util.List;

public class UserMapperTest {

    private ApplicationContext applicationContext;

    //在setUp这个方法得到spring容器
    @Before
    public void setUp() throws Exception {
        applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext-dao.xml");
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

    @Test
    public void cityJsonTest() throws Exception {
        RegionMapper regionMapper = (RegionMapper) applicationContext.getBean("regionMapper");
        Resource resource = applicationContext.getResource("city.json");
        // ① 指定文件资源对应的编码格式（UTF-8）
        EncodedResource encRes = new EncodedResource(resource, "UTF-8");
        // ② 这样才能正确读取文件的内容，而不会出现乱码
        String content = FileCopyUtils.copyToString(encRes.getReader());
        CityDataBean cityDataBean = JSON.parseObject(content, CityDataBean.class);
        List<CityDataBean.ProvinceBean> provinces = cityDataBean.getProvince();
        Region RegionR = new Region();
        RegionR.setCreatetime(DateUtils.currentTime());
        RegionR.setUpdatetime(DateUtils.currentTime());
        RegionR.setLevel(0);
        RegionR.setParentId(0);
        RegionR.setName("中国");
        RegionR.setPostalcode("000000");
        RegionR.setDeletestate(0);
        regionMapper.insert(RegionR);


        for (CityDataBean.ProvinceBean province : provinces) {
            Region regionP = new Region();
            String Rootzipcode = province.getCity().get(0).getDistrict().get(0).getZipcode();
            regionP.setCreatetime(DateUtils.currentTime());
            regionP.setUpdatetime(DateUtils.currentTime());
            regionP.setLevel(1);
            regionP.setParentId(RegionR.getId());
            regionP.setName(province.getName());
            regionP.setDeletestate(0);
            regionP.setPostalcode(Rootzipcode);
            regionMapper.insert(regionP);

            for (CityDataBean.ProvinceBean.CityBean cityBean : province.getCity()) {
                Region regionC = new Region();
                regionC.setCreatetime(DateUtils.currentTime());
                regionC.setUpdatetime(DateUtils.currentTime());
                regionC.setLevel(2);
                regionC.setParentId(regionP.getId());
                regionC.setName(cityBean.getName());
                regionC.setDeletestate(0);

                regionC.setPostalcode(Rootzipcode);

                regionMapper.insert(regionC);
                if (cityBean.getDistrict()!=null){
                    for (CityDataBean.ProvinceBean.CityBean.DistrictBean districtBean : cityBean.getDistrict()) {
                        Region regionD = new Region();
                        regionD.setCreatetime(DateUtils.currentTime());
                        regionD.setUpdatetime(DateUtils.currentTime());
                        regionD.setLevel(3);
                        regionD.setParentId(regionC.getId());
                        regionD.setName(districtBean.getName());
                        regionD.setDeletestate(0);
                        regionD.setPostalcode(districtBean.getZipcode());
                        regionMapper.insert(regionD);

                    }
                }




            }



        }


    }

    private String jsonRead(File file) {
        StringBuffer sb = new StringBuffer();
        try {
            FileReader fileReader = new FileReader(file);
            BufferedReader bufReader = new BufferedReader(fileReader);

            LineNumberReader reader = new LineNumberReader(bufReader);

            String line;
            try {
                while ((line = reader.readLine()) != null) {
                    sb.append(line).append(System.getProperty("line.separator"));
                }
                reader.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }


            String content = sb.toString();

            return content;
        } catch (FileNotFoundException e1) {
            e1.printStackTrace();
            return null;
        }
    }
}
