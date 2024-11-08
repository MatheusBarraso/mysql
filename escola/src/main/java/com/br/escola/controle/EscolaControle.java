package com.br.escola.controle;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
@Controller
@RequestMapping("/escola")
public class EscolaControle{
    @RequestMapping (value="/inicio", method = RequestMethod.GET)
    public String inicio(){
        return "home";
    }

    @RequestMapping (value="/faleConosco", method = RequestMethod.GET)
    public @ResponseBody String faleConosco(){
        return"Entre em contato através dos nossos canais de atendimento!";
    }

    @RequestMapping (value="/servicos", method = RequestMethod.GET)
    public String servicos(){
        return "servicos";
    }

    @RequestMapping (value="/contato", method = RequestMethod.GET)
    public String contato(){
        return "contato";
    }

    @RequestMapping (value="/sobre", method = RequestMethod.GET)
    public String sobre(){
        return "sobre";
    }

}
