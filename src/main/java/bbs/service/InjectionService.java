package bbs.service;

import java.io.IOException;

import org.springframework.stereotype.Service;

import bbs.form.InjectionForm;

@Service
public class InjectionService {
    public String doOsi(InjectionForm form) {
        String osi = form.getOsInjection();
        Runtime r = Runtime.getRuntime();
        String result = "";
        try {
            Process p = r.exec(osi);
            p.waitFor();
            result = "実行したコマンド：" + osi;
        } catch (IOException  e) {
            if (e.getMessage() != null) {
                result = e.getMessage();
            }
        } catch (InterruptedException  e) {
            if (e.getMessage() != null) {
                result = e.getMessage();
            }
        }
        return result;
    }

}