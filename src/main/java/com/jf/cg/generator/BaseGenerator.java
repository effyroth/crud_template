package com.jf.cg.generator;

import java.util.List;
import java.util.Map;

import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import com.jf.cg.util.DBUtils;
import com.jf.cg.util.FileUtils;
import com.jf.cg.util.PropertiesUtils;
import com.jf.cg.util.StringUtils;
import org.springframework.util.CollectionUtils;

public class BaseGenerator {

	public static String generate(String template, String tableName) {
		String content = FileUtils.getTemplate(template);
		
		Map<String,String> pMap = DBUtils.getPrimaryKey(tableName);
		String replacedContent = null;
		String ClassName = StringUtils.firstUpperAndNoPrefix(tableName);
		String className = StringUtils.formatAndNoPrefix(tableName);
		String packageName = PropertiesUtils.getPackage();
		String primaryKeyType = pMap.get("primaryKeyType");
		String primaryKey = StringUtils.format(pMap.get("primaryKey"));
		String PrimaryKey = StringUtils.firstUpperNoFormat(primaryKey);
		if(primaryKey!=null){
			replacedContent = content.replaceAll("[$][{]ClassName}", ClassName)
					.replaceAll("[$][{]className}", className)
					.replaceAll("[$][{]packageName}", packageName)
					.replaceAll("[$][{]primaryKeyType}", primaryKeyType)
					.replaceAll("[$][{]}", primaryKeyType)
					.replaceAll("[$][{]primaryKey}", primaryKey)
					.replaceAll("[$][{]PrimaryKey}", PrimaryKey)
					.replaceAll("[$][{]tableName}", tableName)
                    .replaceAll("[$][{]allField}", getAllField(tableName))
                    .replaceAll("[$][{]allFieldMod}", getAllFieldMod(tableName))
                    .replaceAll("[$][{]allFieldNoId}", getAllFieldNoId(tableName))
                    .replaceAll("[$][{]allFieldModNoId}", getAllFieldModNoId(tableName))
                    .replaceAll("[$][{]allFieldForUpdateMod}", getAllFieldForUpdateMod(tableName));
        }


		
		return replacedContent;
	}

    public static String getAllField(String tableName) {
        return Joiner.on(",").join(DBUtils.getColumnNameList(tableName));
    }

    public static String getAllFieldMod(String tableName) {
        List<String> list = DBUtils.getColumnNameList(tableName);
        list.remove("ctime");
        list.remove("utime");
        return "#{" + Joiner.on("},#{").join(list) + "},unix_timestamp(),unix_timestamp()";
    }

    public static String getAllFieldNoId(String tableName) {
        List<String> list = DBUtils.getColumnNameList(tableName);
        list.remove("id");
        list.remove("ctime");
        list.remove("utime");
        return Joiner.on(",").join(list) + ",ctime,utime";
    }

    public static String getAllFieldModNoId(String tableName) {
        List<String> list = DBUtils.getColumnNameList(tableName);
        list.remove("id");
        list.remove("ctime");
        list.remove("utime");
        List<String> newList = Lists.newArrayList();
        for (String name : list) {
            newList.add("#{" + name + "}");
        }
        return Joiner.on(",").join(newList) + ",unix_timestamp(),unix_timestamp()";
    }

    public static String getAllFieldForUpdateMod(String tableName) {
        List<String> list = DBUtils.getColumnNameList(tableName);
        list.remove("id");
        list.remove("ctime");
        list.remove("utime");
        List<String> newList = Lists.newArrayList();
        for (String name : list) {
            newList.add(name + "=#{" + name + "}");
        }
        return Joiner.on(",").join(newList) + ",utime=unix_timestamp()";
    }
}
