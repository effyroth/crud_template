package ${packageName}.dao;

import java.util.List;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import ${packageName}.model.${ClassName};

@Component
public interface ${ClassName}Dao {

    public final static String tableName = "${tableName}";
    public final static String allField = "${allField}";
    public final static String allFieldMod = "${allFieldMod}";
    public final static String allFieldNoId = "${allFieldNoId}";
    public final static String allFieldModNoId = "${allFieldModNoId}";
    public final static String allFieldForUpdateMod = "${allFieldForUpdateMod}";

    @Select("select * from " + tableName)
	List<${ClassName}> getAll();

    @Select("select " + allField + " from " + tableName + " where ${primary_key} = #{${primary_key}}")
	${ClassName} getBy${PrimaryKey}(@Param("${primary_key}") ${primaryKeyType} ${primaryKey});

    @Insert("insert into " + tableName + " (" + allFieldNoId + ") " + " values (" + allFieldModNoId +  ")")
    @Options(useGeneratedKeys = true)
	void insert(${ClassName} ${className});

    @Update("update " + tableName + " set " + allFieldForUpdateMod  + " where ${primary_key} = #{${primary_key}}")
	void update(${ClassName} ${className});

    @Delete("delete from " + tableName + " where ${primary_key} = #{${primary_key}}")
	void delete(@Param("${primary_key}") ${primaryKeyType} ${primaryKey});

}
