package bbs.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import bbs.form.InjectionForm;

@Service
public class InjectionService {
    public String doOsi(InjectionForm form) {
        String osi = form.getOsInjection();
        Runtime r = Runtime.getRuntime();
        String result = "";
        try {
            String[] cmd = { "/bin/sh", "-c", osi };
            Process p = r.exec(cmd);
            p.waitFor();
            BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
            ArrayList list = new ArrayList();
            for (String line = br.readLine(); line != null; line = br.readLine()) {
                list.add(line);
            }
            result = "実行したコマンド：" + osi + "\r\n実行結果：" + list.toString();
        } catch (IOException e) {
            if (e.getMessage() != null) {
                result = e.getMessage();
            }
        } catch (InterruptedException e) {
            if (e.getMessage() != null) {
                result = e.getMessage();
            }
        }
        return result;
    }

    public String doPathTraversal(InjectionForm form) {
        try {
            String pt = form.getPathTraversal();
            Runtime r = Runtime.getRuntime();
            String[] cmd = { "/bin/sh", "-c","cat " + pt};
            Process p = r.exec(cmd);
            p.waitFor();
            BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
            ArrayList list = new ArrayList();
            for (String line = br.readLine(); line != null; line = br.readLine()) {
                list.add(line);
            }
            return list.toString();
        } catch (Exception e) {
            return e.getMessage();
        }
    }
}