package bbs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bbs.form.InjectionForm;
import bbs.service.InjectionService;

@Controller
public class InjectionController {
    @Autowired
    private InjectionService injectionService;

    @RequestMapping(value = "/injection", method = RequestMethod.GET)
    public String viewInjection(Model model, InjectionForm form) {
        model.addAttribute("title", "インジェクションテスト");
        model.addAttribute("injection", form);
        return "injection";
    }

    @RequestMapping(value = "/osInjection", method = RequestMethod.POST)
    public String osInjection(Model model, InjectionForm form) {
        model.addAttribute("title", "インジェクションテスト");
        form.setResult(injectionService.doOsi(form));
        model.addAttribute("injection", form);
        return "injection";
    }

    @RequestMapping(value = "/pathTraversal", method = RequestMethod.POST)
    public String pathTraversal(Model model, InjectionForm form) {
        model.addAttribute("title", "インジェクションテスト");
        form.setResult(injectionService.doPathTraversal(form));
        model.addAttribute("injection", form);
        return "injection";
    }
}