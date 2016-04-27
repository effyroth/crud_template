package ${packageName}.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import ${packageName}.constant.Const;
import ${packageName}.model.${ClassName};
import ${packageName}.service.${ClassName}Service;

@RequestMapping(value="/${className}")
@Controller
public class ${ClassName}Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(${ClassName}Controller.class);
	
	@Autowired
	private ${ClassName}Service ${className}Service;
	
	
	@RequestMapping(value="/", method=RequestMethod.GET)
    public String list(HttpServletRequest request){
		try {
			List<${ClassName}> list = ${className}Service.getAll();
			request.setAttribute("list", list);
		} catch (Exception e) {
			logger.error("", e);
		}
        return "${className}";
    }
	
	@RequestMapping(value="/get", method=RequestMethod.GET)
	@ResponseBody
    public Map<String,Object> get(@RequestParam("${primaryKey}") ${primaryKeyType} ${primaryKey}){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			${ClassName} ${className} = ${className}Service.getBy${PrimaryKey}(${primaryKey});

            map.put("${className}", ${className});
			map.put(Const.STATUS, Const.SUCCESS);
		} catch (Exception e) {
			logger.error("", e);
			map.put(Const.STATUS, Const.FAILURE);
			map.put(Const.ERROR_MESSAGE, Const.GET_EXCEPTION);
		}
        return map;
    }
    
    @RequestMapping(value="/create", method=RequestMethod.POST)
	@ResponseBody
    public Map<String,Object> create(@ModelAttribute ${ClassName} ${className}){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			${className}Service.insert(${className});
			map.put("${className}", ${className});
			map.put(Const.STATUS, Const.SUCCESS);
		} catch (Exception e) {
			logger.error("", e);
			map.put(Const.STATUS, Const.FAILURE);
			map.put(Const.ERROR_MESSAGE, Const.CREATE_EXCEPTION);
		}
        return map;
    }
    @RequestMapping(value="/update", method=RequestMethod.PUT)
	@ResponseBody
    public Map<String,Object> update(@ModelAttribute ${ClassName} ${className}){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			${ClassName} old${ClassName} = ${className}Service.getBy${PrimaryKey}(${className}.get${PrimaryKey}());
${updateAssignValue}
			${className}Service.update(old${ClassName});
			map.put("${className}", ${className});
			map.put(Const.STATUS, Const.SUCCESS);
		} catch (Exception e) {
			logger.error("", e);
			map.put(Const.STATUS, Const.FAILURE);
			map.put(Const.ERROR_MESSAGE, Const.UPDATE_EXCEPTION);
		}
        return map;
    }
    @RequestMapping(value="/delete", method=RequestMethod.DELETE)
	@ResponseBody
    public Map<String,Object> delete(@RequestParam("id") ${primaryKeyType} ${primaryKey}){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			${className}Service.delete(${primaryKey});
			map.put(Const.STATUS, Const.SUCCESS);
		} catch (Exception e) {
			logger.error("", e);
			map.put(Const.STATUS, Const.FAILURE);
			map.put(Const.ERROR_MESSAGE, Const.DELETE_EXCEPTION);
		}
        return map;
    }
}