package ${packageName}.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${packageName}.dao.${ClassName}Dao;
import ${packageName}.model.${ClassName};
import ${packageName}.service.${ClassName}Service;

@Service
public class ${ClassName}ServiceImpl implements ${ClassName}Service {
    @Autowired
	private ${ClassName}Dao ${className}Dao;
	
	public List<${ClassName}> getAll(){
		return ${className}Dao.getAll();
	}
	public ${ClassName} getBy${PrimaryKey}(${primaryKeyType} ${primaryKey}){
		return ${className}Dao.getBy${PrimaryKey}(${primaryKey});
	}
	public void insert(${ClassName} ${className}){
		${className}Dao.insert(${className});
	}
	public void update(${ClassName} ${className}){
		${className}Dao.update(${className});
	}
	public void delete(${primaryKeyType} ${primaryKey}){
		${className}Dao.delete(${primaryKey});
	}

}
