package bbs.service;

import java.io.IOException;

import org.springframework.stereotype.Service;

import bbs.form.InjectionForm;

@Service
public class InjectionService {
    public void doOsi(InjectionForm form) {
        String osi = form.getOsInjection();
        String[] Command = { "cmd", "/c", "notepad.exe"}; // 起動コマンドを指定する
        Runtime runtime = Runtime.getRuntime(); // ランタイムオブジェクトを取得する
        try {
            runtime.exec(Command); // 指定したコマンドを実行する
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}