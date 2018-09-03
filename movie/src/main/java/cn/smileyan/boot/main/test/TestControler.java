package cn.smileyan.boot.main.test;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
public class TestControler {

	@RequestMapping("test")
	public String test() {
		System.out.println("this is visited");
		return "<h1>Hello 师枢！</h1>";
	}
}
