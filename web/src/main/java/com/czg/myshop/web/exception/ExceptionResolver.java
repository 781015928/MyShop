package com.czg.myshop.web.exception;

import com.alibaba.fastjson.support.spring.FastJsonJsonView;
import com.czg.myshop.common.utils.valid.TextUtils;
import com.czg.myshop.model.exception.BusinessException;
import com.czg.myshop.model.exception.FailException;
import com.czg.myshop.model.exception.ParameterException;
import com.czg.myshop.model.http.ReturnBean;
import com.czg.myshop.model.http.ReturnMap;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExceptionResolver implements HandlerExceptionResolver {
    private static final int TYPE_JSON = 0;
    private static final int TYPE_VIEW = 1;

    public ExceptionResolver() {
    }

    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        ex.printStackTrace();
        int type = TYPE_VIEW;
        if (handler instanceof HandlerMethod) {
            HandlerMethod method = (HandlerMethod) handler;
            ResponseBody responseBody = method.getMethod().getAnnotation(ResponseBody.class);
            if (responseBody != null) {//json 接口请求
                type = TYPE_JSON;
            }
        }
        ModelAndView mv = new ModelAndView();
        ReturnBean returnBean = handleException(ex);

        if (type == TYPE_JSON) {
            FastJsonJsonView view = new FastJsonJsonView();
            Map<String, Object> attributes = new HashMap<String, Object>();
            attributes.put("code", returnBean.getCode());
            attributes.put("msg", returnBean.getMsg());
            attributes.put("obj", returnBean.getObj());
            view.setAttributesMap(attributes);
            mv.setView(view);
        } else {

        }



                /*  使用FastJson提供的FastJsonJsonView视图返回，不需要捕获异常   */


        return mv;


    }


    private ReturnBean handleException(Exception exception) {
        if (exception instanceof BusinessException) {
            return ReturnMap.BUSINESS_ERROR(exception.getMessage());
        } else if (exception instanceof FailException) {
            return ReturnMap.FAIL(exception.getMessage());
        } else if (exception instanceof ParameterException) {
            return ReturnMap.PARAMETER_ERROR();
        } else if (exception instanceof IllegalStateException ){
            //java.lang.IllegalStateException:Optional int parameter 'type' is present but cannot be translated into a null value due to being declared as a primitive type. Consider declaring it as object wrapper for the corresponding primitive type.
            return ReturnMap.PARAMETER_ERROR();
        }else {
            return ReturnMap.SYSTEM_ERROR(TextUtils.isEmpty(exception.getMessage()) ? exception.toString() : exception.getMessage());

        }
    }
}
