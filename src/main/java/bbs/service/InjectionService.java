package bbs.service;

import java.io.IOException;

import org.apache.ibatis.ognl.Ognl;
import org.apache.ibatis.ognl.OgnlContext;
import org.apache.ibatis.ognl.OgnlException;
import org.springframework.stereotype.Service;

import bbs.form.InjectionForm;

@Service
public class InjectionService {
    public String doOsi(InjectionForm form) {
        String osi = form.getOsInjection();
        OgnlContext ctx = new OgnlContext();
        String result = "";
        try {
            Object expr = Ognl.parseExpression(osi.replaceAll("Math\\.", "@Math@"));
            result = String.valueOf(Ognl.getValue(expr, ctx));
        } catch (OgnlException e) {
            if (e.getReason() != null) {
                result = e.getReason().getMessage();
            }
        }
        return result;
    }

}