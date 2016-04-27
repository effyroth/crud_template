package ${packageName}.service;

import java.util.List;
import ${packageName}.model.${ClassName};

public interface ${ClassName}Service {

	public List<${ClassName}> getAll();
	public ${ClassName} getBy${PrimaryKey}(${primaryKeyType} ${primaryKey});
	public void insert(${ClassName} ${className});
	public void update(${ClassName} ${className});
	public void delete(${primaryKeyType} ${primaryKey});
}